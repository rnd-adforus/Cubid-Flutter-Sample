import Flutter
import UIKit
import cubid_flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
          let listTileFactory = ListTileNativeFactory()
        CubidFlutterPlugin.registerNativeAdFactory(
            factoryId: "default",
            nativeAdFactory: listTileFactory
        )


    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
