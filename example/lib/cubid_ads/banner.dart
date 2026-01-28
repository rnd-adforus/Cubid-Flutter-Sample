import 'package:cubid_flutter/cubid_flutter.dart';
import 'package:cubid_flutter_example/cubid_config.dart';
import 'package:flutter/material.dart';

class CubidBannerSampleTab extends StatelessWidget {
  const CubidBannerSampleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text("Banner Size: 320x50"),
          _cubidBanner(CubidBannerSize.fixed320x50),
          Text("Banner Size: 320x100"),
          _cubidBanner(CubidBannerSize.fixed320x100),
          Text("Banner Size: 300x250"),
          _cubidBanner(CubidBannerSize.fixed300x250),
        ],
      ),
    );
  }

  Widget _cubidBanner(CubidBannerSize size) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 12, 0, 24),
      child: CubidBanner(
        placementId: CubidConfig.bannerId(size),
        size: size,
        onLoaded: () {
          print("Cubid BannerLoaded $size");
        },
        onFailed: (failed) {
          print("Cubid Banner Failed $size // $failed");
        },
        onPresent: () {
          print("Cubid Banner Present $size");
        },
        onClick: () {
          print("Cubid Banner Click $size");
        },
      ),
    );
  }
}
