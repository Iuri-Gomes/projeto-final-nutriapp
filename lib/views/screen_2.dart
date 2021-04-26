import 'package:bloc_imc/app/app.dart';
import 'package:bloc_imc/app/app_routes.dart';
import 'package:bloc_imc/model/model.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NutriApp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Screen2View(),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}

class Screen2View extends StatefulWidget {
  @override
  _Screen2ViewState createState() => _Screen2ViewState();
}

class _Screen2ViewState extends State<Screen2View> {

  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  TextEditingController _gainMassController = new TextEditingController();
  String _result = 'Preencha o campo para calcular os Macros!';

    _rowIcon() {
      return Image.asset(
        Constant.ASSET_GAIN_LOGO, width: 200.0, height: 280.0,);
    }

    _rowGainWeight() {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: TextFormField(
          decoration: InputDecoration(
            helperText: 'Insira seu Peso para saber seus macro nutrientes diários!',
            border: OutlineInputBorder(),
            labelText: "Peso (kg)",
          ),
          controller: _gainMassController,
          keyboardType: TextInputType.number,
        ),
      );
    }

    _rowGainResult() {
      return Row(
        children: [
          Text('$_result', style: TextStyle(fontSize: 18),),
        ],
      );
    }

    _rowGainCalculateButton() {
      return TextButton.icon(
        onPressed: () {
          _register(context);
          _resetFields();
        },
        icon: Icon(Icons.add_circle),
        label: Text('Calcular'),
      );
    }

    _formUI(BuildContext context) {
      return  Column(
        children: [
          _rowIcon(),
          _rowGainWeight(),
          _rowGainCalculateButton(),
          _rowGainResult(),
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

      final gainMass = PersonGainMass( double.tryParse(_gainMassController.text));

      setState(() {
        _result = '${gainMass.toString()}';
      });

      print('Resultado:\n${gainMass.toString()}');
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