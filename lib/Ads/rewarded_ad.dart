import 'dart:developer';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedAdRepository {
  static void showRewardedAd() {
    RewardedAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/5224354917',
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdShowedFullScreenContent: (ad) {
                log('$ad ad showing');
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                log('$ad failed to load due to $error');
              },
            );
            ad.show(
              onUserEarnedReward: (ad, reward) {
                log('$reward earned');
              },
            );
          },
          onAdFailedToLoad: (error) {
            log('Ad failed to load due to $error');
          },
        ));
  }
}
