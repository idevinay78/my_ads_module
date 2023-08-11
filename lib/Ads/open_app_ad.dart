import 'dart:developer';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class OpenAppAdRepository {
  static void showOpenAppAd() {
    AppOpenAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/3419835294',
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            ad.show();
            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdShowedFullScreenContent: (ad) {
                ad.dispose();
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                ad.dispose();
              },
            );
          },
          onAdFailedToLoad: (error) {
            log('failed to load due to: $error');
          },
        ),
        orientation: 1);
  }
}
