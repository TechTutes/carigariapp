import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Help extends StatefulWidget
{
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
     List<DocumentSnapshot> data=[];
bool isLoading = false;
   void initState() {
    print("in init state");
    super.initState();
    dj();
  }

  dj() async {
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
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 
               Text('Information'),
                   Image.asset(
                 'images/logo.png',
                  fit: BoxFit.fill,
                  height:SizeConfig.blockSizeVertical * 4.5,
                  
              ),
            ],

          ), 
           backgroundColor: Color.fromRGBO(191,32,37, 1.0),
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
                             child: Text(data.isEmpty?"we will provide information in short time":"${data[2].data['info']}",style: TextStyle(fontSize:SizeConfig.blockSizeVertical * 2.5,color: Colors.green),)),
                         ) ],
        ),
        ),
      )
    );
  }
}