import 'package:bloc_imc/app/app.dart';
import 'package:bloc_imc/app/app_routes.dart';
import 'package:bloc_imc/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NutriApp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Screen1View(),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}

class Screen1View extends StatefulWidget {
  @override
  _Screen1ViewState createState() => _Screen1ViewState();
}

class _Screen1ViewState extends State<Screen1View> {

  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  TextEditingController _loseFatController = new TextEditingController();
  String _result = 'Preencha o campo para calcular os Macros!';

    _rowIcon() {
      return Image.asset(
        Constant.ASSET_LOSS_LOGO, width: 200.0, height: 280.0,);
    }

    _rowLossWeight() {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: TextFormField(
          decoration: InputDecoration(
            helperText: 'Insira seu Peso para saber seus macro nutrientes diários!',
            border: OutlineInputBorder(),
            labelText: "Peso (kg)",
          ),
          controller: _loseFatController,
          keyboardType: TextInputType.number,
        ),
      );
    }

    _rowLossCalculateButton() {
      return TextButton.icon(
        onPressed: () {
          _register(context);
          _resetFields();
        },
        icon: Icon(Icons.add_circle),
        label: Text('Calcular'),
      );
    }

    _rowLossResult() {
      return Row(
        children: [
          Text('$_result', style: TextStyle(fontSize: 18),),
        ],
      );
    }

    _formUI(BuildContext context) {
      return  Column(
        children: [
          _rowIcon(),
          _rowLossWeight(),
          _rowLossCalculateButton(),
          _rowLossResult(),
        ],
      );
    }

    _rowForm(BuildContext context) {
      return Form(
        key: _formkey,
        child: _formUI(context),
      );
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NutriApp'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _rowForm(context),
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

  _register(BuildContext context) {
    print('Validou: ${_formkey.currentState.validate()}');
    if(_formkey.currentState.validate()) {

      final loseFat = PersonLoseFat( double.tryParse(_loseFatController.text));

      setState(() {
        _result = '${loseFat.toString()}';
      });

      print('Resultado:\n${loseFat.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Resultado:\n$_result'),)
      );

    } else {
      print('Digite os campos corretamente!');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Digite os campos corretamente!', ),)
      );
    }
  }

  _resetFields() => _formkey.currentState.reset();

}

