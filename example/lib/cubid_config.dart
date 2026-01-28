import 'dart:io';

import 'package:cubid_flutter/cubid_flutter.dart';

class CubidConfig {
  static String get appId {
    if (Platform.isAndroid) return 'OQf8T68ys9';
    if (Platform.isIOS) return '93O4czothe';
    throw UnsupportedError('Unsupported platform');
  }

  static String bannerId(CubidBannerSize size) {
    if (Platform.isAndroid) {
      switch (size) {
        case CubidBannerSize.fixed320x50:
          return 'uyXywuOXTt';
        case CubidBannerSize.fixed320x100:
          return '2l5mnYUkY3';
        case CubidBannerSize.fixed300x250:
          return '6ZhfQTQoHX';
      }
    }

    if (Platform.isIOS) {
      switch (size) {
        case CubidBannerSize.fixed320x50:
          return 'bEiQuvFrVp';
        case CubidBannerSize.fixed320x100:
          return 'qyoc6iVP2X';
        case CubidBannerSize.fixed300x250:
          return 'FpMXfTOI1v';
      }
    }

    throw UnsupportedError('Unsupported platform');
  }

  static String get interstitialId {
    if (Platform.isAndroid) return '5jd1pALQ5Z';
    if (Platform.isIOS) return 'WGKfy6mDf5';
    throw UnsupportedError('Unsupported platform');
  }

  static String get rewardedId {
    if (Platform.isAndroid) return 'u365gjTAxA';
    if (Platform.isIOS) return 'U4L9FnsiFb';
    throw UnsupportedError('Unsupported platform');
  }

  static String get nativeId {
    if (Platform.isAndroid) return '5xJlpEi80m';
    if (Platform.isIOS) return 'ofvK0zNEgJ';
    throw UnsupportedError('Unsupported platform');
  }
}
