//
//  LPFourthViewController.m
//  LPSimpleExample
//
//  Created by Karl Krukow on 23/10/11.
//  Copyright (c) 2011 Trifork. All rights reserved.
//

#import "LPFourthViewController.h"

@implementation LPFourthViewController
@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSString *title = NSLocalizedString(@"Fourth", @"Fourth");
        UIImage *image = [UIImage imageNamed:@"cat"];
        UIImage *selected = [UIImage imageNamed:@"cat-selected"];
        self.tabBarItem = [[[UITabBarItem alloc]
                            initWithTitle:title
                            image:image
                            selectedImage:selected] autorelease];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"page"
                                                     ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:path];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];

}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (void)dealloc {
    [webView release];
    [super dealloc];
}
@end
