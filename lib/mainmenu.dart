import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:new_version/new_version.dart';
import './home.dart';
import './radio.dart';
import './contact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class _MyAppState extends State<MyApp> {
  int selectedPage = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //     // title: Text('Convex Botom Var'),
        //     ),
        body: [
          WebViewExample(),
          radiomahayan(),
          contact(),
        ][selectedPage],
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.blue,
          style: TabStyle.react,
          items: [
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
          initialActiveIndex: 1,
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

class _MyHomePageState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // Instantiate NewVersion manager object (Using GCP Console app as example)
    final newVersion = NewVersion(
      // iOSId: 'com.google.Vespa',
      androidId: 'com.google.android.apps.cloudconsole',
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
    // TODO: implement build
    throw UnimplementedError();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Example App"),
  //     ),
  //   );
  // }
}
