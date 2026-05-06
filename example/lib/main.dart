import 'package:cubid_flutter/cubid_flutter.dart';
import 'package:cubid_flutter_example/cubid_ads/banner.dart';
import 'package:cubid_flutter_example/cubid_ads/interstitial.dart';
import 'package:cubid_flutter_example/cubid_ads/native_banner.dart';
import 'package:cubid_flutter_example/cubid_ads/rewarded.dart';
import 'package:cubid_flutter_example/cubid_config.dart';
import 'package:flutter/material.dart';

//Your User Id
final String _userId = "user1234";
String _errorMessage = "";
final cubidFlutter = CubidFlutter();
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initializeCubid();
  }

  Future<void> _initializeCubid() async {
    cubidFlutter.initialize(
      setId: CubidConfig.appId,
      userId: _userId,
      onInitialized: _onInitialized,
      onFailed: _onFailed,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onInitialized() {
    debugPrint("Cubid Init Success");
    setState(() {});
  }

  void _onFailed(String errorMessage) {
    debugPrint("Cubid Init Failed $errorMessage");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cubid Flutter Sample'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            _cubidStatusCard(),
            Expanded(
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      tabs: [
                        Tab(text: "Rewarded Video"),
                        Tab(text: "Interstitial Ad"),
                        Tab(text: "Banner Ads"),
                        Tab(text: "Native Banner"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        key: Key(
                          "CubidView_${cubidFlutter.initializationStatus.name}",
                        ),
                        children: [
                          CubidRewardedVideoAdSampleTab(),
                          CubidInterstitialSampleTab(),
                          CubidBannerSampleTab(),
                          CubidNativeBannerSampleTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cubidStatusCard() {
    bool initHasFailed =
        cubidFlutter.initializationStatus == CubidInitState.failed;
    return Card(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text("Cubid Init Status")),
                Icon(
                  Icons.circle,
                  color: initHasFailed ? Colors.red : Colors.green,
                  size: 12,
                ),
                SizedBox(width: 8),
                Text(
                  cubidFlutter.initializationStatus.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            if (initHasFailed)
              Text(_errorMessage, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
