// import 'dart:html';
import 'dart:io';
import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:carigari/screens/update.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import '../Arrangements/sizeModification.dart';
import '../Arrangements/variables.dart' as global;

// import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<DocumentSnapshot> category=[];
  bool isLoading = false, isUpdate = false;
  List<DocumentSnapshot> carousel = [];

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  var msg;
  void callSnackBar(String me) {
    print("called me for scnack bar");
    final SnackBar = new prefix0.SnackBar(
      content: new Text(me),
      duration: new Duration(seconds: 3),
      action: new SnackBarAction(
        label: "OK",
        onPressed: () {
          // Navigator.pushNamed(context, ;
          exit(0);
        },
      ),
      // backgroundColor: Colors.blue,
    );
    _scaffoldkey.currentState.showSnackBar(SnackBar);
  }

  @override
  void initState() {
    print("in init state");
    getCategoryList();
    super.initState();
  }

  getCategoryList() async {
    setState(() {
      isLoading = true;
    });

    if (global.category.length > 0) {
      global.category.removeRange(0, global.category.length);
    }

    QuerySnapshot qp, cs, up;
    qp = await Firestore.instance.collection("categories").getDocuments();
    global.categories.isEmpty ? global.categories.addAll(qp.documents) : null;
    cs = await Firestore.instance.collection("Carousel").getDocuments();
    carousel.isEmpty ? carousel.addAll(cs.documents) : null;

    setState(() {
      isLoading = false;
    });
  }

  Widget CarouselImages() {
    print("inside carousell");

    return new Container(
        color: Colors.white,
        child: new CarouselSlider(
          enlargeCenterPage: true,
          autoPlay: true,
          pauseAutoPlayOnTouch: Duration(seconds: 5),
          height: MediaQuery.of(context).size.height / 4,
          items: [
            carousel.isEmpty
                ? "http://carigarifurniture.com/product_images/w/133365e0_a1b8_4f6d_89b5_d71cf79c27ef__92495_thumb.jpg"
                : "https://drive.google.com/uc?id=${carousel[0].data["image1"]}",
            carousel.isEmpty
                ? "http://carigarifurniture.com/product_images/h/img_6539__14221_thumb.jpg"
                : "https://drive.google.com/uc?id=${carousel[0].data["image2"]}",

            carousel.isEmpty
                ? "http://carigarifurniture.com/product_images/w/cbb92cd2_d785_4288_a51a_88766576d6aa_1___10086_thumb.jpg"
                : "https://drive.google.com/uc?id=${carousel[0].data["image3"]}",

            carousel.isEmpty
                ? "http://carigarifurniture.com/product_images/h/img_6539__14221_thumb.jpg"
                : "https://drive.google.com/uc?id=${carousel[0].data["image4"]}",

            carousel.isEmpty
                ? "http://carigarifurniture.com/product_images/w/cbb92cd2_d785_4288_a51a_88766576d6aa_1___10086_thumb.jpg"
                : "https://drive.google.com/uc?id=${carousel[0].data["image5"]}"

            // 'https://www.woodenstreet.com/images/furniture-bangalore/noida/image-new2.jpg',
            // 'https://www.woodenstreet.com/images/furniture-bangalore/noida/image-new4.jpg',
            // 'https://www.woodenstreet.com/images/furniture-bangalore/noida/image-new5.jpg',
            // 'https://www.woodenstreet.com/images/furniture-bangalore/noida/image-new6.jpg'
            // 'http://carigarifurniture.com/product_images/x/2d5d9976_8c0a_40b2_a6f6_5002b7d44341_1___01341_thumb.jpg',
            // 'http://carigarifurniture.com/product_images/u/img_1942__56042_thumb.jpg',
            // 'http://carigarifurniture.com/product_images/c/img_2162__63286_thumb.jpg'
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(color: Colors.grey),
                    child: GestureDetector(
                        child: Image.network(
                          i,
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.width,
                        ),
                        onTap: () {
                          // callSnackBar("clicked"+ i+"image",2);
                        }));
              },
            );
          }).toList(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    print("inside build of home screen");

    void show() {
      // flutter defined function
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext ctxt) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text(
              "Exit Page",
              style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 2.5),
            ),
            content: new Text(
              "Are you sure you want to exit from the APP",
              style: TextStyle(fontSize: 14.0),
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("NO"),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop(true);
                  //   ctxt,
                  //   new MaterialPageRoute(builder: (ctxt) => new Privacy()),
                  // );
                  Navigator.pushReplacementNamed(context, "HomeScreen");
                  // Navigator.pop(context);
                },
              ),
              new FlatButton(
                child: new Text("YES, EXIT"),
                onPressed: () {
                  exit(0);
                  // Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
final appbar= new AppBar(
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
      );
    return Scaffold(
      key: _scaffoldkey,
      appBar:appbar,
      drawer: theDrawer(context),
      bottomNavigationBar: bottomnavigation(context, 0),
      body: WillPopScope(
          onWillPop: () {
            // Navigator.pushNamed(context,''),
            show();
          },
          child: Center(
              child: Container(
            color: Color.fromRGBO(255, 216, 180, .1),
            child: Column(children: <Widget>[
              CarouselImages(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text("Select by Category",
                    style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.w400,
                      fontSize: (MediaQuery.of(context).size.height - appbar.preferredSize.height) *0.038
,
                    )),
              ),
              Expanded(
                child: global.categories.length == 0
                    ? Center(
                        child: Text('loading'),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.all(10.0),
                        itemCount: global.categories.length,
                        itemBuilder: (ctx, i) {
                          print("inside grid view of home screen");
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.30,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 4.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: GridTile(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, "Product",
                                          arguments: i);
                                      global.touch = i;
                                      print(global.touch);
                                      print("${global.category.length}");

                                      print(
                                          "${global.categories[global.touch].data['name']}");
                                    },
                                    child: Hero(
                                      tag: global.categories[i],
                                      child: Image.network(
                                        "https://drive.google.com/uc?id=${global.categories[i].data['image']}",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  footer: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, "Product",
                                          arguments: i);
                                      global.touch = i;
                                      print(
                                          "${global.categories[global.touch].data['name']}");
                                      print("${global.category.length}");
                                    },
                                    child: GridTileBar(
                                      backgroundColor: Colors.black38,
                                      title: Text(
                                        global.categories[i].data['name'],
                                        // style:TextStyle(color: Colors.black),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 92 / 100,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                      ),
              ),
              isLoading
                  ? Container(
                      child: Text("Loading"),
                    )
                  : Container()
            ]),
          ))),
    );
  }
}
