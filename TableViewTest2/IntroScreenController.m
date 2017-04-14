//
//  IntroScreenController.m
//  TableViewTest2
//
//  Created by Antoninus Lamptey on 4/14/17.
//  Copyright © 2017 Antoninus Lamptey. All rights reserved.
//

#import "IntroScreenController.h"
#import "ViewController.h"

@interface IntroScreenController ()

@end

@implementation IntroScreenController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)searchYear:(id)sender {
  
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"yearSegue"]) {
        ViewController *vc = [segue destinationViewController];
        vc.yearString = self.yearLabel.text;
    }
    
}
@end
