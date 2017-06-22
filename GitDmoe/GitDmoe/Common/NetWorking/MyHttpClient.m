//
//  MyHttpClient.m
//  GitDmoe
//
//  Created by luo on 2017/6/22.
//  Copyright © 2017年 VCredit. All rights reserved.
//

#import "MyHttpClient.h"
#import <AFHTTPSessionManager.h>
#import <AFNetworkActivityIndicatorManager.h>


@interface MyHttpClient()
@property(nonatomic, strong) AFHTTPSessionManager *manager;
@property(nonatomic, strong) NSString *baseUrl;
@property(nonatomic, strong) NSString *host;
@property(nonatomic, strong) NSString *api;


@end

@implementation MyHttpClient

static MyHttpClient *instance;

+(instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

-(AFHTTPSessionManager *)manager
{
    if (_manager == nil) {
        _manager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:MyHostUrl]];
        [_manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        [_manager.requestSerializer  willChangeValueForKey:@"timeoutInterval"];
        _manager.requestSerializer.timeoutInterval = 18.0f;
        [_manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        _manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json",@"text/html",nil];
    }
    return _manager;
}

-(void)setRequestHeaderField:(NSString *)accessToken
{
    [self.manager.requestSerializer setValue:accessToken forHTTPHeaderField:@"accessToken"];
}

-(NSString *)baseUrl
{
    if (_baseUrl == nil) {
        _baseUrl =  [NSString stringWithFormat:@"%@",_host];
        
    }
    return _baseUrl;
}

- (NSString *)host
{
    if (_host == nil) {
        _host = MyHostUrl;
    }
    return  _host;
}

//- (NSString *)assembledUrl:(NSString *)urlStr
//{
//    NSURL *url = [NSURL URLWithString:urlStr];
//    if (url.host && url.scheme) {
//        return urlStr;
//    }
//    else{
//        return [NSString stringWithFormat:@"%@%@",self.baseUrl,urlStr];
//    }
//    
//    
//}

- (void)cancelOperations
{
    [self.manager.operationQueue cancelAllOperations];
    for (NSURLSessionTask *task in self.manager.tasks)
    {
        [task cancel];
    }
}

- (void)setReachableMonitorOn:(BOOL)isOn
{
    AFNetworkReachabilityManager  *manager = [AFNetworkReachabilityManager sharedManager];
    if (isOn) {
        [manager startMonitoring];
        [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            
        }];
    }
    else
    {
        [manager stopMonitoring];
    }
}
- (void)setActivityIndicatorVisible:(BOOL)visible
{
    AFNetworkActivityIndicatorManager *manager = [AFNetworkActivityIndicatorManager sharedManager];
    [manager setEnabled:visible];
}


-(void)getUrl:(NSString *)url
{
    [self  getUrl:url class:nil completion:nil];
}

-(void)getUrl:(NSString *)url class:(Class)classVC completion:(void(^)(id))completion
{
    [self  getUrl:url params:nil class:classVC completion:nil];
}

-(void)getUrl:(NSString *)url params:(NSDictionary *)params class:(Class)classVC completion:(void(^)(id))completion
{
    [self   getUrl:url params:params completion:completion class:classVC error:nil];
}


- (void)getUrl:(NSString *)url params:(NSDictionary *)params completion:(void (^)(id))completion class:(Class)classVC error:(void(^)(NSError *))error
{
    [self.manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

-(void)postUrl:(NSString *)url
{
    [self postUrl:url completion:nil];
}

-(void)postUrl:(NSString *)url completion:(void(^)(id))completion
{
    [self postUrl:url class:nil completion:completion];
}

-(void)postUrl:(NSString *)url class:(Class)classVC completion:(void(^)(id))completion
{
    [self postUrl:url class:classVC params:nil completion:completion];
}

-(void)postUrl:(NSString *)url class:(Class)classVC params:(NSDictionary *)params completion:(void(^)(id))completion
{
    [self postUrl:url class:classVC params:params completion:completion error:nil];
 
}

-(void)postUrl:(NSString *)url class:(Class)classVC params:(NSDictionary *)params completion:(void(^)(id))completion error:(void(^)(NSError *))error
{
    [self postUrl:url class:classVC params:params completion:completion error:error exception:nil];
}

-(void)postUrl:(NSString *)url class:(Class)classVC params:(NSDictionary *)params completion:(void(^)(id))completion error:(void(^)(NSError *))failure exception:(void(^)())exception
{
    [self.manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
      
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self success:task responseObject:responseObject class:classVC completion:completion exception:exception error:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self failure:task httpError:error class:classVC compleion:completion error:failure];
    }];
}





-(void)success:(NSURLSessionTask *)task responseObject:(id)responseObjct class:(Class)class completion:(void (^)(id))completion exception:(void(^)())exception error:(void(^)(NSError *))error
{
    NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
    NSDictionary *headerDic = response.allHeaderFields;
    if ([headerDic.allKeys containsObject:@"newAccessToken"]) {
        [self setRequestHeaderField:@"newAccessToken"];
    }
    NSDictionary *dic = responseObjct;
    if (!exception && self.delegate && [self.delegate respondsToSelector:@selector(httpClient:filterResponse:error:)]) {
        [self.delegate httpClient:self filterResponse:dic error:nil];
        return;
    }
//    if (!exception && [dic[@"status"] isEqualToString:@"007"] )
//    {
//        if ([self.delegate httpClient:self filterResponse:dic error:nil])
//        {
//            return;
//        }
//    }
    
    if ([class isSubclassOfClass:[NSDictionary class]]) {
        completion(dic);
    }else if ([class isSubclassOfClass:[NSObject class]])
    {
        
    }
    

 
    
}

-(void)failure:(NSURLSessionTask *)task httpError:(id)httpError class:(Class)class compleion:(void(^)(id))completion  error:(void(^)(NSError *))error
{
    [self resetNetworkActivityIndicator];
    if (error) {
        error(nil);
        NSLog(@"未知错误");
    }
    
}

-(void)resetNetworkActivityIndicator
{
    [[AFNetworkActivityIndicatorManager sharedManager] setValue:@0 forKey:@"activityCount"];
    
}





@end
