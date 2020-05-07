import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sisparty/models/user_model.dart';
import 'package:sisparty/views/login.dart';

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return Column(
            children: <Widget>[
              Text("Perfil"),
              Text("Saldo:"),
              Text("Nome:"),
              Text("Email:"),
              Container(
                child: RaisedButton(
                  onPressed: (){
                    model.signOut();
                  },
                  child: Text("Sair"),
                ),
              ),
            ]
          );
        },
      );
  }
}
