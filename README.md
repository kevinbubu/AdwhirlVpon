# Adwhirl Vpon/Admob/InMobi Titanium Module
v1.2.1

============================================
描述
============================================

* AdWhirl是一套廣告輪播平台，開發者如果想在App中放入不同家的廣告平台，可以透過AdWhirl的後台依自己的需求來設定廣告投放的比例。

* 目前本模組只支援iOS, Android模組正在開發當中。

* 本模組支援以下廣告平台：
	1. Vpon (SDK 3.2.9)
	* Admob (SDK 6.4.1)
	* Google AdSense (請直接在Admob後台設定)
	* InMobi (SDK 3.7.0)
	

============================================
更新內容
============================================
	1. iOS 4 & 5 閃退問題修正 (因Admob 6.4.1使用PassKit.framework，已將此framework設為optional)
	2. Admob SDK 升級至 6.4.1
	3. InMobi SDK 升級至 3.7.0
	
============================================
安裝方法
============================================

Step 1. 註冊相關帳號與id
======================

	1. Vpon Adwhirl帳號註冊
		1-1. 前往Vpon Adwhirl後台註冊帳號 (http://med.adon.vpon.com/)
		1-2. 註冊完成後，點選"Add Application" 新增一個應用程式
		1-3. 記下 SDK Key
	
	2. Vpon帳號註冊 (若只想投放Admob廣告可跳過此段)
		2-1. 前往Vpon Adwhirl後台註冊帳號 (http://www.vpon.com/zh-tw/)
		2-2. 註冊完成後可在"應用程式"內新增一個應用程式
		2-3. 記下app id，並填入Vpon Adwhirl後台 "AdOn_TW"的AppId欄位裡 ，再設定投放百分比
		
	3. Admob帳號註冊 (若只想投放Vpon廣告可跳過此段)
		2-1. 前往Admob後台註冊帳號 (http://zhtw.admob.com/)
		2-2. 註冊完成後可在"新增網站/應用程式"內新增一個應用程式
		2-3. 記下app id，並填入Vpon Adwhirl後台 "AdOn_TW"的AppId欄位裡 ，再設定投放百分比
			
			
Step 2. 模組安裝
======================
	
	1. 先把videohya.adwhirlvpon-iphone-1.2.1.zip解壓縮，
	
	2. 把videohya.adwhirlvpon資料夾複製到/Users/<USER NAME>/Library/Application Support/Titanium/modules/iphone中即可


Step 3. 程式設定
======================

	1. 打開專案的tiapp.xml， 在Modules中新增videohya.adwhirlvpon
	
	2. Clean Project
	
	3. 程式碼範例如下：
		var adwhirl = require('videohya.adwhirlvpon'); 
		Ti.API.info("module is => "+adwhirl);
		
		var win = Ti.UI.createWindow({
			backgroundColor:'#fff'
		});
		
		var adView = adwhirl.createAdView({
			height:48,
			width:320,
			top:50, // 可設定top, left等定位方式
			backgroundColor:'#000', // 可設定廣告未載入時的背景顏色
			applicationKey:'<<YOUR_APP_ID>>' // 替換為Vpon Adwhirl Step 1. 註冊的SDK Key
		});
		win.add(adView);
		
		win.open();

============================================
作者
============================================

Kevin Huang.
