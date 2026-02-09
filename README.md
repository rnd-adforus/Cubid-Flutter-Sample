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
3. [Flutter: 플러그인 초기화](#chapter-3)
4. [Flutter: 리워드 광고 (Rewarded Video Ad)](#chapter-4)

## 1. Android: Configuration 설정 <a id="chapter-1"></a>
pubspec.yaml 설정 파일에 플러그인 설정을 추가하여 주세요.

```yaml
dependencies:
  cubid_flutter: ^1.0.0
```

앱 수준의 build.gradle 또는 build.gradle.kts 파일에 Cubid SDK 및 필요한 Adapter SDK 의존성을 추가해 주세요. cubid 모듈은 필수(Core) 의존성이며, 광고 기능을 활성화하려면 adsu, cubex, upan 중 하나 이상의 Adapter 모듈을 함께 추가해야 합니다.

```yaml
dependencies:
  cubid_flutter: ^1.0.0 // Core Module - required
  adforus_uad_adapter: ^2.0.1 // Adapter Module
  adforus_upan_adapter: ^1.0.0 // Adapter Module
  adforus_cubex_adapter: ^1.0.0 // Adapter Module
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


## 3. Flutter: Plugin 초기화 <a id="chapter-3"></a>

광고를 호출하기 전에 반드시 cubidFlutter.initialize() 메서드를 호출하여 플러그인를 초기화해야 합니다.
이 메서드는 플러그인 초기화를 수행하며, 성공 또는 실패 여부를 콜백을 통해 전달합니다.

⚠️ 주의: adsu, cubex, upan 중 하나 이상의 Adapter 라이브러리가 프로젝트에 포함되어 있지 않거나,
초기화 과정이 12초 이상 지연될 경우 초기화가 실패할 수 있습니다.

```dart
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

## 4. Flutter: 리워드 광고 (Rewarded Video Ad) <a id="chapter-4"></a>
리워드 광고는 CubidReward 인스턴스를 통해 게재할 수 있습니다.
광고를 로드하려면 rewardAd.load() 메소드를 호출하세요.
로드가 완료되면 Stream<CubidRewardedEvent>의 rewardAd.load() 콜백이 호출되며,
이후 rewardAd.show()를 통해 광고를 표시할 수 있습니다.

```dart
  final cubidFlutter = CubidFlutter();
  final rewardAd = cubidFlutter.createRewarded(placementId: "u365gjTAxA");
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

