import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sisparty/models/user_model.dart';
import 'package:sisparty/tabs/home_tab.dart';
import 'package:sisparty/views/perfil.dart';
import 'package:sisparty/widgets/custom_drawer.dart';

import 'login.dart';

class Home extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            if(model.isLoggedIn() == false){
              return Scaffold(
                body: Login(),
              );
            }
            return PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Scaffold(
                  drawer: CustomDrawer(_pageController),
                  appBar: AppBar(),
                  body: HomeTab(),
                ),
                Scaffold(
                  drawer: CustomDrawer(_pageController),
                  appBar: AppBar(),
                  body: HomeTab(),
                ),
                Scaffold(
                  drawer: CustomDrawer(_pageController),
                  appBar: AppBar(),
                  body: HomeTab(),
                ),
                Scaffold(
                  drawer: CustomDrawer(_pageController),
                  appBar: AppBar(),
                  body: Perfil(),
                ),
              ],
            );
          },
    );
  }
}


