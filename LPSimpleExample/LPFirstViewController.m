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
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
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

- (void)dealloc {
    [textField release];
    [segControl release];

    [uiswitch release];
    [button release];
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
