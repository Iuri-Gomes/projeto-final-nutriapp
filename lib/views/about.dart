import 'package:bloc_imc/app/app.dart';
import 'package:bloc_imc/app/app_routes.dart';
import 'package:bloc_imc/model/model.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NutriApp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: AboutView(),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}

class AboutView extends StatefulWidget {
  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NutriApp'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            child: Icon(Icons.info_outline_rounded, size: 100,),
          ),
          Text('Sobre:\n Projeto Final feito por:\n Iuri Gomes - iuriwwe@gmail.com\n Matheus Dutra - teteudutramoraes@gmail.com', style: TextStyle(fontSize: 20.0)),
          TextButton.icon(
            icon: Icon(Icons.arrow_back),
            label: Text('Voltar para home'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.APP_ROUTE_HOME);
            },
          ),
        ],
      ),
    );
  }
}