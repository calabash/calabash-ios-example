//
//  LPSecondViewController.m
//  LPSimpleExample
//
//  Created by Karl Krukow on 07/10/11.
//  Copyright (c) 2011 Trifork. All rights reserved.
//
#import <MapKit/MapKit.h>
#import "LPSecondViewController.h"
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@implementation LPSecondViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSString *title = NSLocalizedString(@"Second", @"Second");
        UIImage *image = [UIImage imageNamed:@"fish"];
        UIImage *selected = [UIImage imageNamed:@"fish-selected"];
        self.tabBarItem = [[[UITabBarItem alloc]
                            initWithTitle:title
                            image:image
                            selectedImage:selected] autorelease];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{

  // Create the location manager if this object does not
  // already have one.
  self.mapView.delegate = self;
  self.locationManager = [[CLLocationManager alloc] init];
  self.locationManager.delegate = self;
#ifdef __IPHONE_8_0
  if(IS_OS_8_OR_LATER) {
    // Use one or the other, not both. Depending on what you put in info.plist
    [self.locationManager requestAlwaysAuthorization];
  }
#endif
  [self.locationManager startUpdatingLocation];

  self.mapView.showsUserLocation = YES;
  [self.mapView setMapType:MKMapTypeStandard];
  [self.mapView setZoomEnabled:YES];
  [self.mapView setScrollEnabled:YES];
  [super viewDidLoad];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:YES];

  self.locationManager.distanceFilter = kCLDistanceFilterNone; //Whenever we move
  self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
  [self.locationManager startUpdatingLocation];
  NSLog(@"%@", [self deviceLocation]);

  //View Area
  MKCoordinateRegion region = { { 0.0, 0.0 }, { 0.0, 0.0 } };
  region.center.latitude = self.locationManager.location.coordinate.latitude;
  region.center.longitude = self.locationManager.location.coordinate.longitude;
  region.span.longitudeDelta = 0.005f;
  region.span.longitudeDelta = 0.005f;
  [self.mapView setRegion:region animated:YES];

}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
  MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
  [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}
- (NSString *)deviceLocation {
  return [NSString stringWithFormat:@"latitude: %f longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude];
}
- (NSString *)deviceLat {
  return [NSString stringWithFormat:@"%f", self.locationManager.location.coordinate.latitude];
}
- (NSString *)deviceLon {
  return [NSString stringWithFormat:@"%f", self.locationManager.location.coordinate.longitude];
}
- (NSString *)deviceAlt {
  return [NSString stringWithFormat:@"%f", self.locationManager.location.altitude];
}
- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
