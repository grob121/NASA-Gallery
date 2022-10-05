#import <UIKit/UIKit.h>
#import "Picture.h"

@interface DetailViewController: UIViewController {
    UIActivityIndicatorView *activityIndicator;
}

@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
@property (weak, nonatomic) IBOutlet UILabel *pictureTitle;
@property (weak, nonatomic) IBOutlet UILabel *pictureExplanation;
@property (strong, nonatomic) Picture *pictureDetail;

@end
