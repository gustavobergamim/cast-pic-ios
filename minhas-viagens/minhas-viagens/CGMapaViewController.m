//
//  CGMapaViewController.m
//  minhas-viagens
//
//  Created by Gustavo Bergamim on 20/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGMapaViewController.h"
#import <MapKit/MapKit.h>
#import "CGViagemService.h"

@interface CGMapaViewController () <MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation CGMapaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];

    if (self.viagem != nil)
    {
        CLLocationCoordinate2D coordenadas = CLLocationCoordinate2DMake(self.viagem.latitude, self.viagem.longitude);
        MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);
        MKCoordinateRegion region = MKCoordinateRegionMake(coordenadas, span);
        [self.mapa setRegion:region];
        MKPointAnnotation *marcacao = [MKPointAnnotation new];
        marcacao.coordinate = coordenadas;
        marcacao.title = self.viagem.local;
        [self.mapa addAnnotation:marcacao];
    } else {
        UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(inserirViagem:)];
        [gesture setMinimumPressDuration:1];
        [self.mapa addGestureRecognizer:gesture];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) inserirViagem:(UILongPressGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        CGPoint pontoSelecionado = [gesture locationInView:self.mapa];
        CLLocationCoordinate2D coordenadas = [self.mapa convertPoint:pontoSelecionado toCoordinateFromView:self.mapa];
        
        CLLocation *localizacao = [[CLLocation alloc] initWithLatitude:coordenadas.latitude longitude:coordenadas.longitude];
        
        [[CLGeocoder new] reverseGeocodeLocation:localizacao completionHandler:^(NSArray<CLPlacemark*>* _Nullable placemarks, NSError* _Nullable error)
         {
             CLPlacemark *local = placemarks.firstObject;
             CLLocationCoordinate2D coordenadasLocal = local.location.coordinate;
             [self solicitarConfirmacaoDaViagem:local.locality latitude:coordenadasLocal.latitude longitude:coordenadasLocal.longitude];
         }];
    }
}

- (void) solicitarConfirmacaoDaViagem:(NSString*)local latitude:(double)latitude longitude:(double)longitude {
    NSString *mensagem = [NSString stringWithFormat:@"Deseja salvar a viagem a %@?", local];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Minhas Viagens" message:mensagem preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *actionSim = [UIAlertAction actionWithTitle:@"Sim" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        CGViagemService *service = [CGViagemService new];
        [service salvarViagemPara:local latitude:latitude longitude:longitude];
        [self fecharViewController];
    }];
    UIAlertAction *actionNao = [UIAlertAction actionWithTitle:@"Não" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:actionSim];
    [alert addAction:actionNao];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void) fecharViewController
{
    if(self.navigationController  != nil)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
