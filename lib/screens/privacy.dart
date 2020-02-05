import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Privacy extends StatefulWidget {
  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  List<DocumentSnapshot> data = [];
  bool isLoading = false;
  void initState() {
    print("in init state");
    super.initState();
    geList();
  }

  geList() async {
    setState(() {
      isLoading = true;
    });

    QuerySnapshot qp;
    qp = await Firestore.instance.collection("data").getDocuments();

    data.isEmpty ? data.addAll(qp.documents) : null;

    print("category");

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Privacy Info"),
            backgroundColor: Color.fromRGBO(191, 32, 37, 1.0),
          ),
          bottomNavigationBar: bottomnavigation(context, 1),
          drawer: theDrawer(context),
          body: isLoading
              ? Center(
                  child: SizedBox(
                  child: Text("Loading"),
                ))
              : WillPopScope(
                  onWillPop: () {
                    Navigator.pushReplacementNamed(context, 'HomeScreen');
                  },
                  child: Column(
                    children: <Widget>[
                      data.isEmpty
                          ? Center(
                              child: Text(
                              "Details will be updated soon",
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeVertical * 2.5,
                                  color: Colors.green),
                            ))
                          : SizedBox(height: SizeConfig.blockSizeVertical * 5),
                      Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 5),
                        child: SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 95,
                            child: Text(
                              "${data[4].data['content']}",
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeVertical * 2.5,
                                  color: Colors.green),
                            )),
                      )
                    ],
                  ),
                ),
        ));
  }
}
