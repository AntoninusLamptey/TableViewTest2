//
//  UserLoginViewController.h
//  UserLogin
//
//  Created by Madhu Mahat on 4/16/17.
//  Copyright © 2017 Madhu Mahat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserLoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *reenterField;
@property (weak, nonatomic) IBOutlet UIButton *logBtn;

@property (weak, nonatomic) IBOutlet UIButton *registerButton;

- (IBAction)loginBtn:(UIButton *)sender;
- (IBAction)registerBtn:(UIButton *)sender;

-(void)checkPassMatch;
-(void)registerUser;

@end
