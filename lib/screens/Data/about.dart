import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:carigari/screens/showImage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool isLoading = false;
  List<DocumentSnapshot> phone = [];

  void initState() {
    print("in init state");
    super.initState();
    getCategoryList();
  }

  getCategoryList() async {
    setState(() {
      isLoading = false;
    });
    // if(local.category==null){

    // }
    QuerySnapshot qs;

    qs = await Firestore.instance.collection("data").getDocuments();
    phone.isEmpty ? phone.addAll(qs.documents) : null;

    print("${phone[0].data["about1"]}");

    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("About Us", style: TextStyle(color: Colors.white)),
          Image.asset(
            'images/logo.png',
            fit: BoxFit.fill,
            height: SizeConfig.blockSizeVertical * 4.5,
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(191, 32, 37, 1.0),
    );
    // TODO: implement build
    return Scaffold(
      appBar: appbar,
      bottomNavigationBar: bottomnavigation(context, 1),
      drawer: theDrawer(context),
      body: WillPopScope(
        onWillPop: () {
          Navigator.pushNamed(context, 'HomeScreen');
        },
        //  child: Text("\n\n\n  About plan will be started soon",style: TextStyle(fontSize:SizeConfig.blockSizeVertical * 2.5,color: Colors.green),),
        child: isLoading
            ? ListView(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text("Call ConversionGuru", style: TextStyle( fontSize: 16)),
                      //     InkWell(

                      //       onTap: () {
                      //        launch("tel://919010590693");
                      //       },
                      //       child: Icon(Icons.call),

                      //     )
                      //   ]
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text("Live Chat", style: TextStyle( fontSize: 16)),
                      //     InkWell(

                      //       onTap: () async {
                      //       await canLaunch("whatsapp://send?phone=0919010590693")? launch("whatsapp://send?phone=0919010590693"):print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
                      //       },
                      //       child: Icon(Icons.)
                      //     )
                      //   ]
                      // ),
                      ShowImage("logo"),

                      Center(
                          child: Text(
                        "About\n",
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeVertical * 2.5),
                      )),
                      Center(
                        child: InkWell(
                            child: new Text(' Carigari Furnitures',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.red,
                                    decoration: TextDecoration.underline)),
                            onTap: () async {
                              if (await canLaunch(
                                  "http://www.carigarifurniture.com//")) {
                                await launch(
                                    "http://www.carigarifurniture.com//");
                              }
                            }

                            // launch("https://in.linkedin.com/in/jaya-prakash-veldanda-756b48179"),
                            ),
                      ),
                      SafeArea(
                        child: Center(
                          child: Card(
                            margin: EdgeInsets.only(
                                top: 15, left: 12, right: 12, bottom: 15),
                            elevation: 5.0,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal * 4.5,
                                  right: SizeConfig.blockSizeHorizontal * 4.5,
                                  top: SizeConfig.blockSizeVertical * 2.5,
                                  bottom: SizeConfig.blockSizeVertical * 2.5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("About Us:",
                                      style: TextStyle(
                                          fontSize: ((SizeConfig.screenHeight) -
                                                  (appbar
                                                      .preferredSize.height)) *
                                              0.03)),
                                  Padding(
                                      padding: EdgeInsets.only(
                                        left: SizeConfig.blockSizeVertical * 1,
                                        // right: SizeConfig.blockSizeVertical * 1.5
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                              phone[0].data["about1"] == null
                                                  ? "FURNITURE is a landmark funiture store in the city of Hyderabad. We were born in the spring of 2001 (Feb 11, 2001) and during this period of 9 years we have created a unique identity for ourselves.   We are wholesalers and deal in 100% imported furniture from Malaysia and China. We procure the latest and the best designs with an  eye on what suits the Indian tastes. Our team of design experts study the lifestyle patterns and habits very carefully and then try to ensure that they are kept in mind during the furniture selection process overseas. This is our key strength. We are known for importing classical and contemporary range of furniture designs. "
                                                  : "${phone[0].data["about1"]}",
                                              style: TextStyle(
                                                  fontSize: ((SizeConfig
                                                              .screenHeight) -
                                                          (appbar.preferredSize
                                                              .height)) *
                                                      0.025)),
                                          SizedBox(height: 12),
                                          Text(
                                              phone[0].data["about2"] == null
                                                  ? "CARIGARI is a landmark funiture store in the city of Hyderabad. We were born in the spring of 2001 (Feb 11, 2001) and during this period of 9 years we have created a unique identity for ourselves.   We are wholesalers and deal in 100% imported furniture from Malaysia and China. We procure the latest and the best designs with an  eye on what suits the Indian tastes. Our team of design experts study the lifestyle patterns and habits very carefully and then try to ensure that they are kept in mind during the furniture selection process overseas. This is our key strength. We are known for importing classical and contemporary range of furniture designs. "
                                                  :
              "${phone[0].data["about2"]}",
              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  fontSize: ((SizeConfig
                                                              .screenHeight) -
                                                          (appbar.preferredSize
                                                              .height)) *
                                                      0.025)),
                                                        SizedBox(height: 10),
                                          Text(
                                              // phone[0].data["about2"] == null
                                                  // ? "CARIGARI is a landmark funiture store in the city of Hyderabad. We were born in the spring of 2001 (Feb 11, 2001) and during this period of 9 years we have created a unique identity for ourselves.   We are wholesalers and deal in 100% imported furniture from Malaysia and China. We procure the latest and the best designs with an  eye on what suits the Indian tastes. Our team of design experts study the lifestyle patterns and habits very carefully and then try to ensure that they are kept in mind during the furniture selection process overseas. This is our key strength. We are known for importing classical and contemporary range of furniture designs. "
                                                  // :
                                                   "${phone[0].data["about3"]}",
                                              style: TextStyle(
                                                  fontSize: ((SizeConfig
                                                              .screenHeight) -
                                                          (appbar.preferredSize
                                                              .height)) *
                                                      0.025)),
                                                        SizedBox(height: 10),
                                          Text(
                                              // phone[0].data["about2"] == null
                                                  // ? "CARIGARI is a landmark funiture store in the city of Hyderabad. We were born in the spring of 2001 (Feb 11, 2001) and during this period of 9 years we have created a unique identity for ourselves.   We are wholesalers and deal in 100% imported furniture from Malaysia and China. We procure the latest and the best designs with an  eye on what suits the Indian tastes. Our team of design experts study the lifestyle patterns and habits very carefully and then try to ensure that they are kept in mind during the furniture selection process overseas. This is our key strength. We are known for importing classical and contemporary range of furniture designs. "
                                                  // :
                                                   "${phone[0].data["about4"]}",
                                              style: TextStyle(
                                                  fontSize: ((SizeConfig
                                                              .screenHeight) -
                                                          (appbar.preferredSize
                                                              .height)) *
                                                      0.025)),
                                          // Text("OPP.J.N.T.U. COLLEGE,",
                                          //     style: TextStyle(
                                          //         fontSize: ((SizeConfig
                                          //                     .screenHeight) -
                                          //                 (appbar
                                          //                     .preferredSize
                                          //                     .height)) *
                                          //             0.025)),
                                          // Text("BESIDES HYDERABAD HOUSE,",
                                          //     style: TextStyle(
                                          //         fontSize: ((SizeConfig
                                          //                     .screenHeight) -
                                          //                 (appbar
                                          //                     .preferredSize
                                          //                     .height)) *
                                          //             0.025)),
                                          // Text("Carigari Furnitures,",
                                          //     style: TextStyle(
                                          //         fontSize: ((SizeConfig
                                          //                     .screenHeight) -
                                          //                 (appbar
                                          //                     .preferredSize
                                          //                     .height)) *
                                          //             0.025)),
                                          // Text("MASAB TANK,",
                                          //     style: TextStyle(
                                          //         fontSize: ((SizeConfig
                                          //                     .screenHeight) -
                                          //                 (appbar
                                          //                     .preferredSize
                                          //                     .height)) *
                                          //             0.025)),
                                          // Text("HYDERABAD - 500 004. ,A.P.",
                                          //     style: TextStyle(
                                          //         fontSize: ((SizeConfig
                                          //                     .screenHeight) -
                                          //                 (appbar
                                          //                     .preferredSize
                                          //                     .height)) *
                                          //             0.025)),
                                          // SizedBox(height: 5.0),
                                          // Text("Tel Cum Fax 040-30628610.",
                                          //     style: TextStyle(
                                          //         fontSize: ((SizeConfig
                                          //                     .screenHeight) -
                                          //                 (appbar
                                          //                     .preferredSize
                                          //                     .height)) *
                                          //             0.025)),
                                          // Text(
                                          //     "Mobile : 9246363415  9885444435.",
                                          //     style: TextStyle(
                                          //         fontSize: ((SizeConfig
                                          //                     .screenHeight) -
                                          //                 (appbar
                                          //                     .preferredSize
                                          //                     .height)) *
                                          //             0.025)),
                                          // SizedBox(height: 8.0),
                                          // Text("E-mail :",
                                          //     style: TextStyle(fontSize: 24)),
                                          // Text(
                                          //     "   carigarifurniture@yahoo.co.in",
                                          //     style: TextStyle(
                                          //         fontSize: ((SizeConfig
                                          //                     .screenHeight) -
                                          //                 (appbar
                                          //                     .preferredSize
                                          //                     .height)) *
                                          //             0.025)),
                                          // Text(
                                          //     "   carigarifurniture@gmail.com",
                                          //     style: TextStyle(
                                          //         fontSize: ((SizeConfig
                                          //                     .screenHeight) -
                                          //                 (appbar
                                          //                     .preferredSize
                                          //                     .height)) *
                                          //             0.025)),
                                          // Text(
                                          //     "   arvind@carigarifurniture.com",
                                          //     style: TextStyle(
                                          //         fontSize: ((SizeConfig
                                          //                     .screenHeight) -
                                          //                 (appbar
                                          //                     .preferredSize
                                          //                     .height)) *
                                          //             0.025)),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            : Center(
                child: Container(
                child: Text("Loading"),
              )),
      ),
    );
  }
}
