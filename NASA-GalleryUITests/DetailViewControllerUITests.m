#import <XCTest/XCTest.h>

@interface DetailViewControllerUITests : XCTestCase

@end

@implementation DetailViewControllerUITests

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
    
    XCUIElement *pictureTableView = app.tables[@"pictureTableView"];
    XCUIElement *pictureCell = pictureTableView.cells[@"pictureCell"];
    [[pictureCell firstMatch] tap];

    XCUIElement *navigationBar = app.navigationBars[@"navigationBar"];
    XCUIElement *pictureTitleLabel = app.staticTexts[@"pictureDetailTitle"];
    XCUIElement *pictureExplanationLabel = app.staticTexts[@"pictureExplanation"];
    XCUIElement *pictureImageView = app.images[@"pictureDetailImage"];
    
    XCTAssertTrue(navigationBar.exists);
    XCTAssertTrue(pictureTitleLabel.exists);
    XCTAssertTrue(pictureExplanationLabel.exists);
    XCTAssertTrue(pictureImageView.exists);
}

@end
