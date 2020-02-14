import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Arrangements/variables.dart' as global;
import 'subcategory.dart' as local;

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool isLoading = false, selected = false;
  var id;
  int num;
  DocumentSnapshot docID;
  QuerySnapshot qp;

  del() {
    global.cart.remove(global.cart[num]);
  }

// final List<DocumentSnapshot> userList = snapshot.data.documents;
  @override
  // void initState() {
  //   print("in init state");

  //   super.initState();
  //   getSelectedList();
  // }

  // // getSelectedList() async
  // // {

  // // }
  // getSelectedList() async {
  //   setState(() {
  //     // print(global.EmailId+global.Phone);
  //     isLoading = true;
  //   });

  //   // if(global.cart.isEmpty)
  //   // {

  //   qp = await Firestore.instance.collection("category").getDocuments();
  //   print(qp);
  //   print(global.selected.length);
  //   print("${global.touch}this is glo touch in cart page");
  //    setState(() {
  //     isLoading=false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final appbar =AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Cart Items"),
                Image.asset(
                  'images/logo.png',
                  fit: BoxFit.fill,
                  height: SizeConfig.blockSizeVertical * 4.5,
                ),
              ],
            ),
            backgroundColor: Color.fromRGBO(191,32,37, 1.0),
          );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: appbar,
          bottomNavigationBar: bottomnavigation(context, 2),
          drawer: theDrawer(context),
          body: WillPopScope(
            onWillPop: () {
              Navigator.pushReplacementNamed(context, 'HomeScreen');
            },
            child: Center(
                child: Column(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.all(15),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Total',
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Chip(
                          label: Text(
                            ' ₹  ${global.totalamount}',
                            style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 2.2,
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .title
                                  .color,
                            ),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        FlatButton(
                          child: Text(
                              global.cart.isEmpty ? "SHOP NOW" : 'ORDER NOW',
                              style: TextStyle(
                                fontSize: SizeConfig.blockSizeVertical * 2.2,
                              )),
                          onPressed: () {
                            global.cart.isEmpty
                                ? Navigator.pushNamed(context, "HomeScreen")
                                : Navigator.pushNamed(context, "OrderConfirm");
                          },
                          textColor: Theme.of(context).primaryColor,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Expanded(
                  child: global.cart.length == 0
                      ? Center(
                          child: Container(),
                        )
                      : ListView.builder(
                          // controller: _scrollController,
                          itemCount: global.cart.length,
                          itemBuilder: (context, index) {
                            final k = global.cart[index];
                            // print(
                            //     "executed index is ${index} cart lenght is ${global.cart.length}");
                            return Dismissible(
                              key: ValueKey(k),
                              background: Container(
                                color: Theme.of(context).errorColor,
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 39,
                                ),
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: 19),
                                margin: EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 4,
                                ),
                              ),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                setState(
                                  () {
                                    print(index.toString());
                                    global.cart.removeAt(index);
                                    global.value.removeAt(index);
                                  },
                                );
                                print(global.cart.length.toString() +
                                    " after removing");
                                global.totalamount = 0;
                                for (int i = 0; i < global.cart.length; i++) {
                                  global.totalamount +=
                                      global.cart[i].data["price"] * global.value[i];
                                }
                              },
                              child: Card(
                                child: ListTile(
                                  trailing: IconButton(
                                    iconSize:SizeConfig.blockSizeVertical *
                                                    4.9 ,
                                    icon: Column(
                                      children: <Widget>[
                                        Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: SizeConfig.blockSizeVertical *
                                                    3.4,
                                        ),
                                        Icon(
                                          Icons.arrow_back,
                                          color: Colors.red,
                                          size:((SizeConfig.screenHeight) - (appbar.preferredSize.height)) * 0.0161,
                                        ),
                                        // Text("<-", style: TextStyle(
                                        //     color: Colors.black,
                                        //     fontWeight: FontWeight.w600,
                                        //     fontSize:
                                        //         SizeConfig.blockSizeVertical *
                                        //             1.0,
                                        //   ))
                                      ],
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        num = index;
                                      });

                                      global.cart.removeAt(num);
                                      global.value.removeAt(index);

                                      global.totalamount = 0;
                                      for (int i = 0;
                                          i < global.cart.length;
                                          i++) {
                                        global.totalamount +=
                                            global.cart[i].data["price"]* global.value[i];
                                      }
                                    },
                                  ),
                                  leading: CircleAvatar(
                                    backgroundColor:Colors. grey,
                                    backgroundImage: NetworkImage("https://drive.google.com/uc?id=${global.cart[index].data['image']}" !=
                                            null
                                        ? "https://drive.google.com/uc?id=${global.cart[index].data['image']}"
                                        : "https://www.woodenstreet.com/images/furniture-bangalore/noida/image-new3.jpg"),
                                  ),
                                  contentPadding: EdgeInsets.all(5),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SizedBox(
                                        height:(MediaQuery.of(context).size.height - appbar.preferredSize.height) *0.06,
                                        width:(MediaQuery.of(context).size.width - appbar.preferredSize.height) *0.58,
                                                                              child: Text(global.cart[index].data['name'],
                                        textAlign: TextAlign.left,
                                            style: TextStyle(
                                              
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize:
                                                  (MediaQuery.of(context).size.height - appbar.preferredSize.height) *0.024,
                                            )),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                         top: SizeConfig.blockSizeVertical * 1.8,
                                        ),
                                        child: Text('${global.value[index]} x',
                                            style: TextStyle(
                                                fontSize: SizeConfig
                                                        .blockSizeVertical *
                                                    1.9,
                                                color: Colors.black)),
                                      ),
                                    ],
                                  ),
                                  subtitle: Text(
                                      " Price  ₹  ${global.cart[index].data['price']} "),
                                  // dense: true,

                                  onTap: () {
                                    // Navigator.pushNamed(context,"ContactUs");
                                    // Navigator.pushNamed(context, "SubCategory");
                                    // SubCategory(index);

                                    print(id);
                                  },
                                  // trailing: Text('$quantity x'),
                                ),
                              ),
                            );
                          },
                        ),
                ),
                isLoading
                    ? Container(
                        child: Text("Loading"),
                      )
                    : Container(),

                global.cart.isEmpty
                    ? SizedBox(
                        height: SizeConfig.blockSizeVertical * 6,
                        width: SizeConfig.blockSizeHorizontal * 90,
                        child: RaisedButton(
                            elevation: 5.0,
                            color: Colors.brown[400],
                            // shape: RoundedRectangleBorder(
                            //   borderRadius:new BorderRadius.circular(18.0),
                            //   side: BorderSide(color: Colors.pink)
                            //   ),
                            child: Text("Shop Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: ((SizeConfig.screenHeight) - (appbar.preferredSize.height)) * 0.035,
                                )),
                            onPressed: () {
                              Navigator.pushNamed(context, "HomeScreen");
                            }),
                      )
                    : SizedBox(
                        height: SizeConfig.blockSizeVertical * 6,
                        width: SizeConfig.blockSizeHorizontal * 90,
                        child: RaisedButton(
                            elevation: 5.0,
                            color: Colors.brown[400],
                            // shape: RoundedRectangleBorder(
                            //   borderRadius:new BorderRadius.circular(18.0),
                            //   side: BorderSide(color: Colors.pink)
                            //   ),
                            child: Text("Order Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: ((SizeConfig.screenHeight) - (appbar.preferredSize.height)) * 0.035,
                                )),
                            onPressed: () {
                              Navigator.pushNamed(context, "OrderConfirm");
                            }),
                      ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 2,
                ) // Text("\n\n\n Wil be updated soon!!!",style: TextStyle(fontSize:SizeConfig.blockSizeVertical * 2.5,color: Colors.green),),
              ],
            )),
          ),
        ));
  }
}
