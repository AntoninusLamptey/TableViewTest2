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
#import "ResultsTableViewController.h"

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
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    self.title = [NSString stringWithFormat:@"Current Year: %@",self.yearString];
    self.raceNameArray = [[NSMutableArray alloc]init];
    self.coordinateArray = [[NSMutableArray alloc]init];
    self.localityArray = [[NSMutableArray alloc] init];
    self.localityPhotosArray = [[NSMutableArray alloc] init];
    self.tableView.frame = CGRectMake(0, 60, self.view.bounds.size.width, self.view.bounds.size.height-60);
    NetworkCalls *getJSON = [[NetworkCalls alloc] init];
    
    [getJSON getRaces:self.yearString JSON:^(NSArray *races){
        [self.raceNameArray addObjectsFromArray:races];
        [self.tableView reloadData];
    }];
    
    [getJSON getCoordinates:self.yearString JSON:^(NSArray *coordinates){
        [[self myStaticArray] addObjectsFromArray:coordinates];
        [getJSON getLocality:[self myStaticArray] PhotoJSON:^(NSArray *photos) {
            //[self.localityPhotosArray addObjectsFromArray:photos];
            NSLog(@"%lu",(unsigned long)photos.count);
            if (photos.count == self.myStaticArray.count) {
                [self.localityPhotosArray addObjectsFromArray:photos];
                [self.tableView reloadData];
            }
            
            NSLog(@"hello: %lu",(unsigned long)self.localityPhotosArray.count);
        }];
        
    }];
    
    [getJSON getLocality:self.yearString JSON:^(NSArray *locality){
        [[self localityArray] addObjectsFromArray:locality];
    }];
    
    
//    [getJSON getLocality:self.yearString JSON:^(NSArray *locality){
//        [[self localityArray] addObjectsFromArray:locality];
//    }];
    
    
    
    //self.currentYear.text = self.yearString;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
     CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCollectionCell" forIndexPath:indexPath];
    cell.raceLabel.text = [NSString stringWithFormat:@"%@",[self.raceNameArray objectAtIndex:indexPath.row]];
//    
//    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, cell.bounds.size.width, 40)];
//    title.text = @"placeholder";
//    title.textColor = [UIColor blackColor];
//    title.tag = indexPath.row;
    cell.collectionImage.image = [UIImage imageWithData:[self.localityPhotosArray objectAtIndex:indexPath.row]];
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
   // if (self.localityPhotosArray.count >=20) {
         cell.imageLocation.image = [UIImage imageWithData:[self.localityPhotosArray objectAtIndex:indexPath.row]];
    
    
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
    if ([segue.identifier isEqualToString:@"resultsSegue"]) {
        // ResultsTableViewController *resultsViewController = [segue destinationViewController];
    }
    
    
}

- (IBAction)viewResults:(id)sender{
    //performSegueWithIdentifier(@"resultsSegue", sender: self);
    
}



- (IBAction)switchView:(id)sender {
    
    UIView *sourceView, *destinationView;

    if (self.tableView.superview == self.view)
    {
        //[self.view addSubview:self.tableView];
        [self.collectionView reloadData];
        sourceView = self.tableView;
        destinationView = self.collectionView;
        destinationView.frame = self.view.bounds;
    }
    else
    {
        [self.view addSubview:self.collectionView];
        sourceView = self.collectionView;
        destinationView = self.tableView;
        destinationView.frame = self.view.bounds;
    }
    [sourceView removeFromSuperview];
    if(destinationView == self.tableView)
    {
        destinationView.frame = self.view.bounds;
    }
    [self.view addSubview:self.collectionView];
    [self.view addSubview:destinationView];
    

}



@end
