import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/bluetooth.dart';
// import 'pages/face_detect.dart';
import 'pages/graph.dart';
// import 'pages/login.dart';
import 'pages/map.dart';
import 'pages/persistence/todo_bloc.dart';
import 'pages/persistence/todo_list.dart';
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
        body: _gridView(context));
  }

  Widget _gridView(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 200,
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        Card(
          child: new InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return VideoCallIndexPage();
                  }),
                );
              },
              child: Column(children: <Widget>[
                Icon(
                  Icons.video_call,
                  size: 150,
                  color: Colors.amber,
                ),
                Text("VideoCall"),
              ])),
        ),
        Card(
            child: new InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return GraphPage();
                    }),
                  );
                },
                child: Column(children: <Widget>[
                  Icon(
                    Icons.multiline_chart,
                    size: 150,
                    color: Colors.amber,
                  ),
                  Text("Chart")
                ]))),
        // Card(
        //     child: new InkWell(
        //         onTap: () {
        //           Navigator.of(context).push(
        //             MaterialPageRoute(builder: (context) {
        //               return FaceDetectPage();
        //             }),
        //           );
        //         },
        //         child: Column(children: <Widget>[
        //           Icon(
        //             Icons.camera_front,
        //             size: 150,
        //             color: Colors.amber,
        //           ),
        //           Text("Face Detect")
        //         ]))),
        Card(
            child: new InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return BluetoothPage();
                    }),
                  );
                },
                child: Column(children: <Widget>[
                  Icon(
                    Icons.bluetooth,
                    size: 150,
                    color: Colors.amber,
                  ),
                  Text("Bluetooth")
                ]))),
        Card(
            child: new InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return MapPage();
                    }),
                  );
                },
                child: Column(children: <Widget>[
                  Icon(
                    Icons.map,
                    size: 150,
                    color: Colors.amber,
                  ),
                  Text("GoogleMap")
                ]))),
        Card(
            child: new InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return Provider<TodoBloc>(
                          create: (context) => new TodoBloc(),
                          dispose: (context, bloc) => bloc.dispose(),
                          child: TodoListView());
                    }),
                  );
                },
                child: Column(children: <Widget>[
                  Icon(
                    Icons.list,
                    size: 150,
                    color: Colors.amber,
                  ),
                  Text("SQLite")
                ]))),
        // Card(
        //     child: new InkWell(
        //         onTap: () {
        //           Navigator.of(context).push(
        //             MaterialPageRoute(builder: (context) {
        //               return LoginPage();
        //             }),
        //           );
        //         },
        //         child: Column(children: <Widget>[
        //           Icon(
        //             Icons.login,
        //             size: 150,
        //             color: Colors.amber,
        //           ),
        //           Text("Login")
        //         ]))),
      ],
    );
  }
}
