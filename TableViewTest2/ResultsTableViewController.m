//
//  ResultsTableViewController.m
//  TableViewTest2
//
//  Created by Antoninus Lamptey on 4/15/17.
//  Copyright © 2017 Antoninus Lamptey. All rights reserved.
//

#import "ResultsTableViewController.h"
#import "ViewController.h"
#import "TableViewCell.h"
#import "NetworkCalls.h"
#import "CollectionViewCell.h"

@interface ResultsTableViewController ()

@end

@implementation ResultsTableViewController


- (void)viewWillAppear:(BOOL)animated{
    
//    NetworkCalls *getResults = [[NetworkCalls alloc] init];
//    self.resultsArray = [[NSMutableArray alloc]init];
//    ViewController *VC = [[ViewController alloc] init];
//    [getResults get:VC.yearString Results:@"1" JSON:^(NSArray *results){
//        [self.resultsArray addObjectsFromArray:results];
//        NSLog(@"%@",results);
//    
//    }];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
     //NetworkCalls *getResults = [[NetworkCalls alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
//    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.resultsArray objectAtIndex:[sourceRowIndex doubleValue]]];
    cell.textLabel.text = @"placeholder";
    return cell;
}




@end
