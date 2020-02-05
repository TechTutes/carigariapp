import 'dart:io';
import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/screens/bottomNavigation.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/material.dart';
import '../Arrangements/sizeModification.dart';
import '../Arrangements/variables.dart' as global;

// import 'package:provider/provider.dart';
class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool isLoading = false, productIs = true;
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
    super.initState();
    getCategoryList();
  }

  getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    // if(global.category==null){

    // }
    print("geting instance for category");
    QuerySnapshot qp, g;
    qp = await Firestore.instance
        .collection("${global.categories[global.touch].data['name']}")
        .getDocuments();

    global.category.isEmpty ? global.category.addAll(qp.documents) : null;
    g = await Firestore.instance.collection("data").getDocuments();
    global.data.isEmpty ? global.data.addAll(g.documents) : null;

    if (global.category.isEmpty) {
      setState(() {
        productIs = false;
      });
    }
    // print("${global.category[0].data['name']}");
    print("category");

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldkey,
        appBar: new AppBar(
          backgroundColor: Color.fromRGBO(191, 32, 37, 1.0),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(global.categories[global.touch].data['name']),
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
          child: productIs
              ? Column(children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Text("List of Products",
                        style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockSizeVertical * 3.5,
                        )),
                  ),
                  Expanded(
                    child: global.category.length == 0
                        ? Center(
                            child: Text('loading'),
                          )
                        : Container(
                            color: Colors.white,
                            // Color.fromRGBO(255,216,180,.6),
                            child: ListView.builder(
                              // controller: _scrollController,
                              itemCount: global.category.length,
                              itemBuilder: (context, index) {
                                return Card(
                                    color: Colors.cyan[100],
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "https://drive.google.com/thumbnail?id=${global.category[index].data['image']}"),
                                      ),
                                      // contentPadding: EdgeInsets.all(5),
                                      title: Text(
                                          global.category[index].data['name'],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    2.9,
                                          )),
                                      subtitle: Text(
                                          "Price Starts from ₹ ${global.category[index].data['price']}"),
                                      // dense: true,
                                      onTap: () {
                                        // Navigator.pushNamed(context,"ContactUs");
                                        Navigator.pushNamed(
                                            context, "SubCategory",
                                            arguments: index);
                                        // SubCategory(index);
                                        // global.TempIndex=index;

                                        print("clicked" +
                                            global
                                                .category[index].data['name']);
                                      },
                                      // onLongPress: (){
                                      //   //  CategoryData(index);
                                      //   Navigator.pushNamed(context, "ContactForm");
                                      // },
                                      // onTap: (){
                                      //   print("clicked"+category[index].data['a']);
                                      //   // CategoryData();
                                      //   // Navigator.pushNamed(context,"CategoryData");
                                      //   // CategoryData(index);
                                      //   Navigator.pushNamed(context,"Account");
                                      //   print("clicked 2 nd tinem  "+category[index].data['a']);

                                      // },
                                      // onTap:(){
                                      //   print("clicked"+category[index].data['a']);
                                      //   msg=category[index].data['a'];
                                      //   // SubCategory(msg
                                      //   //   );

                                      //   Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => SubCategory(msg
                                      //             )
                                      //             )
                                      //             );

                                      //   },
                                      // e=category[index].data['a'],
                                      // onTap: SubCategory(category[index].data['a'],index),
                                      // subtitle: Text(category[index].data['short_desc']),
                                    ));
                              },
                            ),
                          ),
                  ),
                  isLoading
                      ? Container(
                          child: Text("Loading"),
                          // width: MediaQuery.of(context).size.width,
                          // padding: EdgeInsets.all(5),
                          // color: Colors.yellowAccent,
                          // child: Text(
                          //   'Loading',
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        )
                      : Container()

                  //   Column(children:<Widget>
                  //   [
                  //     Expanded(child:category.length==0?
                  //     Center(
                  //       child:Text("data"),
                  //     )
                  //     :
                  //     ListView.builder(
                  //       itemCount: category.length,
                  //       itemBuilder: (context,index){
                  //         return ListTile(
                  //           title: Text(category[index].data['a']),
                  //         );
                  //       },
                  //     ),
                  //     // isLoading?Text("Loading"):Container()
                  //     ),
                  //   ]
                  // ),
                ])
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Center(
                      child: Text(
                        global.data.isEmpty
                            ? "\n\n\n\nThere are no products in this category."
                            : "\n\n\n\n${global.data[5].data["not-available"]}",
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeVertical * 2.5,
                            color: Colors.green),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 95,
                          height: SizeConfig.blockSizeVertical * 5.5,
                          child: RaisedButton(
                              elevation: 5.0,
                              color: Colors.brown[400],
                              child: Text("Continue Shopping",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.blockSizeVertical * 4,
                                  )),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, "HomeScreen");
                              }),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 2,
                        )
                      ],
                    ),
                    //  SizedBox(height:5)
                  ],
                ),
        ));
  }
}
