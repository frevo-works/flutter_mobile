import '../common/importer.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    var gridView = GridView.extent(
      maxCrossAxisExtent: 200,
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        Card(
          child: Column(children: <Widget>[
            Icon(
              Icons.video_call,
              size: 150,
              color: Colors.amber,
            ),
            AutoSizeText(
              'ビデオ通話',
              style: TextStyle(fontSize: 250),
              maxLines: 2,
            )
          ]),
        ),
        Card(
            child: Column(children: <Widget>[
          Icon(
            Icons.multiline_chart,
            size: 150,
            color: Colors.amber,
          ),
          Text("グラフ")
        ])),
        Card(
            child: Column(children: <Widget>[
          Icon(
            Icons.camera_front,
            size: 150,
            color: Colors.amber,
          ),
          Text("カメラ（顔検知)")
        ])),
        Card(
            child: Column(children: <Widget>[
          Icon(
            Icons.bluetooth,
            size: 150,
            color: Colors.amber,
          ),
          Text("Bluetooth")
        ])),
        Card(
            child: Column(children: <Widget>[
          Icon(
            Icons.map,
            size: 150,
            color: Colors.amber,
          ),
          Text("GoogleMap")
        ])),
      ],
    );
    return Scaffold(
      appBar: HeaderComponent(),
      body: gridView,
    );
  }
}
