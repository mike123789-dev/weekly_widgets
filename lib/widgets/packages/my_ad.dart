import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:weekly_widgets/widgets/packages/AdState.dart';

class MyAd extends StatefulWidget {
  @override
  _MyAdState createState() => _MyAdState();
}

class _MyAdState extends State<MyAd> {
  List<Object> itemList = [];

  BannerAd banner;
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 30; i++) {
      itemList.add(i);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        for (int i = itemList.length - 2; i >= 1; i -= 10) {
          itemList.insert(
              i,
              banner = BannerAd(
                size: AdSize.banner,
                adUnitId: adState.bannerAdUnitId,
                listener: adState.adListener,
                request: AdRequest(),
              )..load());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemBuilder: (c, i) {
          if (itemList[i] is int) {
            return ListTile(
              title: Text("dddd"),
            );
          } else {
            return Container(
              height: 50,
              color: Colors.white10,
              child: AdWidget(
                ad: itemList[i] as BannerAd,
              ),
            );
          }
        },
        itemCount: itemList.length,
      ),
    );
  }
}
