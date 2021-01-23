import 'package:flutter/material.dart';
import 'package:flutter_animation_demo/widget_change_notifier.dart';
import 'package:provider/provider.dart';

import 'my_animated_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => WidgetChangeNotifier(),
        child: MyHomePage(title: "Flutter Animation Demo"),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetChangeNotifier widgetChangeNotifier =
        Provider.of<WidgetChangeNotifier>(context);
    return Scaffold(
      appBar:
          AppBar(title: Text(widgetChangeNotifier.currentAnimatedWidget.name)),
      body: Center(child: widgetChangeNotifier.currentAnimatedWidget.widget),
      drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView.builder(
        itemBuilder: (context, index) {
          MyAnimatedWidget mWidget = widgetChangeNotifier.widgets[index];
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
}
