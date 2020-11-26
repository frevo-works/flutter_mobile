import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras;

Future<void> initialize() async {
  // WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  // runApp(FaceDetectPage());
}

class FaceDetectPage extends StatefulWidget {
  // FaceDetectPage({Key key}) : super(key: key);

  @override
  _FaceDetectPageState createState() => _FaceDetectPageState();
}

class _FaceDetectPageState extends State<FaceDetectPage> {
  CameraController controller;

  Future<void> _initializeCameraController;

  @override
  void initState() {
    super.initState();
    initialize();
    controller = CameraController(cameras[0], ResolutionPreset.medium);

    _initializeCameraController = controller.initialize();
    // controller.initialize().then((_) {
    //   if (!mounted) {
    //     return;
    //   }
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (!controller.value.isInitialized) {
    //   return Scaffold(
    //     appBar: AppBar(
    //       title: Text("顔検知"),
    //     ),
    //     body: Column(),
    //   );
    // }
    return Scaffold(
        appBar: AppBar(
          title: Text('顔検知'),
        ),
        body: FutureBuilder<void>(
          future: _initializeCameraController,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // カメラの初期化が完了したら、プレビューを表示
              return CameraPreview(controller);
            } else {
              // カメラの初期化中はインジケーターを表示
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("顔検知"),
  //     ),
  //     body: Column(),
  //   );
  // }
}
