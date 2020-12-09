import 'dart:async';
import '../common/importer.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  @override
  State<GoogleMapPage> createState() => GoogleMapPageState();
}

class GoogleMapPageState extends State<GoogleMapPage> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  BitmapDescriptor myIcon;

  @override
  Widget build(BuildContext context) {
    final CameraPosition _initPosition = CameraPosition(
        target: LatLng(35.6595722106256, 139.4508758110662), zoom: 14.5);
    _getIcon();
    return new Scaffold(
      appBar: HeaderComponent(),
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

  Future<void> _goToTheLake() async {
    Navigator.pop(context);
    final GoogleMapController controller = await _controller.future;
    //controller.animateCamera(CameraUpdate.newCameraPosition());
  }

  Future<void> _getIcon() async {
    await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 8), 'assets/images/truck.png')
        .then((onValue) {
      myIcon = onValue;
    });
  }

//   Widget _makeGoogleMap() {
//     return GoogleMap(
//       options: GoogleMapOptions(
//           scrollGesturesEnabled: true,
//           tiltGesturesEnabled: true,
//           rotateGesturesEnabled: true,
//           myLocationEnabled: true,
//           compassEnabled: true,
//           mapType: MapType.terrain),
//       onMapCreated: (GoogleMapController controller) {
//         controller.moveCamera(CameraUpdate.newCameraPosition(_cameraPosition));
//         // controller.markers(
//         //   MarkerOptions.defaultOptions
//         // )
//         //controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
//         _controller.complete(controller);
//       },
//     );
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     setState(() {
//       mapController = controller;
//       _controller.complete(controller);
//     });
//   }
  // @override
  // Widget build(BuildContext context) {
  //   return new Scaffold(
  //     appBar: HeaderComponent(),
  //     body: Container(
  //       height: MediaQuery.of(context).size.height,
  //       width: MediaQuery.of(context).size.width,
  //       child: _makeGoogleMap(),
  //     ),
  // child: Stack(
  //   children: <Widget>[
  //     new Positioned.fill(
  //       child: new LayoutBuilder(
  //         builder: (context, constraints) {
  //           return new Padding(
  //             padding: new EdgeInsets.only(
  //                 top: constraints.biggest.height * .80,
  //                 bottom: constraints.biggest.height * .10),
  //             child: Text("test"),
  //           );
  //         },
  //       ),
  //     )
  //   ],
  // ),
  // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
  // floatingActionButton: Column(
  //   verticalDirection: VerticalDirection.down,
  //   mainAxisSize: MainAxisSize.min,
  //   children: <Widget>[
  //     FloatingActionButton(
  //       backgroundColor: Colors.redAccent,
  //       onPressed: () {
  //         Navigator.pop(context);
  //       },
  //       heroTag: "hero",
  //     ),
  //     Container(
  //       // 余白のためContainerでラップ
  //       margin: EdgeInsets.only(bottom: 16.0),
  //       child: FloatingActionButton(
  //         backgroundColor: Colors.amberAccent,
  //         onPressed: () {
  //           //openDialog();
  //           print("pressed");
  //         },
  //         heroTag: "hero1",
  //       ),
  //     ),
  //   ],
  // ),
  // bottomNavigationBar: BottomNavigationBar(
  //   backgroundColor: Colors.lightGreen,
  //    items: [
  //     BottomNavigationBarItem(
  //       icon: Icon(Icons.ac_unit),
  //       title: Text(
  //           "test"
  //       )
  //     ),
  //     BottomNavigationBarItem(
  //         icon: Icon(Icons.map),
  //         title: Text("map")
  //     )
  //    ],
  //   onTap: (int index) {
  //     setState(
  //           () {
  //         _navIndex = index;
  //         _label = _titles[index];
  //       },
  //     );
  //   },
  //   currentIndex: _navIndex,
  // ),
  //・・bottomNavigationBar: BottomComponent(),
  //   );
  // }

  // Future<void> _goToTheLake() async {
  //   Navigator.pop((context));
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
  // }

  // Future<List<Memo>> fetchArticle() async {
  //   final url = 'http://127.0.0.1:8080/api/test';
  //   final response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     final List<dynamic> jsonArray = json.decode(response.body);
  //     return jsonArray.map((json) => Memo.fromMap(json)).toList();
  //   } else {
  //     throw Exception('Failed to load article');
  //   }
  // }

  //GoogleMapPageを生成するウィジェット
  // Widget _makeGoogleMap() {
  //   return GoogleMap(
  //     options: GoogleMapOptions(
  //         scrollGesturesEnabled: true,
  //         tiltGesturesEnabled: true,
  //         rotateGesturesEnabled: true,
  //         myLocationEnabled: true,
  //         compassEnabled: true,
  //         mapType: MapType.terrain),
  //     onMapCreated: (GoogleMapController controller) {
  //       controller.moveCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
  //       // controller.markers(
  //       //   MarkerOptions.defaultOptions
  //       // )
  //       //controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
  //       _controller.complete(controller);
  //     },
  //   );
  // }

  // Future<void> openDialog() async {
  //   switch (await showDialog<Department>(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return SimpleDialog(
  //           title: const Text('Select assignment'),
  //           children: <Widget>[
  //             SimpleDialogOption(
  //               onPressed: () { Navigator.pop(context, Department.treasury); },
  //               child: const Text('Treasury department'),
  //             ),
  //             SimpleDialogOption(
  //               onPressed: () { Navigator.pop(context, Department.state); },
  //               child: const Text('State department'),
  //             ),
  //           ],
  //         );
  //       }
  //   )) {
  //     case Department.treasury:
  //     // Let's go.
  //     // ...
  //       break;
  //     case Department.state:
  //     // ...
  //       break;
  //   }
  // }
//}
//   class NextPage extends State<NextPage> {
//     GoogleMapPageController mapController;
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child:Container(
//           child: GoogleMapPage(
//             onMapCreated: _onMapCreated,
//           ),
//         )
//       ),
//     );
//     }
//     void _onMapCreated(GoogleMapPageController controller) {
//       setState(() {
//         mapController = controller;
//       });
//     }
}
