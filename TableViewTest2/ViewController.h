//
//  ViewController.h
//  TableViewTest2
//
//  Created by Antoninus Lamptey on 4/13/17.
//  Copyright © 2017 Antoninus Lamptey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *Switch;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@property (strong,nonatomic) NSMutableArray *myArray;
@property (strong,nonatomic) NSMutableArray *coordinateArray;

extern NSNumber *sourceRowIndex;

-(NSMutableArray*) myStaticArray;
- (IBAction)switchView:(id)sender;




@end

