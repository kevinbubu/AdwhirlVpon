/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013年 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "VideohyaAdwhirlvponAdView.h"
#import "TiUtils.h"
#import "TiApp.h"

@implementation VideohyaAdwhirlvponAdView


-(void)dealloc {
	if ( awView != nil ) {
		awView.delegate = nil;
		[awView removeFromSuperview];
		RELEASE_TO_NIL(awView);
	}
	
	[super dealloc];
}

-(void)refreshAd:(CGRect)bounds {
	NSLog(@"[INFO] Adwhirl Vpon+Admob module loaded.");
    
    if (awView != nil) {
        [awView removeFromSuperview];
        RELEASE_TO_NIL(awView);
    }
    
    awView = [[AdWhirlView requestAdWhirlViewWithDelegate:self] retain];
    [self addSubview:awView];
    awView.delegate = self;
}

-(void)setApplicationKey_:(id)key {
	applicationKey = [TiUtils stringValue:key];
}

- (NSString *)adWhirlApplicationKey {
	return applicationKey;
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds {
    [self refreshAd:bounds];
}

- (UIViewController *)viewControllerForPresentingModalView {
	return [[TiApp app] controller];
}


@end
