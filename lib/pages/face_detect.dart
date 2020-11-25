import 'package:flutter/material.dart';

class FaceDetectPage extends StatefulWidget {
  FaceDetectPage({Key key}) : super(key: key);

  @override
  _FaceDetectPageState createState() => _FaceDetectPageState();
}

class _FaceDetectPageState extends State<FaceDetectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("顔検知"),
      ),
      body: Column(),
    );
  }
}
