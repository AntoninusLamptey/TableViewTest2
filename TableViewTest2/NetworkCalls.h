//
//  NetworkCalls.h
//  TableViewTest2
//
//  Created by Antoninus Lamptey on 4/13/17.
//  Copyright © 2017 Antoninus Lamptey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkCalls : NSObject
{
    NSMutableArray *raceNames;
    NSMutableArray *coordinatesJSON;
    NSMutableArray *locality;
    NSMutableArray *localityPhoto;
    NSMutableArray *photoReferences;
    NSMutableArray *resultsArray;
}


- (void) getRaces: (NSString *)year JSON:(void (^)(NSArray *)) callback;
- (void) getCoordinates:(NSString *)year JSON:(void (^)(NSArray *)) callback;
- (void) getLocality: (NSString *)year JSON:(void (^)(NSArray *)) callback;
- (void) getLocality: (NSArray *)coordinates888 PhotoJSON:(void (^)(NSArray *)) callback;
- (void) get:(NSString *)raceRound Results: (NSString *)year  JSON:(void (^)(NSArray *)) callback;
@end
