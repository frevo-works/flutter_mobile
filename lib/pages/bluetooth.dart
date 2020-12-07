import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_mobile/common/importer.dart';

class BluetoothPage extends StatefulWidget {
  BluetoothPage({Key key}) : super(key: key);

  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  final _streamController = StreamController<List<ScanResult>>();

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

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
                  this._streamController.sink.add(results);
                  // for (ScanResult r in results) {
                  //   debugPrint('${r.device.name} が見つかった rssi: ${r.rssi}');
                  // }
                });
                flutterBlue.stopScan();
              },
              child: Text("スキャン開始")),
          StreamBuilder(
              stream: this._streamController.stream,
              builder: (BuildContext context,
                  AsyncSnapshot<List<ScanResult>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      ScanResult scanResult = snapshot.data[index];

                      return Card(
                          child: ListTile(title: Text(scanResult.device.name)));
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })
        ],
      ),
    );
  }
}
