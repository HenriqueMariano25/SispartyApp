import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sisparty/models/user_model.dart';
import 'package:sisparty/views/cadastrar_fornecedor.dart';
import 'package:sisparty/views/home.dart';
import 'package:sisparty/views/login.dart';
import 'package:sisparty/views/escolher_cadastro.dart';
import 'package:sisparty/views/cadastrar_cliente.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sisparty/views/perfil.dart';

void main() {
  runApp(new MyApp());

//  Firestore.instance.collection("col").document("doc").setData({"text":"Henrique"});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        title: "SysParty",
        theme: ThemeData(
//      primarySwatch: Colors.blue,
          primaryColor: Colors.pink,
          backgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
