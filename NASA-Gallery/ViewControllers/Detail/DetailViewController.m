#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setIdentifiers];
    
    [self displayLoadingView: _pictureImageView];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL: [NSURL URLWithString: self->_pictureDetail.hdurl]];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self hideLoadingView];
            if (imageData == nil) {
                return;
            } else {
                self->_pictureImageView.image = [UIImage imageWithData: imageData];
            }
        });
    });
    
    _pictureTitle.text = _pictureDetail.title;
    _pictureExplanation.text = _pictureDetail.explanation;
}

// MARK: Accessibility
- (void)setIdentifiers {
    _pictureTitle.accessibilityIdentifier = @"pictureDetailTitle";
    _pictureExplanation.accessibilityIdentifier = @"pictureExplanation";
    _pictureImageView.accessibilityIdentifier = @"pictureDetailImage";
}

// MARK: Activity Indicator
- (void)displayLoadingView:(UIImageView *)imageView {
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleLarge];
    [imageView addSubview: activityIndicator];
    activityIndicator.center = [imageView convertPoint:imageView.center fromView:imageView.superview];
    [activityIndicator startAnimating];
}

- (void)hideLoadingView {
    [activityIndicator removeFromSuperview];
}

@end
