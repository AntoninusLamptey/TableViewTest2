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
    
}


- (void) getRaces: (NSString *)year JSON:(void (^)(NSArray *)) callback;
- (void) getCoordinates:(NSString *)year JSON:(void (^)(NSArray *)) callback;
- (void) getLocality: (NSString *)year JSON:(void (^)(NSArray *)) callback;
- (void) getLocalityPhotoJSON:(void (^)(NSArray *)) callback;
@end
