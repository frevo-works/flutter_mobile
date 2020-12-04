import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:flutter_camera_ml_vision/flutter_camera_ml_vision.dart';
import 'package:flutter_mobile/common/importer.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class FaceDetectPage extends StatefulWidget {
  // FaceDetectPage({Key key}) : super(key: key);

  @override
  _FaceDetectPageState createState() => _FaceDetectPageState();
}

class _FaceDetectPageState extends State<FaceDetectPage> {
  String _scannedData;

  final _scanKey = GlobalKey<CameraMlVisionState>();

  FaceDetector detector =
      FirebaseVision.instance.faceDetector(FaceDetectorOptions(
    enableTracking: true,
    mode: FaceDetectorMode.accurate,
  ));

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _scannedData = 'スキャン中…';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderComponent(title: "顔検知"),
      body: SizedBox.expand(
        child: CameraMlVision<List<Face>>(
          key: _scanKey,
          cameraLensDirection: CameraLensDirection.front,
          detector: detector.processImage,
          overlayBuilder: (c) {
            return Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                ),
                FittedBox(
                  // スキャンしたデータが何文字になるか分からないのでFittedBoxで囲った
                  child: Text(
                    _scannedData,
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 40.0,
                    ),
                  ),
                ),
              ],
            );
          },
          onResult: (faces) {
            if (faces == null || faces.isEmpty || !mounted) {
              setState(() {
                _scannedData = 'スキャン中';
              });
              return;
            }

            setState(() {
              _scannedData = "認識中";
            });
          },
          onDispose: () {
            detector.close();
          },
        ),
      ),
    );
  }
}
