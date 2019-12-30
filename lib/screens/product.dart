import 'dart:io';
import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/screens/Data/Category.dart';
import 'package:carigari/screens/Data/contactForm.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:carigari/screens/contactUs.dart';
import 'package:carigari/screens/privacy.dart';
import 'package:carigari/screens/splashScreen.dart';
import 'package:carigari/screens/subcategory.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' ;
import 'package:flutter/material.dart' as prefix0;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import './showImage.dart';
import '../Arrangements/sizeModification.dart';
import '../Arrangements/variables.dart'as global;
// import 'package:provider/provider.dart';
class  Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
   bool isLoading=false;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  var msg;
  void callSnackBar(String me)
  {
    print("called me for scnack bar");
    final SnackBar =new prefix0.SnackBar(
      content: new Text(me),
      duration: new Duration(seconds: 3),
      action: new SnackBarAction(
        label: "OK",onPressed: (){
          // Navigator.pushNamed(context, ;
          exit(0);
        },
      ),
      // backgroundColor: Colors.blue,
    );
    _scaffoldkey.currentState.showSnackBar(SnackBar);
  }

  @override
  void initState(){
    print("in init state");
    super.initState();
    getCategoryList();
  }

  getCategoryList() async{
    setState(() {
      isLoading=true;
    });
    // if(global.category==null){

    // }
    QuerySnapshot qp;
    qp=await Firestore.instance.collection("categories").getDocuments();
    global.categories.isEmpty?global.categories.addAll(qp.documents):null;
    // :SizedBox();
  var dem=global.categories[11].data["subcat2"];
    print(dem["IMAGE"]);
    print("categories");
    // print("hai at end");
    // callTest();
    setState(() {
      isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
     final indx = ModalRoute.of(context).settings.arguments ; 

    return new Scaffold(
      key: _scaffoldkey,
      appBar: new AppBar(
        backgroundColor: Colors.cyan[300],
        title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 
               Text(global.categories[indx].data["name"]),
                   Image.asset(
                 'images/logo.png',
                  fit: BoxFit.fill,
                  height:SizeConfig.blockSizeVertical * 4.5,
                  
              ),
            ],

          ),
      ),
      drawer: theDrawer(context),
      bottomNavigationBar: bottomnavigation(context,0),
      body:
    
      
    );
  }
}
  // List<DocumentSnapshot> category=[];
 