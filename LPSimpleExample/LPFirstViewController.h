//
//  LPFirstViewController.h
//  LPSimpleExample
//
//  Created by Karl Krukow on 07/10/11.
//  Copyright (c) 2011 Trifork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPFirstViewController : UIViewController<UITextFieldDelegate>

@property (retain, nonatomic) IBOutlet UIButton *button;

@property (retain, nonatomic) IBOutlet UISwitch *uiswitch;
@property (retain, nonatomic) IBOutlet UISegmentedControl *segControl;
@property (retain, nonatomic) IBOutlet UITextField *textField;
@property (retain, nonatomic) IBOutlet UILabel *result;
@end
