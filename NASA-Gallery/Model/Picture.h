#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface Picture: MTLModel<MTLJSONSerializing>

@property (readonly, nonatomic, copy, nullable) NSString *copyright;
@property (readonly, nonatomic, copy, nonnull) NSString *imageDate;
@property (readonly, nonatomic, copy, nonnull) NSString *explanation;
@property (readonly, nonatomic, copy, nonnull) NSString *hdurl;
@property (readonly, nonatomic, copy, nonnull) NSString *mediaType;
@property (readonly, nonatomic, copy, nonnull) NSString *serviceVersion;
@property (readonly, nonatomic, copy, nonnull) NSString *title;
@property (readonly, nonatomic, copy, nonnull) NSString *imageUrl;

@end
