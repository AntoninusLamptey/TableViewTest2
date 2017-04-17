//
//  UserLoginViewController.m
//  UserLogin
//
//  Created by Madhu Mahat on 4/16/17.
//  Copyright © 2017 Madhu Mahat. All rights reserved.
//

#import "UserLoginViewController.h"

@interface UserLoginViewController ()

@end
@implementation UserLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults boolForKey:@"registered"]) {
        NSLog(@"No User Registered");
        _logBtn.hidden = YES;
        
        
    }else{
        NSLog(@"User is Registered");
        _reenterField.hidden = YES;
        _registerButton.hidden = YES;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginBtn:(UIButton *)sender {
    
    
    NSUserDefaults *login = [NSUserDefaults standardUserDefaults];
    if ([_usernameField.text isEqualToString:[login objectForKey:@"username"]] && [_passwordField.text isEqualToString:[login objectForKey:@"password"]]) {
        NSLog(@"Login Credentials accepted");
        _usernameField.text = nil;
        _passwordField.text = nil;
        [self performSegueWithIdentifier:@"login" sender:self];
        
    }else{
        NSLog(@"Login Credentials incorrect");
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Ooooooops!!!" message:@"Login Credentials Incorrect" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];

        
        
    }
}

- (IBAction)registerBtn:(UIButton *)sender {
    
    if ([_usernameField.text isEqualToString:@""] ||[_passwordField.text isEqualToString:@""] || [_reenterField.text isEqualToString:@""]) {
        
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Ooooooops!!!" message:@"Fields Cannot be blank" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    else{
        [self checkPassMatch];
    }
}
-(void) checkPassMatch{
    if([_passwordField.text isEqualToString:_reenterField.text]){
        NSLog(@"Passwords Match");
        [self registerUser];
    }else{
        NSLog(@"Passwords Doesn't Match");
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Ooooooops!!!" message:@"Passwords does not match!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
        
    }
}
-(void)registerUser{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_usernameField.text forKey:@"username"];
     [defaults setObject:_passwordField.text forKey:@"password"];
    [defaults setBool:YES forKey:@"registered"];
    [defaults synchronize];
    
    UIAlertController *success = [UIAlertController alertControllerWithTitle:@"Successfull" message:@"You are now registered" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAct = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    [success addAction:defaultAct];
    
    [self performSegueWithIdentifier:@"login" sender:self];
}












@end
