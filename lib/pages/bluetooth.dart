import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
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
      body: Column(
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                FlutterBlue flutterBlue = FlutterBlue.instance;
                flutterBlue.startScan(timeout: Duration(seconds: 2));
                var subscription = flutterBlue.scanResults.listen((results) {
                  // do something with scan results
                  for (ScanResult r in results) {
                    debugPrint('${r.device.name} が見つかった rssi: ${r.rssi}');
                  }
                });
                flutterBlue.stopScan();
              },
              child: Icon(Icons.ac_unit))
        ],
      ),
    );
  }
}
