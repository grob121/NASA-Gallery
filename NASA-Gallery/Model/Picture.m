#import "Picture.h"

@implementation Picture

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"copyright": @"copyright",
        @"imageDate": @"date",
        @"explanation": @"explanation",
        @"hdurl": @"hdurl",
        @"mediaType": @"media_type",
        @"serviceVersion": @"service_version",
        @"title": @"title",
        @"imageUrl": @"url",
    };
}

@end
