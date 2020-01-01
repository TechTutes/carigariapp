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
  void initState() {
    print("in init state");

    super.initState();
    getSelectedList();
  }

  // getSelectedList() async
  // {

  // }
  getSelectedList() async {
    setState(() {
      // print(global.EmailId+global.Phone);
      isLoading = true;
    });

    // if(global.cart.isEmpty)
    // {

    qp = await Firestore.instance.collection("category").getDocuments();
    print(qp);
    print(global.selected.length);
    print("${global.touch}this is glo touch in cart page");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
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
            backgroundColor: Colors.cyan[300],
          ),
          bottomNavigationBar: bottomnavigation(context, 2),
          drawer: theDrawer(context),
          body: WillPopScope(
            onWillPop: () {
              Navigator.pushNamed(context, 'HomeScreen');
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
                            style: TextStyle(fontSize:SizeConfig.blockSizeVertical * 2.2, 
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .title
                                  .color,
                            ),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        FlatButton(
                          child: Text('ORDER NOW',style:TextStyle(fontSize:SizeConfig.blockSizeVertical * 2.2, )),
                          onPressed: () {
                            Navigator.pushNamed(context, "OrderConfirm");
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
                          child: Text('no data'),
                        )
                      : ListView.builder(
                          // controller: _scrollController,
                          itemCount: global.cart.length,
                          itemBuilder: (context, index) {
                            print("executed j ${index}${global.cart.length}");
                            return Dismissible(
                              key: ValueKey(id),
                              background: Container(
                                color: Theme.of(context).errorColor,
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: 20),
                                margin: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 4,
                                ),
                              ),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                setState(
                                  () {
                                    num = index;
                                    global.cart.remove(global.cart[num]);

                                    global.totalamount = 0;
                                    for (int i = 0;
                                        i < global.cart.length;
                                        i++) {
                                      global.totalamount +=
                                          global.cart[i].data["price"];
                                    }

                                  },
                                );
                              },

                              child: Card(
                                  child: ListTile(
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      num = index;
                                    });

                                    global.cart.remove(global.cart[num]);
                                 
                                        global.totalamount = 0;
                                    for (int i = 0;
                                        i < global.cart.length;
                                        i++) {
                                      global.totalamount +=
                                          global.cart[i].data["price"];
                                    }
                                  },
                                ),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(global
                                              .cart[index].data['image'] !=
                                          null
                                      ? global.cart[index].data['image']
                                      : "https://www.woodenstreet.com/images/furniture-bangalore/noida/image-new3.jpg"),
                                ),
                                contentPadding: EdgeInsets.all(5),
                                title: Text(global.cart[index].data['a'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 2.9,
                                    )),
                                subtitle: Text(
                                    " Price  ₹  ${global.cart[index].data['price']} "),
                                // dense: true,

                                onTap: () {
                                  // Navigator.pushNamed(context,"ContactUs");
                                  // Navigator.pushNamed(context, "SubCategory");
                                  // SubCategory(index);

                                  print(id);
                                },
                              )),
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
                                  fontSize: SizeConfig.blockSizeVertical * 4,
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
                                  fontSize: SizeConfig.blockSizeVertical * 4,
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
