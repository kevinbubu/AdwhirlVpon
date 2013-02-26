//
//  AdWhirlAdapterAdOnCN.m
//  iphone-sdk-adwhirl
//
//  Created by Shark on 2010/10/14.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AdWhirlAdapterAdOnCN.h"
#import "AdWhirlAdNetworkConfig.h"
#import "AdWhirlView.h"
#import "AdWhirlLog.h"
#import "AdWhirlAdNetworkAdapter+Helpers.h"
#import "AdWhirlAdNetworkRegistry.h"

@implementation AdWhirlAdapterAdOnCN

+ (AdWhirlAdNetworkType)networkType {
    
	NSLog(@"AdWhirlAdNetworkTypeAdOnCN");
	return AdWhirlAdNetworkTypeAdOnCN;
}

+ (void)load {
	[[AdWhirlAdNetworkRegistry sharedRegistry] registerClass:self];
}

- (void)getAd {

    if (nil != display) {
        
        [display release];
        
        display = nil;
    }
#pragma mark 設定區域
    [VponAdOn initializationPlatform:CN];
#pragma mark 取得SDK版本號
    NSLog(@"version:%@",[VponAdOn getVersionVpon]);
#pragma mark Loading開關   
    [[VponAdOn sharedInstance] setIsVponLogo:YES];
#pragma mark Location開關    
    [[VponAdOn sharedInstance] setLocationOnOff:YES];
#pragma mark INPUT_USER_VIEW_SIZE 可參考 VponAdOn 中的範例 
    display = [[VponAdOn sharedInstance] adwhirlRequestDelegate:self licenseKey:networkConfig.pubId size:ADON_SIZE_320x48];
    self.adNetworkView = display.view;
}
- (void)stopBeingDelegate {}
- (void)dealloc {
    
    if (nil != display) {
        
        [display release];
        
        display = nil;
    }
    
    [super dealloc];
}
#pragma mark VponAdDelegate method
- (void)onClickAd:(UIViewController *)bannerView withValid:(BOOL)isValid withLicenseKey:(NSString *)adLicenseKey {
    
    if (isValid == YES) {
        
        NSLog(@"Vpon廣告有效點擊:%@:%@",bannerView ,adLicenseKey);
        
    } else {
        
        NSLog(@"Vpon廣告無效點擊 也許已經點擊過了:%@:%@",bannerView ,adLicenseKey);
    }
}
- (void)onRecevieAd:(UIViewController *)bannerView withLicenseKey:(NSString *)licenseKey {
    
    NSLog(@"Vpon廣告抓取成功:%@:%@",bannerView ,licenseKey);
    [adWhirlView adapter:self didReceiveAdView:bannerView.view];
    
}
- (void)onFailedToRecevieAd:(UIViewController *)bannerView withLicenseKey:(NSString *)licenseKey {
    
    [adWhirlView adapter:self didFailAd:nil];
    
    NSLog(@"Vpon廣告抓取失敗:%@:%@",bannerView ,licenseKey);
}

@end
