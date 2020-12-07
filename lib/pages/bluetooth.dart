import 'package:flutter/material.dart';
import 'package:flutter_mobile/common/importer.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothPage extends StatefulWidget {
  BluetoothPage({Key key}) : super(key: key);

  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  Future<void> checkBlueTooth() async {
    // FlutterBlue flutterBlue = FlutterBlue.instance;
    // flutterBlue.startScan(timeout: Duration(seconds: 4));

// Listen to scan results
    // var subscription = flutterBlue.scanResults.listen((results) {
    //   // do something with scan results
    //   for (ScanResult r in results) {
    //     print('${r.device.name} found! rssi: ${r.rssi}');
    //   }
    // });
//     List<BluetoothService> services = await device.discoverServices();
//     services.forEach((service) {
//       var characteristics = service.characteristics;
//       for(BluetoothCharacteristic c in characteristics) {
//       List<int> value = await c.read();
//     print(value);
//     // do something with service
// });

// Writes to a characteristic
// await c.write([0x12, 0x34])
// );
// Stop scanning
    //   flutterBlue.stopScan();
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
