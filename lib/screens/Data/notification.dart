import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Notification extends StatefulWidget
{
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
 bool isLoading = false;
      List<DocumentSnapshot> data=[];

   void initState() {
    print("in init state");
    super.initState();
    geList();
  }

  geList() async {
    setState(() {
     isLoading = true;
    });
   
    QuerySnapshot qp;
    qp = await Firestore.instance
        .collection("data")
        .getDocuments();

    data.isEmpty ? data.addAll(qp.documents) : null;
     


   
    print("category");

    setState(() {
      isLoading = false;
    });
  } @override
  Widget build(BuildContext context) {
   
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 
               Text("Notifications",style: TextStyle(color: Colors.black),),
                   Image.asset(
                 'images/logo.png',
                  fit: BoxFit.fill,
                  height:SizeConfig.blockSizeVertical * 4.5,
                  
              ),
            ],

          ), 
          backgroundColor: Colors.cyan[300],
        ),
        bottomNavigationBar: bottomnavigation(context,1),
        drawer: theDrawer(context),
        body:isLoading?
        Center(
          child:SizedBox(child: Text("Loading"),)
        )
        :WillPopScope(
          onWillPop: (){
            Navigator.pushNamed(context, 'HomeScreen');
          },
        child:Column(
          children: <Widget>[
            SizedBox(height:SizeConfig.blockSizeVertical * 5),
                         Padding(
                           padding: EdgeInsets.only(left:SizeConfig.blockSizeHorizontal * 5),
                                                    child: SizedBox(
                             width:SizeConfig.blockSizeHorizontal * 95,
                             child: Text(data.isEmpty?"No Nortifications available right now":"${data[2].data['content']}",style: TextStyle(fontSize:SizeConfig.blockSizeVertical * 2.5,color: Colors.green),)),
                         )

          ],
        ),
        ),
      )
    );
  }
}