import 'package:flutter/material.dart';
import 'Container.dart';
import 'FisherPrice.dart';
import 'hyundai.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  // Define las diferentes propiedades con valores por defecto.
  // Actualiza estas propiedades cuando el usuario toque un FloatingActionButton.

  @override
  Widget build(BuildContext context) {
    return const Material(
        child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ListScreen(),
            Hyundai(),
            FisherPrice(),
          ]),
    ));
  }
}
