import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:my_project/Ads/interstitial_ad.dart';
import 'package:my_project/Ads/open_app_ad.dart';
import 'package:my_project/Ads/rewarded_ad.dart';
import 'Ads/native_ad_repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BannerAd? bannerAd;

  @override
  void initState() {
    showBannerAd();
    OpenAppAdRepository.showOpenAppAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('My Project'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(onPressed: () {}, child: const Text('Banner Ad')),
              ElevatedButton(onPressed: () {
                RewardedAdRepository.showRewardedAd();
              }, child: const Text('Reward Ad')),
              ElevatedButton(
                  onPressed: () {
                    OpenAppAdRepository.showOpenAppAd();
                  },
                  child: const Text('OpenApp Ad')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NativeAdRepository(),
                        ));
                  },
                  child: const Text('Native Ad')),
              ElevatedButton(
                  onPressed: () {
                    IntersticialRepository.loadInterstitialAd();
                  },
                  child: const Text('Interstitial Ad')),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              if (bannerAd != null)
                SizedBox(
                    width: bannerAd!.size.width.toDouble(),
                    height: bannerAd!.size.height.toDouble(),
                    child: AdWidget(ad: bannerAd!))
            ],
          ),
        ),
      ),
    );
  }

  void showBannerAd() {
    BannerAd(
            size: AdSize.banner,
            adUnitId: 'ca-app-pub-3940256099942544/6300978111',
            listener: BannerAdListener(
              onAdLoaded: (ad) {
                bannerAd = ad as BannerAd;
                log('$ad banner');
              },
              onAdFailedToLoad: (ad, error) {
                log('$ad failed to load: error');
              },
            ),
            request: const AdRequest())
        .load();
  }
}
