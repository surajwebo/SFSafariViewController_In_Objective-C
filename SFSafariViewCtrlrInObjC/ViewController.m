//
//  ViewController.m
//  SFSafariViewCtrlrInObjC
//
//  Created by Suraj on 30/09/15.
//  Copyright © 2015 Suraj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    SFSafariViewController *sfSafariViewController;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:NO];

    void (^loadSFSafariViewControllerBlock)(NSURL *) = ^(NSURL *url) {
        sfSafariViewController = [[SFSafariViewController alloc] initWithURL:url entersReaderIfAvailable:YES];
        sfSafariViewController.delegate = self;
        [self presentViewController:sfSafariViewController animated:YES completion:nil];
    };
    NSURL *url = [NSURL URLWithString:@"http://objectivecwithsuraj.blogspot.com/"];
    loadSFSafariViewControllerBlock(url);
}

#pragma mark - SFSafariViewController Delegate Methods
-(void)safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)didLoadSuccessfully {
    // Load finished
    if (didLoadSuccessfully) {
        NSLog(@"SafariViewController: Loading of URl finished");
    }
}

-(void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
    // Done button pressed
    NSLog(@"safariViewController: Done button pressed");
    [sfSafariViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
