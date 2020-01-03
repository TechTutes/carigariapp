// import 'dart:html';
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
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import './showImage.dart';
import '../Arrangements/sizeModification.dart';
import '../Arrangements/variables.dart' as global;
// import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<DocumentSnapshot> category=[];
  bool isLoading = false;
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
    super.initState();
    getCategoryList();
  }

  getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    // if(global.category==null){

    // }
    if (global.category.length > 0) {
      global.category.removeRange(0, global.category.length);
    }

    QuerySnapshot qp, cs;
    qp = await Firestore.instance.collection("categories").getDocuments();
    global.categories.isEmpty ? global.categories.addAll(qp.documents) : null;
    cs = await Firestore.instance.collection("Carousel").getDocuments();
    carousel.isEmpty ? carousel.addAll(cs.documents) : null;
    
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

  Widget CarouselImages() {
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
                : carousel[0].data["image1"],
            carousel.isEmpty
                ? "http://carigarifurniture.com/product_images/h/img_6539__14221_thumb.jpg"
                : carousel[0].data["image2"],

            carousel.isEmpty
                ? "http://carigarifurniture.com/product_images/w/cbb92cd2_d785_4288_a51a_88766576d6aa_1___10086_thumb.jpg"
                : carousel[0].data["image3"],

            carousel.isEmpty
                ? "http://carigarifurniture.com/product_images/h/img_6539__14221_thumb.jpg"
                : carousel[0].data["image4"],

            carousel.isEmpty
                ? "http://carigarifurniture.com/product_images/w/cbb92cd2_d785_4288_a51a_88766576d6aa_1___10086_thumb.jpg"
                : carousel[0].data["image5"]

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
                    decoration: BoxDecoration(color: Colors.amber),
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

    return new Scaffold(
      key: _scaffoldkey,
      appBar: new AppBar(
        backgroundColor: Colors.cyan[300],
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
          // Navigator.pushNamed(context,''),
          show();
        },
        child: Center(
          child: Container(
            color: Color.fromRGBO(255, 216, 180, .1),
            child: Column(children: <Widget>[
              CarouselImages(),
              //  ShowImage("logo"),

              //  Text("About\n",style: TextStyle(fontSize:SizeConfig.blockSizeVertical * 2.5),),
              //   InkWell(
              //           child: new Text('About Carigari Furnitures',style:TextStyle(fontSize: 20.0,color: Colors.red, decoration: TextDecoration.underline)),
              //       onTap: () async {
              //   if (await canLaunch("http://www.carigarifurniture.com//")) {
              //     await launch("http://www.carigarifurniture.com//");
              //   }
              //       }

              //       // launch("https://in.linkedin.com/in/jaya-prakash-veldanda-756b48179"),
              //     ),
              //  CallForcategoryDetails(),
              //   Text("\n\n"),
              //      RaisedButton(
              //     color: Colors.orange,
              //   child: Text("Subscription"),
              //   onPressed: ()
              //   {
              //     // show();
              //     Navigator.pushNamed(context, 'Testing');

              //   },
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text("Select by Category",
                    style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.blockSizeVertical * 3.5,
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
                                        global.categories[i].data['image'],
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
                                      // leading: Consumer<Product>(
                                      //   builder: (ctx, product, _) => IconButton(
                                      //         icon: Icon(
                                      //           product.isFavorite ? Icons.favorite : Icons.favorite_border,
                                      //         ),
                                      //         color: Theme.of(context).accentColor,
                                      //         onPressed: () {
                                      //           product.toggleFavoriteStatus(
                                      //             authData.token,
                                      //             authData.userId,
                                      //           );
                                      //         },
                                      //       ),
                                      // ),
                                      title: Text(
                                        global.categories[i].data['name'],
                                        // style:TextStyle(color: Colors.black),
                                        textAlign: TextAlign.center,
                                      ),
                                      // trailing: IconButton(
                                      //   icon: Icon(
                                      //     Icons.shopping_cart,
                                      //   ),
                                      // onPressed: () {
                                      //   cart.addItem(product.id, product.price, product.title);
                                      //   Scaffold.of(context).hideCurrentSnackBar();
                                      //   Scaffold.of(context).showSnackBar(
                                      //     SnackBar(
                                      //       content: Text(
                                      //         'Added item to cart!',
                                      //       ),
                                      //       duration: Duration(seconds: 2),
                                      //       action: SnackBarAction(
                                      //         label: 'UNDO',
                                      //         onPressed: () {
                                      //           cart.removeSingleItem(product.id);
                                      //         },
                                      //       ),
                                      //     ),
                                      //   );
                                      // },

                                      // ),
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
          ),
        ),
      ),
    );
  }
}
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
