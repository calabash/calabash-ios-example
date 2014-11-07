//
//  LPSecondViewController.h
//  LPSimpleExample
//
//  Created by Karl Krukow on 07/10/11.
//  Copyright (c) 2011 Trifork. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
@interface LPSecondViewController : UIViewController  <MKMapViewDelegate,  CLLocationManagerDelegate>
@property (retain, nonatomic)   CLLocationManager *locationManager;
@property (retain, nonatomic)   MKMapView *mapView;
@end
