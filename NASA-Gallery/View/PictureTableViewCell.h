#import <UIKit/UIKit.h>

@interface PictureTableViewCell: UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
@property (weak, nonatomic) IBOutlet UILabel *pictureTitle;
@property (weak, nonatomic) IBOutlet UILabel *pictureDate;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
