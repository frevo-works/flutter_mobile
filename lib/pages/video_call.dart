import 'package:flutter/material.dart';

class VideoCallPage extends StatefulWidget {
  VideoCallPage({Key key}) : super(key: key);

  @override
  _VideoCallPageState createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ビデオ通話"),
      ),
      body: Column(),
    );
  }
}
