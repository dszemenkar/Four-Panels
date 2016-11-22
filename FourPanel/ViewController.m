//
//  ViewController.m
//  FourPanel
//
//  Created by David Szemenkar on 2016-10-12.
//  Copyright © 2016 David Szemenkar. All rights reserved.
//

#import "ViewController.h"
#import "MapKit/MapKit.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Initiliaze the web page
    NSString *webURL = @"https://en.wikipedia.org/wiki/Foster_City,_California";
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:webURL]];
    [self.webView loadRequest:request ];
    
    //Get the map-coordinates
    double latitude = 37.567728;
    double longitude = -122.274055;
    
    MKPointAnnotation *wiclAnno = [[MKPointAnnotation alloc] init];
    wiclAnno.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    wiclAnno.title =@"Powertronix Corporation, Foster City";
    
    [self.mapView addAnnotation:wiclAnno];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(wiclAnno.coordinate, 10000, 10000);
    MKCoordinateRegion adjust = [self.mapView regionThatFits:region];
    [self.mapView setRegion:adjust animated:YES];
}




@end
