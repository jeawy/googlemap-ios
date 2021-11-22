//
//  TestComponent.h
//  ZjwGoogleMapPlugin
//
//  Created by XHY on 2020/4/23.
//  Copyright © 2020 DCloud. All rights reserved.
//

#import "DCUniComponent.h"
#import <GoogleMaps/GoogleMaps.h>
#import <GooglePlaces/GooglePlaces.h>
#import <GoogleMapsBase/GoogleMapsBase.h>
NS_ASSUME_NONNULL_BEGIN

@interface GoogleMapComponent : DCUniComponent

{
    GMSMapView *_mapView;
    NSArray *_markers;
    NSString *_allbase64img;
    double _longitude;
    double _latitude;
    NSInteger _scale;
    GMSPlacesClient *_placesClient;
}
-(UIImageView *) createMarkerImg:(NSString *)base64img andContent:(NSString *) content;
@end

NS_ASSUME_NONNULL_END
