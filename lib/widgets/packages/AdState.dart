import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState {
  Future<InitializationStatus> initialization;

  AdState(this.initialization);

  String get bannerAdUnitId => Platform.isAndroid
      ? "ca-app-pub-3940256099942544/6300978111"
      : "ca-app-pub-3940256099942544/2934735716";

  AdListener adListener = AdListener(
    onAdLoaded: (_) {
      print("adLoaded");
    },
    onAdFailedToLoad: (_, error) {
      print('Ad load failed (code=${error.code} message=${error.message})');
    },
  );
}
