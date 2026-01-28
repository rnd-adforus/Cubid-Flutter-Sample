import 'package:cubid_flutter/cubid_flutter.dart';
import 'package:cubid_flutter_example/cubid_config.dart';
import 'package:flutter/material.dart';

class CubidRewardedVideoAdSampleTab extends StatefulWidget {
  const CubidRewardedVideoAdSampleTab({super.key});

  @override
  State<CubidRewardedVideoAdSampleTab> createState() =>
      _CubidRewardedVideoAdSampleTabState();
}

class _CubidRewardedVideoAdSampleTabState
    extends State<CubidRewardedVideoAdSampleTab> {
  final cubidFlutter = CubidFlutter();
  CubidRewarded? rewardAd;
  CubidRewardedEventType rewardAEvent = CubidRewardedEventType.notLoaded;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    setupReward();
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
    bool isLoaded = rewardAEvent == CubidRewardedEventType.loaded;
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
                      Expanded(child: Text("Reward Ad Status")),
                      Text(
                        rewardAEvent.name,
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
                  showReward();
                } else {
                  loadReward();
                }
              },
              child: Text(
                isLoaded ? "Show Reward Ad" : 'Load Reward Ad',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void setupReward() {
    _isInitialized =
        cubidFlutter.initializationStatus == CubidInitState.initialized;
    if (!_isInitialized) {
      //Always Check Initialization before creating or loading
      return;
    }
    rewardAd = cubidFlutter.createRewarded(placementId: CubidConfig.rewardedId);
    rewardAd!.events.listen((e) {
      setState(() => rewardAEvent = e.type);
      print('Cubid [Reward Event] ${e.type}');
    });
  }

  Future<void> loadReward() => rewardAd!.load();
  Future<void> showReward() => rewardAd!.show();
}
