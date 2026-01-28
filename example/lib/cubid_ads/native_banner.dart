import 'package:cubid_flutter/cubid_flutter.dart';
import 'package:cubid_flutter_example/cubid_config.dart';
import 'package:flutter/material.dart';

class CubidNativeBannerSampleTab extends StatelessWidget {
  const CubidNativeBannerSampleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          height: 315,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.grey.shade400),
          ),
          child: CubidNativeAd(
            placementId: CubidConfig.nativeId,
            factoryId: "default",
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
      ],
    );
  }
}
