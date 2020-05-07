import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      "Propostas aceitas",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildCard("Titulo teste", "Subtitulo de teste"),
                  _buildCard("Titulo teste", "Subtitulo de teste"),
                  _buildCard("Titulo teste", "Subtitulo de teste"),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      "Propostas aceitas",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

Widget _buildCard(title, subtitle) {
  return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
          )
        ],
      ));
}

Widget _buildBodyBack() => Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromARGB(150, 103, 65, 208),
        Color.fromARGB(150, 200, 80, 195),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
);
