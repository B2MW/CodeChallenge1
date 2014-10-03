//
//  ViewController.m
//  CodeChallenge1
//
//  Created by Bradley Walker on 10/2/14.
//  Copyright (c) 2014 BlackSummerVentures. All rights reserved.
//

#import "ViewController.h"
#import "webViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *valueOne;
@property (strong, nonatomic) IBOutlet UITextField *valueTwo;
@property (strong, nonatomic) IBOutlet UINavigationItem *navBarTitle;
@property (strong, nonatomic) IBOutlet UIButton *navBarButton;

@property int finalValue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavButtonState];
}

- (IBAction)performCalculation:(id)sender {
    self.finalValue= self.valueOne.text.intValue * self.valueTwo.text.intValue;
    self.navBarTitle.title = [NSString stringWithFormat:@"%i",self.finalValue];
    [self.valueOne resignFirstResponder];
    [self.valueTwo resignFirstResponder];

    [self setNavButtonState];
    NSLog(@"%d", self.navBarButton.enabled);
}

- (void) setNavButtonState {
    if ((self.finalValue %5 == 0) && (self.finalValue != 0)) {
        self.navBarButton.enabled = YES;
    } else self.navBarButton.enabled = NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    webViewController *nextPage = [segue destinationViewController];
    nextPage.title = self.navBarTitle.title;
//    [segue destinationViewController];
}

@end
