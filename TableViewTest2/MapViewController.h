//
//  MapViewController.h
//  TableViewTest2
//
//  Created by Antoninus Lamptey on 4/13/17.
//  Copyright © 2017 Antoninus Lamptey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController<CLLocationManagerDelegate,MKMapViewDelegate>
{
    //double rowIndex;
}
@property (nonatomic, strong) CLLocationManager *manager;
@property (weak, nonatomic) IBOutlet MKMapView *MyMapView;
@property (nonatomic, strong) NSMutableArray *segueCoordinateArray;
@property (nonatomic, strong) NSNumber  *rowIndex;

@end
