//
//  TestComponent.m
//  DCTestUniPlugin
//
//  Created by XHY on 2020/4/23.
//  Copyright © 2020 DCloud. All rights reserved.
//



#import "TestComponent.h"
#import "DCUniConvert.h"

@interface TestComponent () <GMSMapViewDelegate>

@property (nonatomic, assign) BOOL mapLoadedEvent;
@property (nonatomic, assign) BOOL showsTraffic;

@end

@implementation TestComponent

- (void) initMap{
    self->_scale = 13;
    self->_latitude = -33.86;
    self->_longitude = 151.20;
    self->_allbase64img = @"data:image/png;base64,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";
}
-(void)onCreateComponentWithRef:(NSString *)ref type:(NSString *)type styles:(NSDictionary *)styles attributes:(NSDictionary *)attributes events:(NSArray *)events uniInstance:(DCUniSDKInstance *)uniInstance
{
    [self initMap];
    
    if (attributes[@"markers"]) {
        // Creates a marker in the center of the map.
        self->_markers = attributes[@"markers"];
        NSUInteger count = [self->_markers count];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
            //耗时操作
           
                dispatch_async(dispatch_get_main_queue(), ^{
                    //耗时操作完成后，回调此处
                    
                });
        });
        
        _showsTraffic = [DCUniConvert BOOL: attributes[@"markers"]];
    }
    if(attributes[@"allbase64img"]){
        // set base64 img for all markers
        self->_allbase64img = attributes[@"allbase64img"];
    }
    
    if(attributes[@"scale"]){
        // set map scale
        if (![attributes[@"scale"]isEqual:@""] ){
            self->_scale = [attributes[@"scale"] intValue];
        }
    }
    
    if(attributes[@"location"]){
        // set map scale
        NSString *location = attributes[@"location"];
        if (![location isEqual:@""] ){
            // set default position
            NSArray *positions = [location componentsSeparatedByString:@","];
            if ([positions count] == 2){
                // set default map position
                self->_latitude = [positions[0] doubleValue];
                self->_longitude = [positions[1] doubleValue];
            }
            
        }
    }
}
/*
- (UIView *)loadView {
    return [GMSMapView new];
}
 */
-(UIImage *) imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
 }

- (BOOL)mapView:(GMSMapView *)mapView didTapMarker:(GMSMarker *)marker {
    // return msg when click markers
    NSString *msg = marker.userData ;
    NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:msg,@"msg",nil];
    NSString * eventName = @"ClickedMarker";
    
    DCUniSDKInstance * instance = [[DCUniSDKInstance alloc]init];
    [instance fireGlobalEvent:eventName params:dict];
    
    return true;
}

- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:self->_latitude
                                                            longitude:self->_longitude
                                                                 zoom:self->_scale];
    _mapView = [GMSMapView mapWithFrame:self.view.frame camera:camera];
    _placesClient = [GMSPlacesClient sharedClient];
    _mapView.delegate = self;
    _mapView.myLocationEnabled = YES;
    [self.view addSubview:_mapView];
    [self updateMap: _mapView];
}

- (void) updateMap:(GMSMapView *)mapView {
    CLLocationCoordinate2D pointsToUse[[self->_markers count]];
    
    NSString *longitude;
    NSString *latitude;
    NSString *content;
    NSString *msg;
    
    // Set image properties as required including image which will be displayed as marker
      
    [mapView clear];
    GMSCoordinateBounds *bounds = [[GMSCoordinateBounds alloc] init];
    
    for (int i=0; i < [self->_markers count]; i++) {
        NSDictionary *markeritem = [self->_markers objectAtIndex:i];
        longitude = [markeritem objectForKey:@"longitude"];
        latitude = [markeritem objectForKey:@"latitude"];
        content = [markeritem objectForKey:@"content"];
        //content = @"<strong>zjw</strong>";
        UIView *markerView = [self createMarkerImg:self->_allbase64img andContent:content];
        msg = [markeritem objectForKey:@"msg"];
        pointsToUse[i] = CLLocationCoordinate2DMake(longitude.doubleValue, latitude.doubleValue);
        bounds = [bounds includingCoordinate:pointsToUse[i]];
        GMSMarker *marker = [GMSMarker markerWithPosition:pointsToUse[i]];
        if (msg == nil){
            msg = [NSString stringWithFormat:@"%lu",marker.hash] ;
        }
         
        marker.title = content;
        marker.snippet = @"Australia";
        marker.userData =msg;
        
        marker.icon = [self imageWithView:markerView];
        marker.appearAnimation = kGMSMarkerAnimationPop   ;
        //marker.icon = [GMSMarker markerImageWithColor:[UIColor blackColor]];
        marker.map = mapView;
        //[mapView moveCamera:[GMSCameraUpdate setTarget:pointsToUse[i]]];
     }
    [mapView animateWithCameraUpdate:[GMSCameraUpdate fitBounds:bounds withPadding:35.0f]];
    
}

- (UIView *) createMarkerImg:(NSString *)base64img andContent:(NSString *) content{
    // marker image view
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 128, 20)];
            // Set label properties as required including marker Name
    //NSString * htmlString = @"<html><body style='text-align:center'> Some html string </body></html>";
    NSString *htmlString = content;
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];

    label.attributedText = attrStr;
    NSURL *url = [NSURL URLWithString:base64img];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:imageData];
    UIImageView *markerIconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(48, 20, 32, 32)];
    markerIconImageView.image = image;
    UIView *markerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 128, 52)];
    [markerView addSubview:label];
    [markerView addSubview:markerIconImageView];
    return markerView;
}
/// 前端更新属性回调方法
/// @param attributes 更新的属性
- (void)updateAttributes:(NSDictionary *)attributes {
    // 解析属性
    if (attributes[@"placesearch"]) {
        
        
    }
    
    if (attributes[@"showsTraffic"]) {
        _showsTraffic = [DCUniConvert BOOL: attributes[@"showsTraffic"]];
        //((GMSMapView*)self.view).showsTraffic = _showsTraffic;
    }
    if (attributes[@"markers"]) {
        self->_markers = attributes[@"markers"];
        [self updateMap: _mapView];
    }
    
    if (attributes[@"scale"]) {
        self->_scale = [attributes[@"scale"] integerValue];
        [self updateMap: _mapView];
    }
    if(attributes[@"allbase64img"]){
        // set base64 img for all markers
        self->_allbase64img = attributes[@"allbase64img"];
        [self updateMap: _mapView];
    }
     
}


/// 前端注册的事件会调用此方法
/// @param eventName 事件名称
- (void)addEvent:(NSString *)eventName {
    if ([eventName isEqualToString:@"mapLoaded"]) {
        _mapLoadedEvent = YES;
    }
}

/// 对应的移除事件回调方法
/// @param eventName 事件名称
- (void)removeEvent:(NSString *)eventName {
    if ([eventName isEqualToString:@"mapLoaded"]) {
        _mapLoadedEvent = NO;
    }
}

#pragma mark - GMSMapViewDelegate

- (void)mapViewDidFinishLoadingMap:(GMSMapView *)mapView {
    if (_mapLoadedEvent) {
        // 向前端发送事件，params 为传给前端的数据 注：数据最外层为 NSDictionary 格式，需要以 "detail" 作为 key 值
        [self fireEvent:@"mapLoaded" params:@{@"detail":@{@"mapLoaded":@"success"}} domChanges:nil];
    }
}


// 通过 WX_EXPORT_METHOD 将方法暴露给前端
UNI_EXPORT_METHOD(@selector(focus:))

- (void)focus:(NSDictionary *)options {
    // options 为前端传递的参数
    NSLog(@"%@",options);
}


// 通过 WX_EXPORT_METHOD 将方法暴露给前端
UNI_EXPORT_METHOD(@selector(getPlaceDetail:))

- (void)getPlaceDetail:(NSDictionary *)options {
    // options 为前端传递的参数
    NSString *placeID = [options valueForKey:@"placeID"];
    GMSPlaceField fields = GMSPlaceFieldAll;
    [_placesClient fetchPlaceFromPlaceID:placeID placeFields:fields sessionToken:nil callback:^(GMSPlace * _Nullable place, NSError * _Nullable error) {
         
        NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
        
      if (error != nil) {
          NSLog(@"An error occurred %@", [error localizedDescription]);
          [result setValue:@1 forKey:@"status"];
          [result setValue:[error localizedDescription] forKey:@"msg"];
      }
      else{
          NSString *postal_code = @"";
          NSString *formatAddress = @"";//
           
          NSNumber *longitude ; //
          NSNumber *latitude ; //
          [result setValue:@0 forKey:@"status"];
          if (place != nil) {
              CLLocationCoordinate2D coordinate =  [place coordinate] ;
              
              longitude =[NSNumber numberWithDouble:coordinate.longitude] ;
              latitude = [NSNumber numberWithDouble:coordinate.latitude];
               
              formatAddress = [place formattedAddress];
               
              for (GMSAddressComponent *addressComponent in [place addressComponents]){
                  for(NSString *addresstype in  [addressComponent types]){
                      if ([addresstype  isEqual: @"postal_code"]){
                          // get postal code
                          postal_code = [addressComponent name];
                          break;
                      }
                  }
              }
          }
          NSDictionary *resultPlace = @{
              @"postal_code" : postal_code,
              @"placeID" : placeID,
              @"formatAddress" : formatAddress,
              @"longitude" : longitude,
              @"latitude" :latitude,
          };
          [result setValue:resultPlace forKey:@"msg"];
          // fire event to return place detail.
          
      }
        [self.uniInstance fireGlobalEvent:@"placeDetail" params:result];
    }];
}


// 通过 WX_EXPORT_METHOD 将方法暴露给前端
UNI_EXPORT_METHOD(@selector(placeSearch:))

- (void) placeSearch:(NSDictionary *)options {
    // options 为前端传递的参数
    // search and get the auto complete addressed
    // return by firevent.
    NSString *placesearch = [options valueForKey:@"placename"];
    NSString *placeSouthWest = [options valueForKey:@"placeSouthWest"];
    NSString *placeNorthEast = [options valueForKey:@"placeNorthEast"];
    // search place auto complete
    GMSAutocompleteSessionToken *token = [[GMSAutocompleteSessionToken alloc] init];

    // Create a type filter.
    GMSAutocompleteFilter *_filter = [[GMSAutocompleteFilter alloc] init];
    _filter.type = kGMSPlacesAutocompleteTypeFilterGeocode;
    if(placeNorthEast && placeSouthWest){
        // set map restriction for place search
        CLLocationCoordinate2D placeNorthEastCood ;
        CLLocationCoordinate2D placeSouthWestCood ;
         
        if (![placeNorthEast isEqual:@""] ){
            // set default position
            NSArray *positions = [placeNorthEast componentsSeparatedByString:@","];
            if ([positions count] == 2){
                // set default map position
                placeNorthEastCood = CLLocationCoordinate2DMake([positions[0] doubleValue], [positions[1] doubleValue]);
            }
        } 
        if (![placeSouthWest isEqual:@""] ){
            // set default position
            NSArray *positions = [placeSouthWest componentsSeparatedByString:@","];
            if ([positions count] == 2){
                // set default map position
                placeSouthWestCood = CLLocationCoordinate2DMake([positions[0] doubleValue], [positions[1] doubleValue]);
            }
        }
        
        if (CLLocationCoordinate2DIsValid(placeNorthEastCood) && CLLocationCoordinate2DIsValid(placeSouthWestCood) ){
            _filter.locationRestriction = GMSPlaceRectangularLocationOption(placeNorthEastCood, placeSouthWestCood);
        }
    }
    
    [_placesClient findAutocompletePredictionsFromQuery:placesearch filter:_filter sessionToken:token callback:^(NSArray<GMSAutocompletePrediction *> * _Nullable results, NSError * _Nullable error) {
            NSNumber *Status = 0 ;
        NSMutableDictionary *searchResult = [[NSMutableDictionary alloc] init];
            if (error != nil) {
                  Status = @1;
                  NSString *err = [error localizedDescription];
                  [searchResult setValue:err forKey: @"msg"];
                [searchResult setValue:Status forKey:@"status"];
            }
            else{
                  NSMutableArray *resultArr = [[NSMutableArray alloc] init];
                  if (results != nil) {
                    //  NSDictionary resulItem
                    for (GMSAutocompletePrediction *result in results) {
                         
                        NSDictionary *placeItem = @{
                            @"place": result.attributedFullText,
                            @"placeID":result.placeID
                        };
                        [resultArr addObject:placeItem];
                        NSLog(@"Result %@ with PlaceID %@", result.attributedFullText, result.placeID);
                    }
                  }
                  [searchResult setValue:resultArr forKey:@"msg"];
                  [searchResult setValue:@0 forKey:@"status"];
            }
         
        // fire event to result places.
        [self.uniInstance fireGlobalEvent:@"placeResults" params:searchResult];
    }];
}


@end
