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
        self.title = NSLocalizedString(@"Fourth", @"Fourth");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];

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

- (void)viewDidLoad
{
    [super viewDidLoad];
//    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:
//                                [NSURL URLWithString:@"http://www.google.com"]];
    
    [self.webView loadHTMLString:@"<html><head><title>Google</title></head>\
     <body><h1>Google header</h1>\
     <div class='menu'><span class='heading'>Heading</span></div>\
     A\
     <ul>\
     <li>one\
     <li>two\
     <li>one\
     <li>two\
     <li>one\
     <li>two\
     <li>one\
     <li>two\
     <li>one\
     <li>two\
     <li>one\
     <li>two\
     <li>one\
     <li>two\
     <li>one\
     <li>two\
     <li>one\
     <li>two\
     <li>one\
     <li style='display:none'>ten\
     <li><a href='http://www.googl.com'>link</a>\
     <li>Googles phase\
     </ul></body>" 
    
                         baseURL:[NSURL URLWithString:@"http://localhost:8080"]];

    // Do any additional setup after loading the view from its nib.
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
    [self performSelector:@selector(findIt) withObject:nil afterDelay:2];
    [self performSelector:@selector(clickIt) withObject:nil afterDelay:5];    

}

-(void)findIt{

//
//    NSArray* arr = [NDWebElement findElementsBy:kByXpath value:@"/html/body//*[contains(text(),'ten')]" maxCount:kFindEverything webView:self.webView];
//    NDWebElement* el = [arr objectAtIndex:0];
//    NSLog(@"eltext: %@",el.text);
//    NSLog(@"eltagname: %@",el.tagName);    
//    NSLog(@"vis: %@", [el isDisplayed]?@"YES":@"NO");
//    NSLog(@"RES: %@",arr);
    
}

-(void) clickIt {
//    NSArray* arr = [NDWebElement findElementsBy:kByXpath value:@"/html/body//*[contains(text(),'link')]" maxCount:kFindEverything webView:self.webView];
//    NDWebElement* el = [arr objectAtIndex:0];
//    NSLog(@"eltext: %@",el.text);
//    NSLog(@"eltagname: %@",el.tagName);    
//    NSLog(@"vis: %@", [el isDisplayed]?@"YES":@"NO");
//    NSLog(@"RES: %@",arr);
//    [el click];
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
