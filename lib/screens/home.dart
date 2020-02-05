// import 'dart:html';
import 'dart:io';
import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:carigari/screens/homescreen.dart';
import 'package:carigari/screens/update.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/material.dart';
import '../Arrangements/sizeModification.dart';
import '../Arrangements/variables.dart' as global;
import 'package:url_launcher/url_launcher.dart';

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


    QuerySnapshot  up;

       up = await Firestore.instance.collection("data").getDocuments();
    update.isEmpty ? update.addAll(up.documents) : null;
    final PackageInfo info = await PackageInfo.fromPlatform();
    currentVersion = double.parse(info.version.trim().replaceAll(".", ""));
    try {
      // Using default duration to force fetching from remote server.

      newVersion =
          double.parse(update[6].data["version"].trim().replaceAll(".", ""));
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

  // callTest(){
  //   print("in 2nd");
  //   calTest();

  // }

  // calTest(){
  //   print("in 3");
  // }
  // Widget CategoryData(){
  //   print("in catefory data");
  //   // CategoryData(index);
  //   return Scaffold(
  //     appBar: new AppBar(
  //       // title: Text(category[index].data['a']),
  //       title: Text("hai"),
  //     ),
  //     body: Container(
  //       child:Text("data"),
  //     ),
  //   );
  // }
// void dispose(){
//   super.dispose();
// }
  


  @override
  Widget build(BuildContext context) {
    print("inside build of home screen");

   
if(!isLoading){
  return MaterialApp(
    home: isUpdate  ? Update() : HomeScreen(),
  );
}
else{
    return MaterialApp(
    home: Scaffold(
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
            child: Center(
                child:Container(child:Text("Loading"))))));
}}}
//     color:Color.fromRGBO(255,216,180,.6),
//     child: ListView.builder(
//     // controller: _scrollController,
//     itemCount: global.category.length,
//     itemBuilder: (context, index) {
//       return Card(
//         color:Colors.cyan[100],
//         child:ListTile(
//         leading: CircleAvatar(
//           backgroundImage: NetworkImage(global.category[index].data['image']),
//         ),
//         // contentPadding: EdgeInsets.all(5),
//         title: Text(global.category[index].data['a'],style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.w600,
//               fontSize: SizeConfig.blockSizeVertical * 2.9,)),
//         subtitle: Text("Price Starts from ₹ "+global.category[index].data['price']),
//         // dense: true,
//         onTap: (){
//           // Navigator.pushNamed(context,"ContactUs");
//           Navigator.pushNamed(context, "SubCategory");
//           // SubCategory(index);
//           global.TempIndex=index;

//           print("clicked"+global.category[index].data['a']+global.TempIndex.toString());
//         },
//         // onLongPress: (){
//         //   //  CategoryData(index);
//         //   Navigator.pushNamed(context, "ContactForm");
//         // },
//         // onTap: (){
//         //   print("clicked"+category[index].data['a']);
//         //   // CategoryData();
//         //   // Navigator.pushNamed(context,"CategoryData");
//         //   // CategoryData(index);
//         //   Navigator.pushNamed(context,"Account");
//         //   print("clicked 2 nd tinem  "+category[index].data['a']);

//         // },
//         // onTap:(){
//         //   print("clicked"+category[index].data['a']);
//         //   msg=category[index].data['a'];
//         //   // SubCategory(msg
//         //   //   );

//         //   Navigator.push(
//         //     context,
//         //     MaterialPageRoute(
//         //         builder: (context) => SubCategory(msg
//         //             )
//         //             )
//         //             );

//         //   },
//         // e=category[index].data['a'],
//         // onTap: SubCategory(category[index].data['a'],index),
//         // subtitle: Text(category[index].data['short_desc']),
//       ));
//     },
// ),
//   ),
//           ),
//           isLoading
//               ? Container(
//                 child: Text("Loading"),
//                   // width: MediaQuery.of(context).size.width,
//                   // padding: EdgeInsets.all(5),
//                   // color: Colors.yellowAccent,
//                   // child: Text(
//                   //   'Loading',
//                   //   textAlign: TextAlign.center,
//                   //   style: TextStyle(
//                   //     fontWeight: FontWeight.bold,
//                   //   ),
//                   // ),
//                 )
//               : Container()

//           //   Column(children:<Widget>
//           //   [
//           //     Expanded(child:category.length==0?
//           //     Center(
//           //       child:Text("data"),
//           //     )
//           //     :
//           //     ListView.builder(
//           //       itemCount: category.length,
//           //       itemBuilder: (context,index){
//           //         return ListTile(
//           //           title: Text(category[index].data['a']),
//           //         );
//           //       },
//           //     ),
//           //     // isLoading?Text("Loading"):Container()
//           //     ),
//           //   ]
//           // ),

//           ]
//           ),
//         ),
//       ),
//     ),
//     );
//    }

// }
