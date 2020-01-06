import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget{
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  bool isLoading=false;
          List<DocumentSnapshot> phone=[];

   void initState(){
    print("in init state");
    super.initState();
    getCategoryList();
  }

  getCategoryList() async{
    setState(() {
      isLoading=false;
    });
    // if(local.category==null){

    // }
    QuerySnapshot qs;

    qs=await Firestore.instance.collection("data").getDocuments();
    phone.isEmpty?phone.addAll(qs.documents):null;
    
    print("${phone[3].data["call"]}");
   
    setState(() {
      isLoading=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 
               Text("Contact Us",style:TextStyle(color: Colors.black)),
                   Image.asset(
                 'images/logo.png',
                  fit: BoxFit.fill,
                  height:SizeConfig.blockSizeVertical * 4.5,
                  
              ),
            ],

          ),
          backgroundColor: Color.fromRGBO(255,216,180,.9),
        ),
        bottomNavigationBar: bottomnavigation(context,1),
        drawer: theDrawer(context),
        body:WillPopScope(
      onWillPop:()
      {
        Navigator.pushNamed(context, 'HomeScreen');
      },
         child:isLoading?Center(
        child: Column(
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
           
                
          Text("\n\n\n"),

           Padding(
             padding: EdgeInsets.only(left: SizeConfig.blockSizeVertical*2.5,right:SizeConfig.blockSizeVertical*1.5 ),
           child: new SizedBox(
         height:SizeConfig.blockSizeVertical * 6,
         width:SizeConfig.blockSizeHorizontal * 80,
         child:RaisedButton(
             onPressed: () => launch("tel:+91${phone[3].data["call"]}"),
              child: new Text("CALL US",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blockSizeVertical * 2.8,)),
              color: Colors.blue,
              ),
           ),),
         Text("\n\n\n"),
              
          //     child: new Text("Call me")),
           Padding(
             padding: EdgeInsets.only(left: SizeConfig.blockSizeVertical*2.5,right:SizeConfig.blockSizeVertical*1.5 ),
          child: new SizedBox(
         height:SizeConfig.blockSizeVertical * 6,
         width:SizeConfig.blockSizeHorizontal * 80,
         child:RaisedButton(
              onPressed: () async =>
              //  var whatsappUrl ="whatsapp://send?phone=$phone";
            await canLaunch("whatsapp://send?phone=091${phone[3].data["whatsapp"]}")? launch("whatsapp://send?phone=091${phone[3].data["whatsapp"]}"):print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed"),

              child: new Text("Live chat (whatsApp)",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blockSizeVertical * 3,)),
              color: Colors.pinkAccent,),),
           ),
          ],
    ),
        ):   Center(child:Container(
                    child: Text("Loading"),
                  )) 
      ),
    ),
    );
}
}