import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../Arrangements/sizeModification.dart';

Widget bottomnavigation(BuildContext context, int index) {
  return BottomNavigationBar(
    backgroundColor:
    // Colors.cyan[200],
     Color.fromRGBO(191,32,37, 1.0),
    elevation: 4.0,
    onTap: (index) {
      switch (index) {
        case 0:
          {
            Navigator.pushReplacementNamed(context, 'HomeScreen');
            break;
          }
        case 1:
          {
            Navigator.pushNamed(context, 'ContactUs');
            break;
          }

        case 2:
          {
            Navigator.pushNamed(context, 'Cart');
            break;
          }
      }
    },
    type: BottomNavigationBarType.fixed,
    currentIndex: index,
    items:
        //  <BottomNavigationBarItem>
        [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Colors.black45,
        ),
        title: Text('Home',
            style: TextStyle(
                fontSize: SizeConfig.blockSizeVertical * 1.8,
                fontWeight: FontWeight.w800)),
        activeIcon: Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      BottomNavigationBarItem(
      
          icon: Icon(
            Icons.contacts,
             color:Colors.black45,
          ),
           activeIcon:Icon(
            Icons.contacts,
            color: Colors.white,
            //  color:Colors.black45,
          ),
          title: Text('Contact us',
            style: TextStyle(
                fontSize: SizeConfig.blockSizeVertical * 1.8,
                fontWeight: FontWeight.w800)
          )),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.black45,
          ),
           activeIcon:Icon(
           Icons.shopping_cart,
            color: Colors.white,
            //  color:Colors.black45,
          ),
          title: Text('Cart',
            style: TextStyle(
                fontSize: SizeConfig.blockSizeVertical * 1.8,
                fontWeight: FontWeight.w800))),
    ],
    fixedColor: 
    Colors.white,
    // Color.fromRGBO(127, 68, 0, .9),
  );
}
