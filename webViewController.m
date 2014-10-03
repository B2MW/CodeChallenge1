//
//  webViewController.m
//  CodeChallenge1
//
//  Created by Bradley Walker on 10/2/14.
//  Copyright (c) 2014 BlackSummerVentures. All rights reserved.
//

#import "webViewController.h"

@interface webViewController () <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UINavigationItem *navBarTitle;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property NSString *defaultPageURL;
@end

@implementation webViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.defaultPageURL = @"http://www.mobilemakers.co";
    [self loadPage:self.defaultPageURL];
    self.navBarTitle.title = self.title;
}

- (void) loadPage:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.spinner startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.spinner stopAnimating];
}

@end
