//
//  MapViewController.m
//  OrderFood
//
//  Created by German Giunta on 7/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "MapViewController.h"
#import "MyAnnotation.h"

@implementation MapViewController

@synthesize mapView, detailItem;

- (void)setDetailItem:(id)newDetailItem
{
    if (detailItem != newDetailItem) {
        detailItem = newDetailItem;
        
        // Update the view.
        [self viewDidLoad];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CLLocationCoordinate2D location;
    double lat = [self.detailItem.lat doubleValue];
    double lon = [self.detailItem.lon doubleValue];
    location.latitude = lat;
    location.longitude= lon;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location, 400, 400);
    MKCoordinateRegion adjustedRegion = [mapView regionThatFits:region];  
    [mapView setRegion:adjustedRegion animated:YES];
    MyAnnotation *annotation = [[MyAnnotation alloc] initWithTitle:self.detailItem.name andCoordinate:location];
    [mapView addAnnotation:annotation];
    [mapView selectAnnotation:annotation animated:NO];
}

@end
