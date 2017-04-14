//
//  TableViewCell.h
//  TableViewTest2
//
//  Created by Antoninus Lamptey on 4/13/17.
//  Copyright © 2017 Antoninus Lamptey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *raceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageLocation;
@property (weak, nonatomic) IBOutlet UILabel *localityLabel;

@end
