//
//  MapViewController.h
//  OrderFood
//
//  Created by German Giunta on 7/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController<MKMapViewDelegate, MKAnnotation>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) FoodStore *detailItem;

- (void)viewDidLoad:(id)sender;

@end
