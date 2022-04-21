import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_version/new_version.dart';

import 'contact.dart';
import 'home.dart';
import 'radio.dart';
import 'news.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPage = 3;
  @override
  void initState() {
    super.initState();

    // Instantiate NewVersion manager object (Using GCP Console app as example)
    final newVersion = NewVersion(
      // iOSId: 'com.google.Vespa',
      androidId: 'com.mahayan.radiomahayan',
    );

    // You can let the plugin handle fetching the status and showing a dialog,
    // or you can fetch the status and display your own dialog, or no dialog.
    const simpleBehavior = true;

    if (simpleBehavior) {
      basicStatusCheck(newVersion);
    } else {
      advancedStatusCheck(newVersion);
    }
  }

  basicStatusCheck(NewVersion newVersion) {
    newVersion.showAlertIfNecessary(context: context);
  }

  advancedStatusCheck(NewVersion newVersion) async {
    final status = await newVersion.getVersionStatus();
    debugPrint(status!.releaseNotes);
    debugPrint(status.appStoreLink);
    debugPrint(status.localVersion);
    debugPrint(status.storeVersion);
    debugPrint(status.canUpdate.toString());
    newVersion.showUpdateDialog(
      context: context,
      versionStatus: status,
      dialogTitle: 'Custom Title',
      dialogText: 'Custom Text',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //     // title: Text('Convex Botom Var'),
        //     ),
        body: [
          WebViewExample(),
          WebViewnews(),
          radiomahayan(),
          contact(),
        ][selectedPage],
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.blue,
          style: TabStyle.react,
          items: [
            TabItem(
              icon: Icons.store,
              title: 'ผลิตภัณฑ์',
            ),
            TabItem(
              icon: Icons.web,
              title: 'ข่าวสาร',
            ),
            TabItem(
              icon: Icons.radio,
              title: 'วิทยุออนไลน์',
            ),
            TabItem(
              icon: Icons.contact_mail,
              title: 'ติดต่อทีมงาน',
            ),
          ],
          initialActiveIndex: 3,
          onTap: (int i) {
            setState(() {
              selectedPage = i;
            });
          },
        ),
      ),
    );
  }
}
