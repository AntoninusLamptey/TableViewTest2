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
#import "CollectionViewCell.h"

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

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"%@",self.yearString);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    self.raceNameArray = [[NSMutableArray alloc]init];
    self.coordinateArray = [[NSMutableArray alloc]init];
    self.localityArray = [[NSMutableArray alloc] init];
    
    NetworkCalls *getJSON = [[NetworkCalls alloc] init];
    
    [getJSON getRaces:self.yearString JSON:^(NSArray *races){
        [self.raceNameArray addObjectsFromArray:races];
        [self.tableView reloadData];
    }];
    
    [getJSON getCoordinates:self.yearString JSON:^(NSArray *coordinates){
        [[self myStaticArray] addObjectsFromArray:coordinates];
    }];
    
    [getJSON getLocality:self.yearString JSON:^(NSArray *locality){
        [[self localityArray] addObjectsFromArray:locality];
    }];
    
    self.currentYear.text = self.yearString;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
     CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCollectionCell" forIndexPath:indexPath];
    cell.raceLabel.text = [NSString stringWithFormat:@"%@",[self.raceNameArray objectAtIndex:indexPath.row]];
//    
//    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, cell.bounds.size.width, 40)];
//    title.text = @"placeholder";
//    title.textColor = [UIColor blackColor];
//    title.tag = indexPath.row;
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.raceNameArray.count;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
      return self.raceNameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableCell"];
    cell.raceLabel.text = [NSString stringWithFormat:@"%@",[self.raceNameArray objectAtIndex:indexPath.row]];
    cell.localityLabel.text = [NSString stringWithFormat:@"%@",[self.localityArray objectAtIndex:indexPath.row]];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"mySegue"]) {
        
        NSIndexPath *indexpath=[self.tableView indexPathForSelectedRow];
        sourceRowIndex = [NSNumber numberWithDouble:indexpath.row];
        
        
    }
    if ([segue.identifier isEqualToString:@"myCollectionSegue"]) {
        
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
        sourceRowIndex = [NSNumber numberWithDouble:indexPath.item];
        
        
    }
    
    
}



- (IBAction)switchView:(id)sender {
    
    UIView *sourceView, *destinationView;

    if (self.tableView.superview == self.view)
    {
        //[self.view addSubview:self.tableView];
        [self.collectionView reloadData];
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
