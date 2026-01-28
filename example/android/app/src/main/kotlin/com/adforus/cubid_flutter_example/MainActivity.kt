package com.adforus.cubid_flutter_example

import com.adforus.cubid_flutter.CubidFlutterPlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        CubidFlutterPlugin.registerNativeAdFactory(
            "default",
            AppNativeAdFactory()
        )
    }
}
