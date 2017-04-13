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
}


- (void) getRacesJSON:(void (^)(NSArray *)) callback;
- (void) getcoordinatesJSON:(void (^)(NSArray *)) callback;
@end
