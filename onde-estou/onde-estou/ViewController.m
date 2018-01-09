//
//  ViewController.m
//  onde-estou
//
//  Created by Gustavo Bergamim on 20/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController () <MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelVelocidade;
@property (weak, nonatomic) IBOutlet UILabel *labelLatitude;
@property (weak, nonatomic) IBOutlet UILabel *labelLongitude;
@property (weak, nonatomic) IBOutlet UILabel *labelEndereco;
@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *userLocation = locations.lastObject;
    
    self.labelLatitude.text = @(userLocation.coordinate.latitude).stringValue;
    self.labelLongitude.text = @(userLocation.coordinate.longitude).stringValue;
    
    if (userLocation.speed > 0)
    {
        self.labelVelocidade.text = [NSString stringWithFormat:@"%.02f", userLocation.speed];
    }
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);
    MKCoordinateRegion region = MKCoordinateRegionMake(userLocation.coordinate, span);
    [self.mapa setRegion:region];
    
    [[CLGeocoder new] reverseGeocodeLocation:userLocation completionHandler:^(NSArray<CLPlacemark*>* _Nullable placemarks, NSError* _Nullable error)
     {
         CLPlacemark *place = placemarks.firstObject;
         
         self.labelEndereco.text = [NSString stringWithFormat:@"%@ - %@ - %@ - %@", place.subLocality, place.locality, place.administrativeArea, place.country];
     }];
    
}

@end
