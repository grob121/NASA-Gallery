#import <foundation/Foundation.h>
#import "AFNetworking/AFNetworking.h"
#import "Picture.h"
#import "Mantle.h"
#import "Router.h"

@interface WebService: NSObject

+(WebService *)shared;

-(void)getAstronomyPictureOfTheDay:(void (^)(NSArray *array, NSString *errorString))completionHandler;

@end
