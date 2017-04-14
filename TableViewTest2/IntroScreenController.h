//
//  IntroScreenController.h
//  TableViewTest2
//
//  Created by Antoninus Lamptey on 4/14/17.
//  Copyright © 2017 Antoninus Lamptey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroScreenController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *yearLabel;
@property (weak, nonatomic) IBOutlet UIButton *showRaces;
- (IBAction)searchYear:(id)sender;

@end
