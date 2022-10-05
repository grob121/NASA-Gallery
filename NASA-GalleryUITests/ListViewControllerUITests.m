#import <XCTest/XCTest.h>

@interface ListViewControllerUITests : XCTestCase

@end

@implementation ListViewControllerUITests

- (void)setUp {
    [super setUp];

    self.continueAfterFailure = NO;
    [[[XCUIApplication alloc] init] launch];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testELements {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    XCUIElement *navigationBar = app.navigationBars[@"navigationBar"];
    XCUIElement *pictureTableView = app.tables[@"pictureTableView"];
    XCUIElement *pictureCell = pictureTableView.cells[@"pictureCell"];
    XCUIElement *cellTitlelabel = pictureCell.staticTexts[@"cellTitle"];
    XCUIElement *cellDateLabel = pictureCell.staticTexts[@"cellDate"];
    XCUIElement *cellImageView = pictureCell.images[@"cellImage"];
    
    XCTAssertTrue(navigationBar.exists);
    XCTAssertTrue([pictureCell waitForExistenceWithTimeout: 5]);
    XCTAssertTrue(pictureCell.exists);
    XCTAssertTrue(cellTitlelabel.exists);
    XCTAssertTrue(cellDateLabel.exists);
    XCTAssertTrue(cellImageView.exists);
}

@end
