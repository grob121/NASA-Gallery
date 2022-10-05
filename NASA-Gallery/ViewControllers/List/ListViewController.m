#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getAstronomyPictureOfTheDay];
    [self setUpTableView];
}

// MARK: API
- (void)getAstronomyPictureOfTheDay {
    [[WebService shared] getAstronomyPictureOfTheDay:^(NSArray *array, NSString *errorString) {
        if ([errorString length] == 0 && [array count] != 0) {
            self->astronomyPictures = array;
            [self.tableView reloadData];
        } else {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle: NSLocalizedString(@"alert_error_title", @"")
                                                                           message: errorString
                                                                    preferredStyle:UIAlertControllerStyleAlert];

            UIAlertAction *defaultAction = [UIAlertAction actionWithTitle: NSLocalizedString(@"alert_ok_button", @"")
                                                                    style: UIAlertActionStyleDefault
                                                                  handler: ^(UIAlertAction * action) {}];
            [alert addAction: defaultAction];
            [self presentViewController: alert animated: true completion: nil];
        }
    }];
}

// MARK: TableView Delegate, Datasource
- (void)setUpTableView {
    [self.tableView registerNib: [UINib nibWithNibName: @"PictureTableViewCell"
                                               bundle: nil]
         forCellReuseIdentifier: @"pictureCell"];
    _tableView.accessibilityIdentifier = @"pictureTableView";
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return astronomyPictures.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PictureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"pictureCell"];
    cell.isAccessibilityElement = YES;
    cell.accessibilityIdentifier = @"pictureCell";
    cell.pictureTitle.accessibilityIdentifier = @"cellTitle";
    cell.pictureDate.accessibilityIdentifier = @"cellDate";
    cell.pictureImageView.accessibilityIdentifier = @"cellImage";
    cell.pictureTitle.text = [astronomyPictures[indexPath.row] title];
    cell.pictureDate.text = [astronomyPictures[indexPath.row] imageDate];
      
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [self->astronomyPictures[indexPath.row] imageUrl]]];;
        dispatch_async(dispatch_get_main_queue(), ^{
            [cell.activityIndicator stopAnimating];
            if (imageData == nil) {
                return;
            } else {
                cell.pictureImageView.image = [UIImage imageWithData: imageData];
            }
        });
    });
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName: @"Main" bundle: nil];
    DetailViewController *controller = [storyboard instantiateViewControllerWithIdentifier: @"DetailViewController"];
    controller.pictureDetail = astronomyPictures[indexPath.row];
    [self.navigationController pushViewController: controller animated: true];
}

@end
