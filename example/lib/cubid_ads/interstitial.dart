import 'package:cubid_flutter/cubid_flutter.dart';
import 'package:cubid_flutter_example/cubid_config.dart';
import 'package:flutter/material.dart';

class CubidInterstitialSampleTab extends StatefulWidget {
  const CubidInterstitialSampleTab({super.key});

  @override
  State<CubidInterstitialSampleTab> createState() =>
      _CubidInterstitialSampleTabState();
}

class _CubidInterstitialSampleTabState
    extends State<CubidInterstitialSampleTab> {
  final cubidFlutter = CubidFlutter();

  CubidInterstitial? interstitial;
  CubidInterstitialEventType interstitialEvent =
      CubidInterstitialEventType.notLoaded;
  bool _isInitialized = false;
  @override
  void initState() {
    super.initState();

    setupInterstitial();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return Center(
        child: Text(
          "SDK has not\ninitialized Successfully",
          textAlign: TextAlign.center,
        ),
      );
    }
    bool isLoaded = interstitialEvent == CubidInterstitialEventType.loaded;
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Text("Interstitial Ad Status")),
                      Text(
                        interstitialEvent.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: SizedBox()),
          Container(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  isLoaded ? Colors.red : Colors.blue,
                ),
              ),
              onPressed: () {
                if (isLoaded) {
                  showInterstitial();
                } else {
                  loadInterstitial();
                }
              },
              child: Text(
                isLoaded ? "Show Interstitial" : 'Load Interstitial',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void setupInterstitial() {
    _isInitialized =
        cubidFlutter.initializationStatus == CubidInitState.initialized;
    if (!_isInitialized) {
      //Always Check Initialization before creating or loading
      return;
    }
    interstitial = cubidFlutter.createInterstitial(
      placementId: CubidConfig.interstitialId,
    );
    interstitial!.events.listen((event) {
      setState(() => interstitialEvent = event.type);
      print('Cubid [Interstitial Event] ${event.type}');
    });
    setState(() {
      _isInitialized = _isInitialized;
    });
  }

  Future<void> loadInterstitial() => interstitial!.load();
  Future<void> showInterstitial() => interstitial!.show();
}
