import 'package:carigari/screens/home.dart';
import 'package:carigari/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:splashscreen/splashscreen.dart';

import '../Arrangements/sizeModification.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new SplashScreen(
            seconds: 3,
            backgroundColor:
                // Colors.white,
                Color.fromRGBO(255, 184, 102, .6),
            image: Image.asset('images/logo.png'),
            photoSize: SizeConfig.blockSizeVertical * 22.0,
            title: Text(
              "Welcome to our World",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: SizeConfig.blockSizeVertical * 3.0,
                color: Color.fromRGBO(25, 13, 0, .9),
              ),
            ),
            // loaderColor: Colors.green,
            navigateAfterSeconds: Home(),
            //  SelectScreen(),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Powered By ConversionGuru',
                  style: TextStyle(
                    // decorationColor: Colors.green,
                    fontWeight: FontWeight.w400,
                    fontSize: SizeConfig.blockSizeVertical * 2.5,
                    backgroundColor: Color.fromRGBO(255, 184, 102, .2),
                  )),
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                // child: new Image.asset(
                //   'assets/dff.png',
                //   height: 40.0,
                //   fit: BoxFit.scaleDown,
                // ),
              )
            ],
          ),
          // return new Scaffold(
          //   body: Center(
          //     child: new Image.asset("images/logo.png"),
          //   )
          // );
        ],

        //  height: SizeConfig.blockSizeVertical * 20,
        //  width: SizeConfig.blockSizeHorizontal * 50,
      ),
    );
  }
}
