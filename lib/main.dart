import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animation_demo/AnimatedWidgets/source_code_view.dart';
import 'package:flutter_animation_demo/ad_helper.dart';
import 'package:flutter_animation_demo/widget_change_notifier.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import 'my_animated_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => WidgetChangeNotifier(),
        child: MyHomePage(title: "Flutter Animation Demo"),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BannerAd myBanner;
  AdWidget adWidget;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      myBanner = BannerAd(
          adUnitId: AdHelper.bannerAdUnitId,
          size: AdSize.banner,
          request: AdRequest(),
          listener: AdHelper.listener)
        ..load();
      adWidget = AdWidget(ad: myBanner);
      print('ad is loaded');
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetChangeNotifier widgetChangeNotifier =
        Provider.of<WidgetChangeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widgetChangeNotifier.currentAnimatedWidget.name),
        actions: [
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => MySourceCodeView(
                          widgetChangeNotifier
                              .currentAnimatedWidget.filePath)));
            },
            tooltip: "Show source code",
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(child: widgetChangeNotifier.currentAnimatedWidget.widget),
            if (adWidget == null)
              SizedBox(
                height: 50,
              )
            else
              Container(
                margin: EdgeInsets.only(bottom: 8),
                height: 50,
                child: adWidget,
              ),
          ],
        ),
      ),
      drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView.builder(
        itemBuilder: (context, index) {
          MyAnimatedWidget mWidget = widgetChangeNotifier.widgets[index];
          if (index == 0) {
            return mWidget.widget;
          }
          return ListTile(
            title: Text(mWidget.name),
            onTap: () {
              widgetChangeNotifier.updateCurrentWidget(mWidget);
              Navigator.pop(context);
            },
          );
        },
        itemCount: widgetChangeNotifier.widgets.length,
      )),
    );
  }

  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }
}
