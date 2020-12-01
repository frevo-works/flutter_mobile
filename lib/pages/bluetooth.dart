import 'package:flutter/material.dart';
import 'package:flutter_mobile/common/importer.dart';

class BluetoothPage extends StatefulWidget {
  BluetoothPage({Key key}) : super(key: key);

  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderComponent(title: "Bluetooth"),
      body: Column(),
    );
  }
}
