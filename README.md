# Cubid Flutter Plugin

## 기본 요건
* Flutter SDK 3.13.1 이상
* 권장사항: Flutter SDK 3.27.1 이상

### Android: 최신 버전의 Android Studio
* Gradle 7.0.1 이상
* minSdkVersion 21 이상
* OS 지원 Android 8.0 이상

### iOS: 최신 버전의 Xcode와 명령어 도구 활성화


##  바로가기
1. [Android: Configuration 설정](#chapter-1)
2. [Android: AndroidManifest.xml](#chapter-2)
3. [iOS: Info.plist 설정](#chapter-3)
4. [Flutter: 플러그인 초기화](#chapter-4)
5. [Flutter: 리워드 광고 (Rewarded Video Ad)](#chapter-5)
6. [Flutter: 전면 광고 (Interstitial Ad)](#chapter-6)
7. [Flutter: 배너 광고 (Banner Ad)](#chapter-7)
8. [Flutter: 네이티브 광고 (Native Ad)](#chapter-8)

## 1. Android: Configuration 설정 <a id="chapter-1"></a>
pubspec.yaml 설정 파일에 플러그인 설정을 추가하여 주세요.

* [cubid_flutter 최신버전 ](https://pub.dev/packages/cubid_flutter)

```yaml
dependencies:
  cubid_flutter: ^x.y.z
```

앱 수준의 build.gradle 또는 build.gradle.kts 파일에 Cubid SDK 및 필요한 Adapter SDK 의존성을 추가해 주세요. cubid 모듈은 필수(Core) 의존성이며, 광고 기능을 활성화하려면 adsu, cubex, upan 중 하나 이상의 Adapter 플러그인을 함께 추가해야 합니다.

* [adforus_uad_adapter 최신버전 ](https://pub.dev/packages/adforus_uad_adapter)
* [adforus_upan_adapter 최신버전 ](https://pub.dev/packages/adforus_upan_adapter)
* [adforus_cubex_adapter 최신버전 ](https://pub.dev/packages/adforus_cubex_adapter)

```yaml
dependencies:
  cubid_flutter: ^x.y.z // Core Module - required
  adforus_uad_adapter: ^x.y.z // Adapter Module
  adforus_upan_adapter: ^x.y.z // Adapter Module
  adforus_cubex_adapter: ^x.y.z // Adapter Module
```



## 2. Android:  AndroidManifest.xml <a id="chapter-2"></a>

adsu 모듈을 사용하는 경우, 앱의 AndroidManifest.xml 파일에 반드시 AdMob App ID를 설정해야 합니다. 아래와 같이 <meta-data> 태그를 추가해 주세요:
* android:value에는 AdForus 운영팀으로부터 발급받은 AdMob App ID를 입력해야 합니다.
* App ID가 누락되거나 잘못된 경우, 광고가 정상적으로 초기화되지 않으며 광고 수익화가 불가능합니다.
* 본 설정은 Google AdMob의 정책상 필수 항목이며, 누락 시 앱 실행 중 예외 또는 크래시가 발생할 수 있습니다.

```xml
<!-- AndroidManifest.xml -->
<manifest>
  <application>
    <meta-data
        android:name="com.google.android.gms.ads.APPLICATION_ID"
        android:value="YOUR_APP_ID"
        tools:replace="android:value"/>
  </application>
</manifest>
```


## 3. iOS:  iOS: Info.plist 설정 <a id="chapter-3"></a>

### SDKAdNetwork ID 설정
일부 광고 소재에서는 광고 전환에 사용되는 SDKAdNetwork ID를 필요로 합니다. Info.plist 내 SKAdNetworkItems 키값으로 ID 배열을 다음과 같이 설정해주세요.

<details><br>
<summary><b>작성예시</summary>

```xml
<key>SKAdNetworkItems</key>
<array>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>cstr6suwn9.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>4fzdc2evr5.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>4pfyvq9l8r.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>2fnua5tdw4.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>ydx93a7ass.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>5a6flpkh64.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>p78axxw29g.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>v72qych5uu.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>ludvb6z3bs.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>cp8zw746q7.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>3sh42y64q3.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>c6k4g5qg8m.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>s39g8k73mm.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>3qy4746246.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>f38h382jlk.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>hs6bdukanm.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
	<string>v4nxqhlyqp.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>wzmmz9fp6w.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>yclnxrl5pm.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>t38b2kh725.skadnetwork</string>
  </dict>
  <dict>
	<key>SKAdNetworkIdentifier</key>
	<string>7ug5zh24hu.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>gta9lk7p23.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>vutu7akeur.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>y5ghdn5j9k.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>n6fk4nfna4.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>v9wttpbfk9.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>n38lu8286q.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>47vhws6wlr.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>kbd757ywx3.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>9t245vhmpl.skadnetwork</string>
  </dict>
  <dict>
	<key>SKAdNetworkIdentifier</key>
	<string>eh6m2bh4zr.skadnetwork</string>
  </dict>
  <dict>
	<key>SKAdNetworkIdentifier</key>
	<string>a2p9lx4jpn.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>22mmun2rn5.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>4468km3ulz.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>2u9pt9hc89.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>8s468mfl3y.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>klf5c3l5u5.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>ppxm28t8ap.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>ecpz2srf59.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>uw77j35x4d.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>pwa73g5rt2.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
	 <string>mlmmfzh3r3.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>578prtvx9j.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>4dzt52r2t5.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>e5fvkxwrpn.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>8c4e2ghe7u.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>zq492l623r.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>3rd42ekr43.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>3qcr597p9d.skadnetwork</string>
  </dict>
</array>
```
<br>
</details>
<br>
</details>


### 사용자 추적 권한(ATT) 요청
사용자 추적 허용을 통해 광고 품질을 높일 수 있습니다. 사용자 추적 권한에 필요한 NSUserTrackingUsageDescription을 설정은 다음과 같이 키를 추가하고 추적 목적을 명확히 설명하는 문구를 문자열 값으로 작성합니다. 아래는 문구는 예시이며, 앱 내 알맞는 문구로 작성해주세요

```xml
<key>NSUserTrackingUsageDescription</key>
<string>서비스 품질 향상과 맞춤형 콘텐츠 제공을 위해 사용자의 기기 정보를 활용합니다.</string>
```

### GADApplicationIdentifier 설정

GADApplicationIdentifier는 Google Mobile Ads SDK 초기화 및 광고 요청을 위해 필수이며, 미설정 시 광고 로드가 실패할 수 있습니다. Info.plist에 다음과 같이 작성하여주세요. 앱별로 해당하는 고유한 값을 애드포러스 "플랫폼3팀"에 문의해주세요.

```xml
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-xxxxxxxxxxxxxxxx~xxxxxxxxxx</string>
```


## 4. Flutter: Plugin 초기화 <a id="chapter-4"></a>

광고를 호출하기 전에 반드시 cubidFlutter.initialize() 메서드를 호출하여 플러그인를 초기화해야 합니다.
이 메서드는 플러그인 초기화를 수행하며, 성공 또는 실패 여부를 콜백을 통해 전달합니다.

⚠️ 주의: adsu, cubex, upan 중 하나 이상의 Adapter 라이브러리가 프로젝트에 포함되어 있지 않거나,
초기화 과정이 12초 이상 지연될 경우 초기화가 실패할 수 있습니다.

```dart
  import 'package:cubid_flutter/cubid_flutter.dart';
  final cubidFlutter = CubidFlutter();

  cubidFlutter.initialize(
      setId: "SET_ID",  // 운영팀으로부터 발급받은 Set Id 입력
      userId: "USER_ID",  // 사용자 고유 ID 또는 테스트용 ID
      onInitialized: (){
        // 초기화 성공
      },
      onFailed: (String error){
        // 초기화 실패
      },
    );

```

## 5. Flutter: 리워드 광고 (Rewarded Video Ad) <a id="chapter-5"></a>
리워드 광고는 CubidRewarded 인스턴스를 통해 게재할 수 있습니다.
광고를 로드하려면 rewardAd.load() 메소드를 호출하세요.
로드가 완료되면 Stream<CubidRewardedEvent>의 rewardAd.load() 콜백이 호출되며,
이후 rewardAd.show()를 통해 광고를 표시할 수 있습니다.

```dart
  final cubidFlutter = CubidFlutter();
  CubidRewarded rewardAd = cubidFlutter.createRewarded(placementId: "YOUR_PLACEMENT_ID");
  rewardAd.events.listen((e) {
   switch (e.type) {
        case CubidRewardedEventType.clicked:
          break;
        case CubidRewardedEventType.loaded:
          break;
        case CubidRewardedEventType.failed:
          break;
        case CubidRewardedEventType.shown:
          break;
        case CubidRewardedEventType.skipped:
          break;
        case CubidRewardedEventType.completed:
          break;
        case CubidRewardedEventType.closed:
          break;
        case CubidRewardedEventType.notLoaded:
          break;
      }
    });
  Future<void> loadReward() => rewardAd.load(); 
  Future<void> showReward() => rewardAd.show();

```

리워드 광고를 표시하려면 먼저 광고 로드 및 콜백 리스너 설정을 완료한 뒤, rewardAd.load() 콜백을 수신해야 합니다.
광고가 성공적으로 로드된 후에만 CubidRewarded 인스턴스의 rewardAd.show() 메소드를 호출할 수 있습니다.


## 6. Flutter: 전면 광고 (Interstitial Ad) <a id="chapter-6"></a>
전면 광고는 CubidInterstitial 인스턴스를 통해 게재할 수 있습니다.
광고를 로드하려면 interstitial.load() 메소드를 호출하세요.
로드가 완료되면 Stream<CubidInterstitialEvent>의 interstitial.load() 콜백이 호출되며,
이후 interstitial.show()를 통해 광고를 표시할 수 있습니다.

```dart
  final cubidFlutter = CubidFlutter();
  CubidInterstitial interstitial = cubidFlutter.createInterstitial(
      placementId: "YOUR_PLACEMENT_ID",
    );
    interstitial!.events.listen((event) {
     switch (event.type) {
        case CubidInterstitialEventType.clicked:
          break;
        case CubidInterstitialEventType.loaded:
          break;

        case CubidInterstitialEventType.failed:
          break;

        case CubidInterstitialEventType.shown:
          break;

        case CubidInterstitialEventType.closed:
          break;

        case CubidInterstitialEventType.notLoaded:
          break;
      }
    });

  Future<void> loadInterstitial() => interstitial.load();
  Future<void> showInterstitial() => interstitial.show();
```

## 7. Flutter: 배너 광고 (Banner Ad) <a id="chapter-7"></a>

CubidBanner는 Flutter에서 사용하는 배너 광고 위젯이며, placementId와 size를 지정해 생성합니다.
위젯이 빌드된 이후 내부적으로 광고 로드가 진행되고, 광고 로드가 완료되면 onLoaded 콜백 시점에 광고 콘텐츠가 자동으로 렌더링됩니다.
광고가 실제 화면에 노출되는 시점에는 onPresent 콜백이 호출되며, 사용자가 광고를 클릭하면 onClick 콜백이 호출됩니다.
광고 로드에 실패한 경우에는 onFailed 콜백을 통해 실패 사유를 전달받을 수 있습니다.

### Flutter에서 제공되는 배너 사이즈는 다음과 같습니다.
* CubidBannerSize.fixed300x250
* CubidBannerSize.fixed320x100
* CubidBannerSize.fixed320x50

```dart
  CubidBanner(
        placementId: "YOUR_PLACEMENT_ID",
        size: CubidBannerSize.fixed300x250,
        onLoaded: () {
          // 광고 로드 성공
        },
        onFailed: (failed) {
          // 광고 로드 실패
        },
        onPresent: () {
          // 광고 표시
        },
        onClick: () {
          // 광고 클릭
        },
      ),
```
배너 광고는 일반 Flutter 위젯과 동일하게 레이아웃 트리에 포함시켜 사용하며, 별도의 로드 메서드를 호출할 필요 없이 CubidBanner 위젯이 화면에 추가되면 자동으로 광고 로드 및 표시 흐름이 처리됩니다.

## 8. Flutter: 네이티브 광고 (Native Ad) <a id="chapter-8"></a>
CubidNativeAd는 Flutter에서 사용하는 네이티브 배너 광고 위젯이며, Android / iOS 네이티브 뷰를 플랫폼 뷰로 감싸서 표시합니다.
네이티브 광고는 SDK가 높이를 결정하지 않으므로, Flutter 쪽에서 감싸는 컨테이너의 height를 명시적으로 지정해야 하며 이는 전적으로 개발자 책임입니다.

CubidNativeAd가 위젯 트리에 추가되면 광고 로드가 자동으로 시작되고, 로드 완료 시 onLoaded 콜백이 호출됩니다.
광고가 화면에 표시되면 onPresented, 클릭 시 onClicked, 로드 실패 시 onFailed 콜백이 호출됩니다.

```dart
   Container(
          height: 315,
          child: CubidNativeAd(
            placementId: CubidConfig.nativeId,
            factoryId: "YOUR_FACTORY_ID", //
            onClicked: () {
              print('CubidNative Clicked');
            },
            onFailed: (failed) {
              print('CubidNative Failed');
            },
            onLoaded: () {
              print('CubidNative loaded');
            },
            onPresented: () {
              print('CubidNative Presented');
            },
          ),
        ),
```


factoryId는 플랫폼별 네이티브 광고 레이아웃과 연결되며,
Flutter에서 지정한 컨테이너 크기는 Android XML 레이아웃 또는 iOS Auto Layout으로 구성된 네이티브 광고 뷰의 실제 크기와 반드시 맞게 설계되어야 합니다.

## Native Ad Factory

### Android (Kotlin)

CubidNativeAdFactory는 Android에서 네이티브 광고 뷰의 구조와 자산 매핑을 정의하는 인터페이스입니다.
configure()는 네이티브 광고가 생성되기 전에 호출되며, 이 단계에서
어떤 레이아웃을 사용할지와 그 레이아웃 안에서 어떤 View가 광고 자산에 대응되는지를 CubidNativeAdContext에 설정합니다.

[native_ad_layout.xml 예시](https://github.com/rnd-adforus/Cubid-Flutter-Sample/blob/main/example/android/app/src/main/res/layout/native_ad_layout.xml)

## 

```kotlin
  import com.adforus.cubid_flutter.nativead.CubidNativeAdContext
  import com.adforus.cubid_flutter.nativead.CubidNativeAdFactory

  class AppNativeAdFactory : CubidNativeAdFactory {

    override fun configure(
        context: CubidNativeAdContext,
        options: Map<String, Any>?
    ) {
        context.layoutResId = R.layout.native_ad_layout
        context.mediaViewId = R.id.native_media
        context.headlineViewId = R.id.native_headline
        context.callToActionViewId = R.id.native_cta
        context.iconViewId = R.id.native_icon
        context.bodyViewId = R.id.native_body
    }
}
```

### iOS (Swift)

CubidNativeAdFactory는 iOS에서 네이티브 광고 뷰를 생성하는 팩토리 인터페이스입니다.
create(context:options:)는 네이티브 광고가 로드될 때 호출되며, 이 메서드에서 광고를 표시할 UIView를 구성해 반환합니다.
반환된 뷰는 네이티브 광고 컨테이너로 사용되며, 이후 SDK가 CubidNativeAdContext에 매핑된 요소들에 광고 자산을 바인딩합니다.

[Swift UI 예시](https://github.com/rnd-adforus/Cubid-Flutter-Sample/blob/main/example/ios/Runner/ListTileNativeFactory.swift)
```swift
import cubid_flutter

class YOUR_CLASS_NAME: NSObject, CubidNativeAdFactory {
    func create(context: CubidNativeAdContext, options: [String: Any]?) -> UIView {
        return your_view
    }
}
```
이 클래스의 역할은 다음으로 한정됩니다.
네이티브 광고 레이아웃을 구성하는 UIView 생성
광고 자산에 대응되는 뷰를 CubidNativeAdContext에 연결
광고 로드, 노출, 클릭 처리 로직은 SDK 내부에서 처리되며,
이 팩토리는 뷰 생성과 자산 매핑만 담당합니다.

      
## Native Registery Plugin

이 단계는 Flutter에서 사용하는 factoryId와 플랫폼별 네이티브 광고 팩토리를 연결(register) 하는 과정입니다.
한 번만 등록되며, 이후 Flutter의 CubidNativeAd 위젯에서 동일한 factoryId를 사용해 해당 네이티브 레이아웃이 호출됩니다.

Flutter ↔ 플랫폼 네이티브 광고 팩토리를 매핑하는 레지스트리 역할을 합니다.
* factoryId는 Flutter와 네이티브를 연결하는 고유 키입니다
* Flutter의 CubidNativeAd(factoryId: ...)와 반드시 동일해야 합니다
* 앱 실행 시 한 번만 등록하면 됩니다

### Android (Kotlin)
Android에서는 configureFlutterEngine에서 네이티브 광고 팩토리를 등록합니다.

* AppNativeAdFactory()는 CubidNativeAdFactory 구현체입니다
* "YOUR_NATIVE_FACTORY_ID"는 Flutter에서 사용하는 factoryId와 일치해야 합니다

```kotlin
import com.adforus.cubid_flutter.CubidFlutterPlugin

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        CubidFlutterPlugin.registerNativeAdFactory(
            "YOUR_NATIVE_FACTORY_ID",
            AppNativeAdFactory()
        )
    }
}
```

### iOS (Swift)

iOS에서는 AppDelegate의 didFinishLaunchingWithOptions에서 팩토리를 등록합니다.
* YOUR_CLASS_NAME은 CubidNativeAdFactory를 구현한 클래스입니다
* factoryId는 Flutter에서 사용하는 값과 정확히 동일해야 합니다

```swift
import cubid_flutter
import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
        CubidFlutterPlugin.registerNativeAdFactory(
            factoryId: "YOUR_NATIVE_FACTORY_ID",
            nativeAdFactory: YOUR_CLASS_NAME
        )
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```







   
