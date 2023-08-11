import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeAdRepository extends StatefulWidget {
  const NativeAdRepository({super.key});

  @override
  State<NativeAdRepository> createState() => _NativeAdRepositoryState();
}

class _NativeAdRepositoryState extends State<NativeAdRepository> {
  NativeAd? _nativeAd;

  @override
  void initState() {
    showAd();
    super.initState();
  }

  NativeAd showAd() {
    return NativeAd(
        adUnitId: 'ca-app-pub-3940256099942544/2247696110',
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            setState(() {
              _nativeAd = ad as NativeAd;
            });
          },
          onAdFailedToLoad: (ad, error) {
            log('$ad failed to load due to: $error');
          },
          onAdOpened: (ad) {
            log('$ad opened');
          },
          onAdClosed: (ad) {
            log('$ad closed');
          },
        ),
        nativeTemplateStyle:
            NativeTemplateStyle(templateType: TemplateType.small),
        request: const AdRequest())
      ..load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Native Ad')),
      body: Column(
        children: [
          const Text(
              'data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data '),
          const SizedBox(
            height: 40,
          ),
          if (_nativeAd != null)
            ConstrainedBox(
                constraints:
                    const BoxConstraints(maxHeight: 200, maxWidth: 200),
                child: AdWidget(ad: _nativeAd!)),
          const SizedBox(height: 20),
          const Text(
              'data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data '),
          const SizedBox(
            height: 70,
          ),
          const Text(
              'data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data '),
        ],
      ),
    );
  }
}
