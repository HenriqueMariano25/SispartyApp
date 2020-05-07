import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sisparty/models/user_model.dart';


import 'home.dart';
import 'login.dart';

class CadastrarCliente extends StatefulWidget {
  @override
  _CadastrarClienteState createState() => _CadastrarClienteState();
}

class _CadastrarClienteState extends State<CadastrarCliente> {

//  Firestore.instance.collection("col").document("doc").setData({"text":"Henrique"});


  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarsenhaController = TextEditingController();
  final _cpfcnpjController = TextEditingController();
  final _datanascimentoController = TextEditingController();
  final _enderecoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Cadastrar-se"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Cancelar",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Login()));
            },
          ),
        ],
      ),
      body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10.0, top: 10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "Cadastrar-se como",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Cliente",
                        style:
                        TextStyle(
                            fontSize: 26.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      _buildTextField(
                          "Nome", TextInputType.text, false, _nomeController),
                      _buildTextField("Email", TextInputType.emailAddress, false,
                          _emailController),
                      _buildTextField(
                          "Senha", TextInputType.text, true,
                          _senhaController),
                      _buildTextField(
                          "Confirmar Senha", TextInputType.text, true,
                          _confirmarsenhaController),
                      _buildTextField("CPF/CNPJ", TextInputType.text, false,
                          _cpfcnpjController),
                      _buildTextField(
                          "Data de Nascimento", TextInputType.text,
                          false, _datanascimentoController),
                      _buildTextField("Endereço", TextInputType.text, false,
                          _enderecoController),
                      Divider(),
                      Container(
                        height: 60.0,
                        child: RaisedButton(
                          onPressed: (){
                            if(_formKey.currentState.validate() && _senhaController.text == _confirmarsenhaController.text){

                              Map<String, dynamic> userData = {
                                "name": _nomeController.text,
                                "email": _emailController.text,
                                "endereco": _enderecoController.text,
                                "cpfcnpj": _cpfcnpjController.text,
                                "nascimento": _datanascimentoController.text,
                                "tipo": "Cliente"
                              };
                              model.signUp(
                                  userData: userData,
                                  pass: _senhaController.text,
                                  onSuccess: _onSuccess,
                                  onFail: _onFail
                              );
                            }
                          },
                          color: Colors.pink,
                          child: Text(
                            "Cadastrar",
                            style: TextStyle(
                                fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),

    );

  }
  void _onSuccess() {
    Widget build(BuildContext context) {
      return Home();
    }
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Falha ao criar usuário!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        )
    );
  }
}



  Widget _buildTextField(String labelText, TextInputType keyBoard, bool teste,
      TextEditingController cont) {
    return TextFormField(
      controller: cont,
      keyboardType: keyBoard,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.deepPurple, fontSize: 20.0)),
      obscureText: teste,
    );
  }