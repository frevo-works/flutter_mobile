import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobile/common/importer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  BitmapDescriptor myIcon;

  @override
  Widget build(BuildContext context) {
    final CameraPosition _initPosition = CameraPosition(
        target: LatLng(35.6595722106256, 139.4508758110662), zoom: 14.5);
    _getIcon();
    return new Scaffold(
      appBar: HeaderComponent(title: "マップ"),
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: _initPosition,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          setState(() {
            //ここでマーカーをAPIで取得できる
            _markers.add(Marker(
              markerId: MarkerId('marker_1'),
              position: LatLng(35.6595722106256, 139.4508758110662),
              draggable: true,
              onTap: () => {
                //処理が書けるよ
              },
              infoWindow:
                  InfoWindow(title: "テストタイトル", snippet: "aaaaaaaaaaaaaa"),
              flat: true,
              icon: myIcon,
            ));
          });
          _markers.add(Marker(
              markerId: MarkerId('marker_2'),
              position: LatLng(35.7599722106256, 139.4508758110662),
              flat: true,
              icon: BitmapDescriptor.defaultMarker));
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        scrollGesturesEnabled: true,
        tiltGesturesEnabled: true,
        rotateGesturesEnabled: true,
        compassEnabled: true,
      ),
      floatingActionButton: Column(
          verticalDirection: VerticalDirection.down,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.redAccent,
              onPressed: () {
                Navigator.pop(context);
              },
              heroTag: "hero",
            ),
            Container(
                // 余白のためContainerでラップ
                margin: EdgeInsets.only(bottom: 16.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.amberAccent,
                  onPressed: () {
                    //openDialog();
                    print("pressed");
                  },
                  heroTag: "hero1",
                ))
          ]),
    );
  }

  // Future<void> _goToTheLake() async {
  //   Navigator.pop(context);
  //   final GoogleMapController controller = await _controller.future;
  //   //controller.animateCamera(CameraUpdate.newCameraPosition());
  // }

  Future<void> _getIcon() async {
    await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 8), 'assets/images/truck.png')
        .then((onValue) {
      myIcon = onValue;
    });
  }
}
