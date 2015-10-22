//
//  LPFirstViewController.m
//  LPSimpleExample
//
//  Created by Karl Krukow on 07/10/11.
//  Copyright (c) 2011 Trifork. All rights reserved.
//

#import "LPFirstViewController.h"

@implementation LPFirstViewController

@synthesize button;
@synthesize uiswitch;
@synthesize segControl;
@synthesize textField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSString *title = NSLocalizedString(@"First", @"First");
        UIImage *image = [UIImage imageNamed:@"elephant"];
        UIImage *selected = [UIImage imageNamed:@"elephant-selected"];
        self.tabBarItem = [[[UITabBarItem alloc]
                            initWithTitle:title
                            image:image
                            selectedImage:selected] autorelease];
    }
    return self;
}

-(void) viewDidLoad {
    [super viewDidLoad];
    self.uiswitch.isAccessibilityElement = YES;
    self.uiswitch.accessibilityLabel = @"switch";

    self.button.isAccessibilityElement = YES;
    self.button.accessibilityLabel=@"login";
}
							
- (BOOL)textFieldShouldReturn:(UITextField *)_textField {
    [_textField resignFirstResponder];
    return YES;

}          
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}
- (IBAction)tl:(id)sender {
  self.result.text = @"tl";
  
}
- (IBAction)tr:(id)sender {
    self.result.text = @"tr";
}
- (IBAction)br:(id)sender {
    self.result.text = @"br";
}
- (IBAction)bl:(id)sender {
    self.result.text = @"bl";
}

- (void)dealloc {
    [textField release];
    [segControl release];

    [uiswitch release];
    [button release];
  [_result release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTextField:nil];
    [self setSegControl:nil];

    [self setUiswitch:nil];
    [self setButton:nil];
    [super viewDidUnload];
}
@end
