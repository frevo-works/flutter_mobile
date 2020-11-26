import 'package:flutter/material.dart';
import 'package:flutter_mobile/pages/google_map_page.dart';

import 'pages/bluetooth.dart';
import 'pages/face_detect.dart';
import 'pages/graph.dart';
import 'pages/menu.dart';
import 'pages/video_call/video_call_index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: _Home());
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("サンプル"),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text('ビデオ通話'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return VideoCallIndexPage();
                  }),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('グラフ'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return GraphPage();
                  }),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('カメラ（顔検知）'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return FaceDetectPage();
                  }),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Bluetooth'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return BluetoothPage();
                  }),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('GoogleMap'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return GoogleMapPage();
                  }),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('menu'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return MenuPage();
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
