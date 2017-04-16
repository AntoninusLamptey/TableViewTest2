//
//  MapViewController.m
//  TableViewTest2
//
//  Created by Antoninus Lamptey on 4/13/17.
//  Copyright © 2017 Antoninus Lamptey. All rights reserved.
//

#import "MapViewController.h"
#import "MapAnnotations.h"
#import "ViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.manager = [[CLLocationManager alloc] init];
    //    self.segueCoordinateArray = [[NSMutableArray alloc]init];
    
    ViewController *test = [[ViewController alloc] init];
    self.manager.delegate = self;
    self.title = @"Race Location";
    if([self.manager respondsToSelector:@selector(requestWhenInUseAuthorization)]){
        [self.manager requestWhenInUseAuthorization]; //if this responds that means it is using ios 8 or more
        
    }
    
    
    //27.6991° N, 85.3511° E
    //NSLog(@"%lu",(unsigned long)self.segueCoordinateArray.count);
    //NSLog(@"%@",[test.myStaticArray objectAtIndex:1]);
    
    CLLocationCoordinate2D coordinate;
    NSString *latstring = [[test.myStaticArray objectAtIndex:[sourceRowIndex intValue]] objectForKey:@"latitude"];
    double latdouble = [latstring floatValue];
    //NSLog(@"%f",latdouble);
    
    NSString *longstring = [[test.myStaticArray objectAtIndex:[sourceRowIndex intValue]] objectForKey:@"longitude"];
    float longdouble = [longstring floatValue];
    
    coordinate.longitude = longdouble;
    coordinate.latitude = latdouble;
    
    
    MKCoordinateSpan span;
    span.latitudeDelta = 0.02;
    span.longitudeDelta =0.02;
    
    MKCoordinateRegion region;
    region.center = coordinate;
    region.span = span;
    
    
    //MKCoordinateRegion region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(27.6991,85.3511), MKCoordinateSpanMake(0.02, 0.02));
    
    [self.MyMapView setRegion:region];
    
    MapAnnotation *ann = [[MapAnnotation alloc] init];
    ann.coordinate = coordinate;
    ann.title = @"I m here";
    ann.subtitle = @"Nepal";
    
    
    
    [self.MyMapView addAnnotation:ann];
    
}
- (nullable MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
    MKPinAnnotationView *view = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"pinView"];
    if(view==nil){
        view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pinView"];
    }
    view.pinTintColor = [UIColor blueColor];
    
    
    return view;
}

@end
