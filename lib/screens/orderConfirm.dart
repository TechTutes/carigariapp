import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart' as prefix0;

import 'package:flutter/widgets.dart';
import "package:flutter/material.dart";
import '../Arrangements/variables.dart' as global;

class OrderConfirm extends StatefulWidget {
  @override
  _OrderConfirmState createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {
  final GlobalKey<FormState> _OrderConfirmKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController nameInput;
  TextEditingController cityInput;
  TextEditingController phoneNumberInput;
  TextEditingController emailInput;
  // TextEditingController stateInput;
  TextEditingController msgInput;

  @override
  initState() {
    nameInput = new TextEditingController();
    emailInput = new TextEditingController();
    cityInput = new TextEditingController();
    phoneNumberInput = new TextEditingController();
    // stateInput = new TextEditingController();
    msgInput = new TextEditingController();
    super.initState();
  }

  var _dropforms = ['General', 'Feedback', 'Corporate', 'BulkOrder'];
  var _dropformSelected = "General";

  void callSnackBar(String msg, [int er]) {
    // msg="There is no record with this user, please register first by clicking Register";
    final SnackBar = new prefix0.SnackBar(
      content: new Text(msg),
      duration: new Duration(seconds: 3),
      //   action: new SnackBarAction(label: "Register",
      //   onPressed: (){
      //     Navigator.pushNamed(context, "Register");
      //   },),
    );
    _scaffoldKey.currentState.showSnackBar(SnackBar);
  }

  Widget DisplaySelected() {
    return ListView.builder(
      // controller: _scrollController,
      itemCount: global.cart.length,
      itemBuilder: (context, index) {
        return Card(
            child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(global.cart[index].data['image'] !=
                    null
                ? global.cart[index].data['image']
                : "https://www.woodenstreet.com/images/furniture-bangalore/noida/image-new3.jpg"),
          ),
          contentPadding: EdgeInsets.all(5),
          title: Text(global.cart[index].data['a'],
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.blockSizeVertical * 2.9,
              )),
          subtitle: Text(" Price  ₹ " + global.category[index].data['price']),
          // dense: true,
          onTap: () {
            // Navigator.pushNamed(context,"ContactUs");
            Navigator.pushNamed(context, "SubCategory");
            // SubCategory(index);

            // print("clicked" +
            //     global.category[index].data['a']);
          },
        ));
      },
    );
    // );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
String cartitem ="${global.cart[0].data["name"]}"+" quantity -"+"${global.value[0]}"+"," ;
for(int i=1;i<global.cart.length;i++){
cartitem= cartitem+"${global.cart[i].data["name"]}"+" quantity -"+"${global.value[i]}"+",";
}
print(cartitem);
    // // TODO: implement build
    // String dropdownValue='One';

    return new Scaffold(
        key: _scaffoldKey,

        // resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 
               Text("Order Placing"),
                   Image.asset(
                 'images/logo.png',
                  fit: BoxFit.fill,
                  height:SizeConfig.blockSizeVertical * 4.5,
                  
              ),
            ],

          ), 
          backgroundColor:Color.fromRGBO(191,32,37, 1.0),
        ),
        drawer: theDrawer(context),
        bottomNavigationBar: bottomnavigation(context, 1),
        body: WillPopScope(
          onWillPop: () {
            Navigator.pushReplacementNamed(context, 'HomeScreen');
          },
          child: Container(
            margin: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.5),
            child: Form(
              key: _OrderConfirmKey,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 1.5,
                        bottom: SizeConfig.blockSizeVertical * 1.5),
                    child: TextFormField(
                      controller: nameInput,
                      validator: nameValidator,
                      style: textStyle,
                      // keyboardType: Text(),
                      decoration: InputDecoration(
                          labelStyle: textStyle,
                          labelText: "Full Name",
                          hintText: "Enter your Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.blockSizeVertical * 1.5))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 1.5,
                        bottom: SizeConfig.blockSizeVertical * 1.5),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: phoneNumberInput,
                      style: textStyle,
                      maxLength: 10,
                      validator: phoneValidator,
                      decoration: InputDecoration(
                          labelStyle: textStyle,
                          labelText: "Mobile",
                          hintText: "Enter your Mobile Number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.blockSizeVertical * 1.5))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 1.5,
                        bottom: SizeConfig.blockSizeVertical * 1.5),
                    child: TextFormField(
                      controller: emailInput,
                      keyboardType: TextInputType.emailAddress,
                      style: textStyle,
                      validator: emailValidator,
                      decoration: InputDecoration(
                          labelStyle: textStyle,
                          labelText: "Email id",
                          hintText: "Enter your EMail id",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.blockSizeVertical * 1.5))),
                    ),
                  ),

                  //               DropdownButton<String>(
                  //                 value: dropdownValue,
                  //                 onChanged: (String newValue)
                  //                 {
                  //                   setState(() {
                  //                    if(newValue!=null)
                  //                       dropdownValue=newValue;
                  //                   });
                  //                 },
                  //                 items: <String>['General','Feedback','Corporate','BulkOrder']
                  //                 .map<DropdownMenuItem<String>(
                  //                 value: value,
                  //                 child: Text(Value),
                  //                 );
                  // }).tolist());
                  //           )

                  // DropdownButton<String>(
                  //       value: dropdownValue,
                  //       icon: Icon(Icons.arrow_downward),
                  //       iconSize: 24,
                  //       elevation: 16,
                  //       style: TextStyle(
                  //         color: Colors.deepPurple
                  //       ),
                  //       underline: Container(
                  //         height: 2,
                  //         color: Colors.deepPurpleAccent,
                  //       ),
                  //       onChanged: (String newValue) {
                  //         setState(() {
                  //           dropdownValue = newValue;
                  //         });
                  //       },
                  //       items: <String>['One', 'Two', 'Free', 'Four']
                  //         .map<DropdownMenuItem<String>>((String value) {
                  //           return DropdownMenuItem<String>(
                  //             value: value,
                  //             child: Text(value),
                  //           );
                  //         })
                  //         .toList(),
                  //     ),

                  // Padding(
                  //     padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5,bottom:SizeConfig.blockSizeVertical*1.5 ),
                  //     child:DropdownButton(
                  //                 items: _dropdownValues
                  //                     .map(
                  //                       (value) => DropdownMenuItem(
                  //                           child: Text(value),
                  //                           value: value,
                  //                         )
                  //                         )
                  //                     .toList(),
                  //                 onChanged: (String value) {
                  //                  //
                  //                 },
                  //                 isExpanded: false,
                  //                 hint: Text('Select the category '),
                  //               ),
                  // ),

                  // Padding(
                  //           padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5,bottom:SizeConfig.blockSizeVertical*1.5 ),
                  //       child:DropdownButton<String>(
                  //       items: _dropforms.map((String dropDownStringItem)
                  //       {
                  //          return DropdownMenuItem<String>(
                  //             value: dropDownStringItem,
                  //             child: Text(dropDownStringItem),

                  //          );
                  //       }).toList(),
                  //       onChanged: (String newValueSelected){
                  //         setState(() {
                  //           this._dropformSelected =newValueSelected;
                  //         });
                  //       },
                  //       value: _dropformSelected,
                  //       ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       top: SizeConfig.blockSizeVertical * 1.5,
                  //       bottom: SizeConfig.blockSizeVertical * 1.5),
                  //   child: ExpandablePanel(
                  //     header: Text("Products"),
                  //     collapsed: Text("Click to List the Cart Items"),
                  //     expanded: DisplaySelected(),
                  //     // Text(article.body, softWrap: true, ),
                  //     tapHeaderToExpand: true,
                  //     hasIcon: true,
                  //   ),
                  // ),

                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 1.5,
                        bottom: SizeConfig.blockSizeVertical * 1.5),
                    child: TextFormField(
                      controller: msgInput,
                      validator: nameValidator,
                      style: textStyle,
                      maxLines: 3,
                      // keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelStyle: textStyle,
                          labelText: "Shipping Address",
                          hintText: "Enter Address",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.blockSizeVertical * 1.5))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 1.5,
                        bottom: SizeConfig.blockSizeVertical * 1.5),
                    child: TextFormField(
                      // keyboardType: TextInputType.number,
                      readOnly: true,
                      style: textStyle,
                      controller: cityInput,
                      // validator: nameValidator,
                     
                      decoration: InputDecoration(
                          labelStyle: textStyle,
                          labelText: "City",
                          enabled: false,
                          hintText: "Hyderabad",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.blockSizeVertical * 1.5))),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       top: SizeConfig.blockSizeVertical * 1.5,
                  //       bottom: SizeConfig.blockSizeVertical * 1.5),
                  //   child: TextField(
                  //     // keyboardType: TextInputType.number,
                  //     style: textStyle,
                  //     //  controller: ,
                  //     decoration: InputDecoration(
                  //         labelStyle: textStyle,
                  //         labelText: "State",
                  //         hintText: "Enter your State",
                  //         border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(
                  //                 SizeConfig.blockSizeVertical * 1.5))),
                  //   ),
                  // ),

                  SizedBox(
         height:SizeConfig.blockSizeVertical * 6,
         width:SizeConfig.blockSizeHorizontal * 90,
                child: RaisedButton(
                  elevation:5.0,
                    color: Colors.brown[400],
                    // shape: RoundedRectangleBorder(
                    //   borderRadius:new BorderRadius.circular(18.0),
                    //   side: BorderSide(color: Colors.pink)
                    //   ),
                    child: Text("Place Order",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blockSizeVertical * 3.5,)),
                      
                      onPressed: () async {
                        // showDialog(
                        //     context: context,
                        //     builder: (BuildContext context) {
                        //       return Center(child: CircularProgressIndicator(),);
                        //     });
                        // await loginAction();

                        if (_OrderConfirmKey.currentState.validate()) {
                          //  _scaffoldKey.currentState.showSnackBar(
                          // new SnackBar(duration: new Duration(seconds: 4), content:
                          // new Row(
                          //   children: <Widget>[
                          //     new CircularProgressIndicator(),
                          //     new Text("  Sending info...")
                          //   ],
                          // ),
                          // ));
                          // _handleSignIn()
                          //     .whenComplete(() =>
                          //     Navigator.of(context).pushNamed("HomeScreen")
                          // );
                          callSnackBar("Order Placed Successfully!!!");

                          Firestore.instance
                              .collection('Orders Placed')
                              .document(nameInput.text)
                              .setData({
                                "name": nameInput.text,
                                // "uid": currentUser.uid,
                                "city": "Hyderabad" ,
                                "address": msgInput.text,
                                "email": emailInput.text,
                                "mobile": phoneNumberInput.text,
                                "cart": {
"items":cartitem,
"total price":global.totalamount
                                },
                              })
                              .then((result) => {
                                    global.cart.removeRange(0,global.cart.length),
                                    global.value.removeRange(0, global.value.length),
                                    global.totalamount=0,
                                    cartitem="empty",
                                    print(cartitem),
                                    Navigator.pushReplacementNamed(context, "HomeScreen"),

                                    nameInput.clear(),
                                    cityInput.clear(),
                                    phoneNumberInput.clear(),
                                    emailInput.clear(),
                                    msgInput.clear(),
                                    // stateInput.clear(),
                                  })
                              .catchError((err) => print(err));
                          // callSnackBar("Please check the details properly"));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  String nameValidator(String value) {
    if (value.length < 3) {
      return "please fill this field with atleast 3 characters";
    } else {
      return null;
    }
  }

  String phoneValidator(String value) {
    if (value.length != 10) {
      return 'Phone Number must be of 10 digits';
    } else {
      return null;
    }
  }

  String emailValidator(String value) {
    //need to write the efficient validator here
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }
}
