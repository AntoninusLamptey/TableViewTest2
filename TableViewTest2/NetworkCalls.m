//
//  NetworkCalls.m
//  TableViewTest2
//
//  Created by Antoninus Lamptey on 4/13/17.
//  Copyright © 2017 Antoninus Lamptey. All rights reserved.
//

#import "NetworkCalls.h"
#import <dispatch/dispatch.h>

//google photosearh api,pparse this for photo reference still need actual picture api
//https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-37.8497,144.968&radius=2000&key=AIzaSyBuiKo_XT26CUfWQCSU5qIyQCc4EixjzYM
//race results for given year
//http://ergast.com/api/f1/2012.json

@implementation NetworkCalls{
    //NSMutableArray *raceNames;
    
    dispatch_queue_t myQueue;
    NSDictionary *mydict1;
    NSDictionary *mydict2;
    NSDictionary *mydict3;
    NSData *myData1;
    NSData *myData2;
    NSData *myData3;
    //NSString *url;
    //NSData *myData;
    //NSURL *myUrl;
}

- (void) getRaces: (NSString *)year JSON:(void (^)(NSArray *)) callback{
    
    raceNames = [[NSMutableArray alloc] init];
    myQueue = dispatch_queue_create("myQueue", NULL);
    dispatch_async(myQueue, ^{
        NSURL *myUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http://ergast.com/api/f1/%@.json",year]];
        
        //Assign the data from the URL
        myData1 = [NSData dataWithContentsOfURL:myUrl];
        
         mydict1 = [NSJSONSerialization JSONObjectWithData:myData1 options:0 error:nil];
        NSDictionary *races = [[[mydict1 objectForKey:@"MRData"] objectForKey:@"RaceTable"] objectForKey:@"Races"];
        for(NSDictionary *tempValue in races)
        {
            [raceNames addObject:tempValue[@"raceName"]];
            
            
        }
        callback(raceNames);
        
    });
    
}

- (void) getCoordinates: (NSString *)year JSON:(void (^)(NSArray *)) callback{
    
    coordinatesJSON = [[NSMutableArray alloc] init];
    myQueue = dispatch_queue_create("myQueue2", NULL);
    dispatch_async(myQueue, ^{
        NSURL *myUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http://ergast.com/api/f1/%@.json",year]];
        //Assign the data from the URL
        myData2 = [NSData dataWithContentsOfURL:myUrl];
        
        mydict2 = [NSJSONSerialization JSONObjectWithData:myData2 options:0 error:nil];
        NSDictionary *races = [[[mydict2 objectForKey:@"MRData"] objectForKey:@"RaceTable"] objectForKey:@"Races"];
        for(NSDictionary *tempValue in races)
        {
            NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];
            [myDictionary setObject:[[[tempValue objectForKey:@"Circuit"] objectForKey:@"Location"] objectForKey:@"lat"] forKey:@"latitude" ];
            [myDictionary setObject:[[[tempValue objectForKey:@"Circuit"] objectForKey:@"Location"] objectForKey:@"long"] forKey: @"longitude"];
            [coordinatesJSON addObject:myDictionary];
            
        }
        callback(coordinatesJSON);
        
    });
}

- (void) getLocality:(NSString *)year JSON:(void (^)(NSArray *)) callback{

    locality = [[NSMutableArray alloc] init];
    myQueue = dispatch_queue_create("myQueue2", NULL);
    dispatch_async(myQueue, ^{
        NSURL *myUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http://ergast.com/api/f1/%@.json",year]];        //Assign the data from the URL
        myData3 = [NSData dataWithContentsOfURL:myUrl];
        
        mydict3 = [NSJSONSerialization JSONObjectWithData:myData3 options:0 error:nil];
        NSDictionary *races = [[[mydict3 objectForKey:@"MRData"] objectForKey:@"RaceTable"] objectForKey:@"Races"];
        for(NSDictionary *tempValue in races)
        {
    
            [locality addObject:tempValue[@"Circuit"] [@"Location"][@"locality"]];
            
        }
        callback(locality);
        
    });
}

- (void) getLocalityPhotoJSON:(void (^)(NSArray *)) callback{
    
    localityPhoto = [[NSMutableArray alloc] init];

}

@end
