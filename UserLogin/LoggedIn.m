//
//  LoggedIn.m
//  UserLogin
//
//  Created by Madhu Mahat on 4/17/17.
//  Copyright © 2017 Madhu Mahat. All rights reserved.
//

#import "LoggedIn.h"

@interface LoggedIn ()

@end

@implementation LoggedIn

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)logOut:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
