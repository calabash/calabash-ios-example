//
//  LPFirstViewController.h
//  LPSimpleExample
//
//  Created by Karl Krukow on 07/10/11.
//  Copyright (c) 2011 Trifork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPFirstViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIButton *button;

@property (strong, nonatomic) IBOutlet UISwitch *uiswitch;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segControl;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UILabel *result;
@end
