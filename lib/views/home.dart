import 'package:bloc_imc/app/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:bloc_imc/constant.dart';
import 'package:flutter/widgets.dart';
class AndroidHome extends StatefulWidget {

  final String title;


  AndroidHome(this.title);

  @override
  _AndroidHomeState createState() => _AndroidHomeState();
}

class _AndroidHomeState extends State<AndroidHome>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('${widget.title}'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton.icon(
            icon: Image.asset(Constant.ASSET_LOSS_LOGO, width: 200.0, height: 200.0,),
            label: Text('Perder Peso ->', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,),),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.APP_ROUTE_SCREEN_1);
            },
          ),
          TextButton.icon(
            icon: Image.asset(Constant.ASSET_GAIN_LOGO, width: 200.0, height: 200.0,),
            label: Text('Ganhar Peso ->', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,),),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.APP_ROUTE_SCREEN_2);
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.info_outline_rounded, size: 30.0,),
            label: Text('Sobre ->', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,),),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.APP_ROUTE_ABOUT);
            },
          ),
        ],
      ),
    );
  }
}
