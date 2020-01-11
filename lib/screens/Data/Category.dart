import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:flutter/material.dart';

class CategoryData extends StatelessWidget
{
  
  CategoryData(index);
  @override
  Widget build(BuildContext context) {
    print("in cat");
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
         backgroundColor: Colors.cyan[300],
        title:  Row(


              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 
               Text("data"),
                   Image.asset(
                 'images/logo.png',
                  fit: BoxFit.fill,
                  height:SizeConfig.blockSizeVertical * 4.5,
                  
              ),
            ],

          ),
      ),
      body: Container(
        child: Text("data"),
      ),
    );
  }
  
}