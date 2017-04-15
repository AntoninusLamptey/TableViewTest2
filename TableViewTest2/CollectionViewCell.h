//
//  CollectionViewCell.h
//  TableViewTest2
//
//  Created by Antoninus Lamptey on 4/14/17.
//  Copyright © 2017 Antoninus Lamptey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *raceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *collectionImage;

@end
