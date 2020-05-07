import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sisparty/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 203, 236, 241),
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                height: 150,
                child: Text(
                  "SisParty",
                  style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(),
              DrawerTile(Icons.home,"Home", pageController,0),
              DrawerTile(Icons.event,"Eventos", pageController,1),
              DrawerTile(Icons.monetization_on,"Propostas", pageController,2),
              DrawerTile(Icons.person,"Perfil", pageController,3),
            ],
          )
        ],
      ),
    );
  }
}
