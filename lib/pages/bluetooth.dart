import 'package:flutter/material.dart';
import 'package:flutter_mobile/common/importer.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothPage extends StatefulWidget {
  BluetoothPage({Key key}) : super(key: key);

  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  BluetoothDevice device;
  BluetoothState state;
  BluetoothDeviceState deviceState;
  FlutterBlue flutterBlue = FlutterBlue.instance;
  var scanSubscription;
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
  void scanForDevices() async {
    scanSubscription = flutterBlue.scan().listen((scanResult) async {
      if (scanResult.device.name == "your_device_name") {
        print("found device");
        //Assigning bluetooth device
        device = scanResult.device;
        //After that we stop the scanning for device
        stopScanning();
      } else {
        print(scanResult.device);
      }
    });
  }

  void stopScanning() {
    flutterBlue.stopScan();
    scanSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderComponent(title: "Bluetooth"),
      body: Column(
        children: <Widget>[
          ElevatedButton(
              onPressed: () async {
                flutterBlue.startScan(timeout: Duration(seconds: 2));
                var subscription = flutterBlue.scanResults.listen((results) {
                  for (ScanResult r in results) {
                    debugPrint('${r.device.name} が見つかった rssi: ${r.rssi}');
                  }
                });
                flutterBlue.stopScan();
                FlutterBlue.instance.state.listen((state) {
                  if (state == BluetoothState.off) {
                    //Alert user to turn on bluetooth.
                  } else if (state == BluetoothState.on) {
                    scanForDevices();
                  }
                });
              },
              child: Icon(Icons.ac_unit))
        ],
      ),
    );
  }
}
