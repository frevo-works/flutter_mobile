import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class FaceDetectPage extends StatefulWidget {
  // FaceDetectPage({Key key}) : super(key: key);

  @override
  _FaceDetectPageState createState() => _FaceDetectPageState();
}

class _FaceDetectPageState extends State<FaceDetectPage> {
  CameraController _controller;

  @override
  void initState() {
    super.initState();
    availableCameras().then((cameras) {
      CameraDescription rearCamera = cameras.firstWhere(
          (desc) => desc.lensDirection == CameraLensDirection.front,
          orElse: () => null);
      if (rearCamera == null) {
        return;
      }

      _controller = new CameraController(rearCamera, ResolutionPreset.high);
      _controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var content;
    if (_controller == null || !_controller.value.isInitialized) {
      content = Center(child: CircularProgressIndicator());
    } else {
      content = new Container(
          child: new Center(
              child: new AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: new CameraPreview(_controller))));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('顔検知'),
        ),
        body: content);
  }
}
