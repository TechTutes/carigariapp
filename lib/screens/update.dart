import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/screens/bottomNavigation.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/material.dart';
import '../Arrangements/sizeModification.dart';
import '../Arrangements/variables.dart' as global;
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info/package_info.dart';

class Update extends StatefulWidget {
  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  bool isLoading = false, isUpdate = false;

  List<DocumentSnapshot> update = [];
  // double
  double currentVersion;
  double newVersion;
  @override
  void initState() {
    print("in init state");

    super.initState();
    getCategoryList();
  }

  getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    // if(global.category==null){
    print("inside update screen");
    // }

    QuerySnapshot up;

    up = await Firestore.instance.collection("data").getDocuments();
    update.isEmpty ? update.addAll(up.documents) : null;
    final PackageInfo info = await PackageInfo.fromPlatform();
    currentVersion = double.parse(info.version.trim().replaceAll(".", ""));
          print(" this is update ${update[7].data["version"]}");

    try {
      // Using default duration to force fetching from remote server.

      newVersion =
          double.parse(update[7].data["version"].trim().replaceAll(".", ""));
      ;
      print(" this is update ${update[7].data["version"]}");

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
    print("updates");
    // print("hai at end");
    // callTest();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  Navigator.pushReplacementNamed(context, "HomeScreen");
                },
                child: Center(
                  child: isLoading
                      ? Container(child: Text("Loading"))
                      : SizedBox(
                          height: MediaQuery.of(context).size.height / 3.5,
                          child: Card(
                            margin: EdgeInsets.only(top:18,right:9,left:12),
                            elevation: 5.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const ListTile(
                                  leading: Icon(Icons.notifications_active),
                                  title: Text('New Update Available',style:TextStyle(fontSize: 19)),
                                  subtitle: Text(
                                      'A new version of our App is in play Store, Please Update!!',style:TextStyle(fontSize: 17)),
                                ),
                                ButtonBar(
                                  children: <Widget>[
                                    FlatButton(
                                      child: const Text("Update",style:TextStyle(fontSize: 19)),
                                      onPressed: () async {
                                        //  var whatsappUrl ="whatsapp://send?phone=$phone";
                                        await canLaunch(
                                                "https://play.google.com/store/apps/details?id=conversionguru.in.carigari")
                                            ? launch(
                                                "https://play.google.com/store/apps/details?id=conversionguru.in.carigari")
                                            : print(
                                                "playstore can't be loaded");

                                        // Navigator.pop(context);
                                      },
                                    ),
                                    FlatButton(
                                      child: const Text("Later",style:TextStyle(fontSize:19.0)),
                                      onPressed: () {
                                        //  setState(() {
                                        //  isUpdate = false;
                                        //  });
                                        // Navigator.of(context, rootNavigator: true)
                                        //     .pop(true);
                                        // Navigator.pop(context);

                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pushReplacementNamed("HomeScreen");
                                        // Navigator.pushReplacementNamed(context, "HomeScreen");

                                        // exit(0);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                )));
  }
}
