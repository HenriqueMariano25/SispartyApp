import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sisparty/views/cadastrar_cliente.dart';
import 'package:sisparty/views/cadastrar_fornecedor.dart';

import 'login.dart';

class EscolherCadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Escolha uma opção"),
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
        body: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Você está :",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40.0),
              ),
              Text(
                "Procurando fornecedores de serviços.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Container(
                    height: 70.0,
                    child: RaisedButton(
                      color: Colors.pink,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => CadastrarCliente()));
                      },
                      child: Text(
                        "Me cadastrar como Cliente",
                        style: TextStyle(fontSize: 24.0, color: Colors.white),
                      ),
                    ),
                  )),
              Divider(),
              Text(
                "Procurando clientes e eventos",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Container(
                    height: 70.0,
                    child: RaisedButton(
                      color: Colors.pink,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => CadastrarFornecedor()));
                      },
                      child: Text(
                        "Me cadastrar como Fornecedor de Serviço",
                        style: TextStyle(fontSize: 24.0, color: Colors.white),
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}

Widget _buildBotaoEscolha(String label_btn) {
  return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Container(
        height: 70.0,
        child: RaisedButton(
          color: Colors.pink,
          onPressed: () {},
          child: Text(
            label_btn,
            style: TextStyle(fontSize: 24.0, color: Colors.white),
          ),
        ),
      ));
}
