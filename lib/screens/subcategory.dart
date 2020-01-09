import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import '../Arrangements/variables.dart' as global;
import 'homescreen.dart';
import 'product.dart' as local;
// import '../Arrangements/variables.dart';

class SubCategory extends StatefulWidget {
  // SubCategory([int index]);

  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  bool isLoading = false, productIs = true;
  bool t = false, c = false;
  int j = 1, demo = 1,place;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
void callsnack(String dis){
final snack= new prefix0.SnackBar(
      content: new Text(dis),
      // duration: new Duration(seconds: 1),
      action: new SnackBarAction(
        label: "Shop",onPressed: (){
          Navigator.pushNamed(context, "HomeScreen");
          // exit(0);
        },
      ),
      // backgroundColor: Colors.blue,
    );
    _scaffoldkey.currentState.showSnackBar(snack);
  
}
  void callSnackBar(String me) {
    print("called me for scnack bar");
    final SnackBar = new prefix0.SnackBar(
      content: new Text(me),
      duration: new Duration(seconds: 1),
      // action: new SnackBarAction(
      //   label: "OK",onPressed: (){
      //     // Navigator.pushNamed(context, ;
      //     // exit(0);
      //   },
      // ),
      // backgroundColor: Colors.blue,
    );
    _scaffoldkey.currentState.showSnackBar(SnackBar);
  }

  @override
  Widget build(BuildContext context) {
    // void Alert(){
    //   return
    // }
    if (global.category.isEmpty) {
      setState(() {
        productIs = false;
      });
    }
    final index = ModalRoute.of(context).settings.arguments;
for (int i = 0;
                                          i < global.cart.length;
                                          i++) {
                                            if(global.cart.isNotEmpty){
                                        if (global
                                                .category[index].data["name"] ==
                                            global.cart[i].data["name"]) {
                                         setState(() {
                                            place = i;
                                         });
                                         
                                        }}
                                      }
    Alerting(BuildContext context) {
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              // elevation: 200.0,
              // backgroundColor: Colors.white60,
              // title: Text("Please Enter SMS Code"),
              titlePadding: EdgeInsets.all(20.0),
              content: Text(" Shop further Or Checkout",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.blockSizeVertical * 2.9,
                  )),
              contentPadding: EdgeInsets.all(10.0),

              actions: <Widget>[
                new FlatButton(
                  child: Text("Shop ",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.blockSizeVertical * 2.9,
                      )),
                  onPressed: () {
                    Navigator.pushNamed(context, "HomeScreen");
                  },
                ),
                new FlatButton(
                  child: Text("Checkout",
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.blockSizeVertical * 2.9,
                      )),
                  onPressed: () {
                    Navigator.pushNamed(context, "Cart");
                  },
                )
              ],
            );
          });
    }

    // TODO: implement build
    return Scaffold(
        key: _scaffoldkey,
        appBar: new AppBar(
          backgroundColor: Colors.cyan[300],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(global.category.isEmpty
                  ? "product"
                  : global.category[index].data['name']),
              Image.asset(
                'images/logo.png',
                fit: BoxFit.fill,
                height: SizeConfig.blockSizeVertical * 4.5,
              ),
            ],
          ),
        ),
        drawer: theDrawer(context),
        bottomNavigationBar: bottomnavigation(context, 2),
        body: WillPopScope(
          onWillPop: () {
            Navigator.pushNamed(context, 'Product');
          },
          child: productIs
              ?
              // WillPopScope(
              //   onWillPop: ()
              //   {
              //     Navigator.pushNamed(context,"Product",arguments: );
              //   },
              //   child:
              // Text(global.category[0].data['a']),
              // Text("\n"),
              Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 9.0),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 9,
                        width: SizeConfig.blockSizeVertical * 85,
                        child: Column(
                          // crossAxisAlignment:CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "\t\t\tProduct Description for ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.blockSizeVertical * 2.9,
                              ),
                            ),
                            Center(
                              child: Text(
                                global.category[index].data['name'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: SizeConfig.blockSizeVertical * 2.9,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width * 1,
                        child:
                            Image.network(global.category[index].data['image']),
                      ),
                      Divider(),

                      Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05),
                        width: MediaQuery.of(context).size.width * 0.99,
                        // height: MediaQuery.of(context).size.height * 0.21,
                        child: DataTable(
                          headingRowHeight:
                              MediaQuery.of(context).size.height * 0.0,
                          horizontalMargin:
                              MediaQuery.of(context).size.width * 0.03,
                          columnSpacing:
                              MediaQuery.of(context).size.width * 0.04,
                          sortAscending: true,
                          columns: <DataColumn>[
                            DataColumn(
                              // label: Text("First Name"),
                              numeric: false,

                              tooltip: " price",
                              label: Text(""),
                            ),
                            DataColumn(
                              label: Text(""),
                              numeric: false,
                              tooltip: "value",
                            ),
                          ],
                          rows: [
                            DataRow(
                              //for the data of session 1 in gold
                              cells: [
                                DataCell(
                                  Text("Price",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2.9,
                                      )),
                                  showEditIcon: false,
                                  placeholder: false,
                                ),
                                DataCell(
                                  Text(
                                      "₹ ${global.category[index].data['price']}",
                                      style: TextStyle(
                                        color: Colors.pink,
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2.8,
                                      )),
                                  showEditIcon: false,
                                  placeholder: false,
                                ),
                              ],
                            ),
                            DataRow(
                              //for the data of session 5 in gold
                              cells: [
                                DataCell(
                                  Text("Quantity Available",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2.5,
                                      )),
                                  showEditIcon: false,
                                  placeholder: false,
                                ),
                                DataCell(
                                  Text(
                                      "${global.category[index].data["quantity"]}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2.5,
                                      )),
                                  showEditIcon: false,
                                  placeholder: false,
                                ),
                              ],
                            ),
                            // DataRow(//for the data of session 10 in gold
                            //   cells: [
                            //     DataCell(
                            //       Text("10",
                            //           style: TextStyle(
                            //               fontSize:
                            //                   MediaQuery.of(context).size.height *
                            //                       0.025)),
                            //       showEditIcon: false,
                            //       placeholder: false,
                            //     ),

                            //   ],
                            // ),
                          ],
                        ),
                      ),

                      // Image.network(global.category[0].data['image']),

                      Divider(),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.08),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Description:",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 2.7,
                                  )),
                              Flexible(
                                fit: FlexFit.tight,
                                child: SingleChildScrollView(
                                  child: Text(
                                      "\t\t\t\t${global.category[index].data['desc']}",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.pink,
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2.5,
                                      )),
                                ),
                              ),
                              Divider(),
                              Text("\t\t\t[Delivery Charges:extra",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 2.2,
                                  )),
                              Text(
                                  "\t\t\tGST:${global.data[0].data['gst']}% extra]",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 2.2,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                    size: SizeConfig.blockSizeVertical * 3.9,
                                  ),
                                  onPressed: () {
                                    // if (demo > 1) {
                                    //   setState(() {
                                    //     demo -= 1;
                                    //   });
                                    // }
                                    setState(() {
                                      print("in cancel" +
                                          global.value[0].toString());
                                      if (global.cart.isEmpty) {
                                        callSnackBar(
                                            "minimun one item to be added");
                                      } else {
                                        print("in cancel else" +
                                            global.value[0].toString());

                                        bool flag = false;
                                        int at;
                                        for (int i = 0;
                                            i < global.cart.length;
                                            i++) {
                                          if (global.category[index]
                                                  .data["name"] ==
                                              global.cart[i].data["name"]) {
                                            flag = true;
                                            at = i;
                                          }
                                        }

                                        if (flag == true) {
                                          print("in falg true" +
                                              global.value[0].toString());
                                          if (global.value[at] <=
                                                  int.parse(
                                                      "${global.category[index].data["quantity"]}") &&
                                              global.value[at] > 1) {
                                            print(global.value[at].toString());
                                            global.value.insert(
                                                at, global.value[at] - 1);
                                            global.value.removeAt(at + 1);
                                            c = true;
                                            // print(global.value[at].toString());}
                                          } else if (global.value[at] == 1) {
                                            callSnackBar(
                                                "atleast one item to be added");
                                          }
                                        }
                                      }
                                    });
                                  }),
//                                   SizedBox(
//   width: 42.0,
//   height: 42.0,
//   child:  DecoratedBox(
//     decoration: const BoxDecoration(
//      border: Border(

//     ),
//     ),
//   ),
// ),
                              Container(
                                  margin: EdgeInsets.only(
                                    top:
                                        MediaQuery.of(context).size.height / 70,
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    color: Colors.black,
                                  )),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 16,
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    child: Text(global.cart.isEmpty?"1":"${global.value[place] }"),
                                  )),
                              IconButton(
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Colors.green,
                                  size: SizeConfig.blockSizeVertical * 3.9,
                                ),
                                onPressed: () {
                                  // if (demo <
                                  //     int.parse(
                                  //         "${global.category[index].data["quantity"]}")) {
                                  //   setState(() {
                                  //     demo += 1;
                                  //   });
                                  // }
                                  setState(() {
                                    if (global.cart.length == 0) {
                                      global.value.add(1);
                                      global.cart.add(global.category[index]);
                                    } else {
                                      bool flag = false;
                                      int at;
                                      for (int i = 0;
                                          i < global.cart.length;
                                          i++) {
                                        if (global
                                                .category[index].data["name"] ==
                                            global.cart[i].data["name"]) {
                                          flag = true;
                                          at = i;
                                        }
                                      }

                                      if (flag == true) {
                                        if (global.value[at] <
                                            int.parse(
                                                "${global.category[index].data["quantity"]}")) {
                                          global.value
                                              .insert(at, global.value[at] + 1);
                                          global.value.removeAt(at + 1);
                                          // print(global.value[at].toString());}
                                        } else {
                                          if (int.parse(
                                                  "${global.category[index].data["quantity"]}") ==
                                              1) {
                                            callSnackBar(
                                                " only ${global.category[index].data["quantity"]} item can be added to cart ");
                                          } else if (global.value[at] ==
                                              int.parse(
                                                  "${global.category[index].data["quantity"]}")) {
                                            callSnackBar(
                                                " only ${global.category[index].data["quantity"]} items can be added to cart ");
                                          }
                                        }
                                      } else {
                                        //  print(j.toString());
                                        global.value.add(1);
                                        setState(() {
                                          t = true;
                                        });

                                        // print(global.value.toString());
                                        // print(global.value.toString());
                                      }
                                    }
                                  });
                                },
                              ),
                            ],
                          )),

                      Divider(),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 6,
                        width: SizeConfig.blockSizeHorizontal * 50,
                        child: RaisedButton(
                          elevation: 5.0,
                          color: Colors.brown[400],
                          child: Text("Add +",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeVertical * 4,
                              )),
                          onPressed: () {
                            print("clilcked to  add");
                            setState(() {
                              if (global.cart.length == 0) {
                                global.cart.add(global.category[index]);
                                global.value.add(1);
                                Alerting(context);
                              } else {
                                bool flag = false;
                                int at;
                                for (int i = 0; i < global.cart.length; i++) {
                                  if (global.category[index].data["name"] ==
                                      global.cart[i].data["name"]) {
                                    flag = true;
                                    at = i;
                                  }
                                }

                                if (flag == false) {
                                  global.cart.add(global.category[index]);
                                  print(global.value.toString());
                                  if (t == false) {
                                    print("error");
                                    global.value.add(1);
                                  }
                                  Alerting(context);
                                } else {
                                  //  print(j.toString());

                                  if (int.parse(
                                          "${global.category[index].data["quantity"]}") ==
                                      1) {
                                    callsnack(
                                        " only ${global.category[index].data["quantity"]} items"+" can be added to cart ");
                                  } else if (global.value[at] ==
                                      int.parse(
                                          "${global.category[index].data["quantity"]}")) {
                                    Alerting(context);
                                  }

                                  if (global.value[at] <
                                      int.parse(
                                          "${global.category[index].data["quantity"]}")) {
                                    setState(() {
                                      if (t == false && c == false) {
                                        global.value
                                            .insert(at, global.value[at] + 1);
                                        global.value.removeAt(at + 1);
                                      }
                                    });

                                    Alerting(context);
                                  }
                                  // global.value.add(1);

                                  print(global.value.toString());
                                  // print(global.value.toString());
                                }
                              }
                            });
                            // print(global.category[1].data["name"]);

                            //  print("extra product "+ global.cart[i].data["quantity"].toString());
                            global.totalamount = 0;
                            for (int i = 0; i < global.cart.length; i++) {
                              global.totalamount +=
                                  global.cart[i].data["price"] *
                                      global.value[i];
                            }

                            print(global.totalamount.toString());

                            // Firestore.instance
                            // .collection("selected")
                            // .document("1")
                            // .collection("cart")
                            // // .add({
                            // //   "a":index.toString(),
                            // // }).catchError((err) =>print(err));
                            // .document("cart")
                            // // .collection("cart")
                            // // .document(index.toString());
                            // .setData({
                            //       "name":"jp"

                            // })
                            // .then((result)=>
                            // {

                            // }) .catchError((err) =>print(err));
                            // //  callSnackBar("Please check the details properly"));

                            // await Future.delayed(const Duration(seconds: 1));
                            // Alerting(context);
                            // await Future.delayed(const Duration(seconds: 5));
                            // Navigator.pushNamed(context,"HomeScreen");  jp

                            // global.
                            // print("clicked "+global.category[index].data['a']);
                            // callSnackBar("Added "+global.category[index].data['a'] +" to the cart");
                            // // global.cart=global.category[0].data['a'];
                            // // global.CartData=
                            // // CallForAdding();

                            //  Firestore.instance
                            //           .collection("cart")
                            //           .document(global.category[index].data['a'].toString())
                            //           .setData({
                            //             // "name":nameInput.text,
                            //             "name":global.category[index].data['a'].toString(),
                            //             "price":global.category[index].data['price'].toString(),

                            //           })
                            //           .then((result) => {

                            //           })
                            //       .catchError((err) => callSnackBar("Please check the details properly"));

                            // await Future.delayed(const Duration(seconds: 1));
                            // Alerting(context);
                            // Navigator.pushNamed(context,"HomeScreen");
                          },
                        ),
                      ),
                      isLoading
                          ? Container(
                              child: Text("Loading"),
                            )
                          : Container()
                    ],
                    // child: Text(global.category[0].data['a']),
                  ),
                  // ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Center(
                      child: Text(
                        "\n\n\n\t\t\t There are no products in this category.\n\n\n\t\t\tThank You",
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
                  ],
                ),
        ));
  }
}
