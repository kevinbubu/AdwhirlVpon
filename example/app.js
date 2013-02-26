var adwhirl = require('videohya.adwhirlvpon');
Ti.API.info("module is => "+adwhirl);

var win = Ti.UI.createWindow({
	backgroundColor:'#fff'
});

var adView = adwhirl.createAdView({
	height:48,
	width:320,
	top:50,
	backgroundColor:'#000',
	applicationKey:'<<YOUR_APP_ID>>'
});
win.add(adView);

win.open();