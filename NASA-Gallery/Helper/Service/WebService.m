#import "WebService.h"

@implementation WebService

+ (id)shared {
    static WebService *shared = nil;
    @synchronized(self) {
        if (shared == nil)
            shared = [[self alloc] init];
    }
    return shared;
}

- (id)init {
    if (self = [super init]) {}
    return self;
}

-(void)getAstronomyPictureOfTheDay:(void (^)(NSArray *array, NSString *errorString))completionHandler {
    NSDictionary *parameters = @{
                                @"api_key": DEMO_KEY,
                                @"count": @5
                                };
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET: BASE_URL
      parameters: parameters
         headers: nil
        progress: nil
         success: ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
        NSArray *pictures = [MTLJSONAdapter modelsOfClass: Picture.class
                                            fromJSONArray: responseObject
                                                    error: nil];
        completionHandler(pictures, @"");
    }
         failure: ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHandler(@[], error.localizedDescription);
    }];
}

-(void)dealloc {}

@end
