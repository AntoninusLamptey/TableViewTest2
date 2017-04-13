//
//  ViewController.m
//  TableViewTest2
//
//  Created by Antoninus Lamptey on 4/13/17.
//  Copyright © 2017 Antoninus Lamptey. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "NetworkCalls.h"

@interface ViewController ()

@end

NSNumber *sourceRowIndex;
@implementation ViewController

static BOOL loaded = NO;
+ (void) initialize {
    if(!loaded) {
        sourceRowIndex = [[NSNumber alloc] initWithInt:1];
        loaded = YES;
    }
}

-(NSMutableArray*) myStaticArray{
    static NSMutableArray* theArray = nil;
    if (theArray == nil)
    {
        theArray = [[NSMutableArray alloc] init];
    }
    return theArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    self.myArray = [[NSMutableArray alloc]init];
    self.coordinateArray = [[NSMutableArray alloc]init];
    
    NetworkCalls *getJSON = [[NetworkCalls alloc] init];
    
    [getJSON getRacesJSON:^(NSArray *races){
        NSLog(@"%@",races);
        [self.myArray addObjectsFromArray:races];
        [self.tableView reloadData];
    }];
    
    [getJSON getcoordinatesJSON:^(NSArray *coordinates){
        [[self myStaticArray] addObjectsFromArray:coordinates];
    }];

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCollectionCell" forIndexPath:indexPath];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, cell.bounds.size.width, 40)];
    title.text = @"placeholder";
    title.textColor = [UIColor blackColor];
    title.tag = indexPath.row;
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.myArray.count;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
      return self.myArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableCell"];
    cell.raceLabel.text = @"placeholder";
    NSLog(@"%@",[self.myArray objectAtIndex:1]);
    return cell;
}

- (IBAction)switchView:(id)sender {
    
    UIView *sourceView, *destinationView;

    if (self.tableView.superview == self.view)
    {
        [self.view addSubview:self.tableView];
        sourceView = self.tableView;
        destinationView = self.collectionView;
    }
    else
    {
        [self.view addSubview:self.collectionView];
        sourceView = self.collectionView;
        destinationView = self.tableView;
    }
    [sourceView removeFromSuperview];
    
    [self.view addSubview:self.collectionView];
    [self.view addSubview:destinationView];
    

}

@end
