import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sisparty/models/user_model.dart';
import 'package:sisparty/views/escolher_cadastro.dart';

import 'home.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _senhaController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(builder: (context, child, model) {
        if (model.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: "Email", labelStyle: TextStyle(fontSize: 20.0)),
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text.isEmpty || text.contains("@"))
                    return "E-mail inválido";
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(
                    labelText: "Senha", labelStyle: TextStyle(fontSize: 20.0)),
                obscureText: true,
                validator: (text) {
                  if (text.isEmpty || text.length < 6) return "Senha inválida";
                },
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Container(
                    height: 50.0,
                    child: RaisedButton(
                      color: Colors.pink,
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) ;
                        model.signIn(
                            email: _emailController.text,
                            pass: _senhaController.text,
                            onSuccess: _onSuccess,
                            onFail: _onFail);
                      },
                    ),
                  )),
              Align(
                alignment: Alignment.center,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => EscolherCadastro()));
                  },
                  child: Text(
                    "Não tem conta ? Cadastrar-se",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, color: Colors.pinkAccent),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  void _onSuccess() {
//    Widget build(BuildContext context) {
//      return Home();
//    }
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Usuario ou senha incorreta!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        )
    );
  }

}


