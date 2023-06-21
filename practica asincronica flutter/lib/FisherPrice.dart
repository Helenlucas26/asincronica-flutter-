import 'dart:async';

import 'package:asincronia/services/mockapi.dart';
import 'package:flutter/material.dart';

class FisherPrice extends StatefulWidget {
  const FisherPrice({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<FisherPrice> {
  double _width = 0;
  int resultado = 0;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Ink(
              width: 90,
              height: 90,
              decoration: const ShapeDecoration(
                color: Colors.redAccent,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.directions_walk,
                  color: Colors.black,
                  size: 50.0,
                ),
                color: Colors.white,
                onPressed: () async {
                  _toggleExpand();
                  resultado = await MockApi().getFisherPriceInteger() as int;
                  refresh();
                  await Future.delayed(Duration(seconds: 10));

                  // Ge_toggleExpandnera un color aleatorio.
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                  8.0), // add space of 8.0 logical pixels on all sides
              child: Text(""),
            ),
            AnimatedContainer(
              // Usa setState para reconstruir el widget con nuevos valores.
              width: _isExpanded ? _width : _width,
              height: 15,

              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              // Define la duración de la animación.
              duration: Duration(seconds: _isExpanded ? 10 : 0),

              // Proporciona una curva opcional para hacer que la animación se sienta más suave.
            ),
            Padding(
              padding: EdgeInsets.all(
                  8.0), // add space of 8.0 logical pixels on all sides
              child: Text(""),
            ),
            Text(
              '${result().toString()}',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.redAccent),
            ),
          ],
        ));
  }

  refresh() {
    setState(() {
      _width = 0;
      _isExpanded = false;
    });
  }

  _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      _width = 350;
    });
  }

  result() {
    return resultado;
  }
}
