//
//  AdWhirlAdapterAdOnCN.h
//  iphone-sdk-adwhirl
//
//  Created by Shark on 2010/10/14.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AdWhirlAdNetworkAdapter.h"
#import "VponAdOn.h"
#import "AdOnPlatform.h"
#import <CoreLocation/CLLocationManagerDelegate.h> 

@interface AdWhirlAdapterAdOnCN: AdWhirlAdNetworkAdapter<VponAdOnDelegate>{

    UIViewController *display;
}

+ (AdWhirlAdNetworkType) networkType;

@end
