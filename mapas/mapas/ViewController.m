//
//  ViewController.m
//  mapas
//
//  Created by Gustavo Bergamim on 19/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController () <MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *userLocation = locations.lastObject;
    
    if (userLocation.speed > 0)
    {
        NSLog(@"Velocidade %f \n", userLocation.speed);
    }
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);
    MKCoordinateRegion region = MKCoordinateRegionMake(userLocation.coordinate, span);
    [self.mapa setRegion:region];
    
    [[CLGeocoder new] reverseGeocodeLocation:userLocation completionHandler:^(NSArray<CLPlacemark*>* _Nullable placemarks, NSError* _Nullable error)
     {
         CLPlacemark *place = placemarks.firstObject;
         
         NSLog(@"thoroughtfare: %@\n subThoroughtfare: %@\n locality: %@\n subLocality: %@\n postalCode: %@\n country: %@\n administrativeArea: %@\n subAdministrativaArea: %@\n", place.thoroughfare, place.subThoroughfare, place.locality, place.subLocality, place.postalCode, place.country, place.administrativeArea, place.subAdministrativeArea);
         
     }];
    
}


@end
