// import 'dart:html';
import 'dart:io';
import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:carigari/screens/homescreen.dart';
import 'package:carigari/screens/update.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/material.dart';
import '../Arrangements/sizeModification.dart';

import 'package:package_info/package_info.dart';

// import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  // List<DocumentSnapshot> category=[];
  bool isLoading = false, isUpdate = false;
  List<DocumentSnapshot> update = [];
  // double
  double currentVersion;
  double newVersion;

  var msg;

  @override
  void initState() {
    print("in init state");

    super.initState();
    getCList();
  }

  getCList() async {
    setState(() {
      isLoading = true;
    });
    // if(global.category==null){
    print("inside categorylist");
    // }

    QuerySnapshot up;

    up = await Firestore.instance.collection("data").getDocuments();
    update.isEmpty ? update.addAll(up.documents) : null;
    final PackageInfo info = await PackageInfo.fromPlatform();
    currentVersion = double.parse(info.version.trim().replaceAll(".", ""));
    try {
      // Using default duration to force fetching from remote server.

      newVersion = update[7].data["version"] == null
          ? 100
          : double.parse(update[7].data["version"].trim().replaceAll(".", ""));
      ;

      if (newVersion > currentVersion) {
        isUpdate = true;

        print("inside try if");
      }
    } catch (exception) {
      print('Unable to fetch update version '
          'used');
    }
    // :SizedBox();
    // var dem=global.categories[10].data["name"];
    // print(dem["name"]);
    print("categories");
    // print("hai at end");
    // callTest();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("inside build of home ");

    if (!isLoading) {
      print("loading is not true in home");
       
            return Scaffold(body:            isUpdate ? Update() : HomeScreen()
);
      
    } else {
      print("loading is true in home");

      return Scaffold(
          appBar: new AppBar(
            backgroundColor: Color.fromRGBO(191, 32, 37, 1.0),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Carigari'),
                Image.asset(
                  'images/logo.png',
                  fit: BoxFit.fill,
                  height: SizeConfig.blockSizeVertical * 4.5,
                ),
              ],
            ),
          ),
          drawer: theDrawer(context),
          bottomNavigationBar: bottomnavigation(context, 0),
          body: WillPopScope(
              onWillPop: () {
                Navigator.pushReplacementNamed(context, 'HomeScreen');
              },
              child: Center(child: Container(child: Text("Loading")))));
    }
  }
}
