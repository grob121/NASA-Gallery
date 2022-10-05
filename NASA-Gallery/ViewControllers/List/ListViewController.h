#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "WebService.h"
#import "PictureTableViewCell.h"

@interface ListViewController: UIViewController<UITableViewDelegate, UITableViewDataSource> {
    NSArray *astronomyPictures;
    UIActivityIndicatorView *activityIndicator;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
