import 'package:flutter/material.dart';

class HeaderComponent extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<HeaderComponent> createState() => HeaderComponentState();

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}

class HeaderComponentState extends State<HeaderComponent> {
  @override
  AppBar build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        leading: SizedBox(
            child: FlatButton(
          child: Icon(Icons.more_vert),
          onPressed: () {
            //ドロワーの処理をここにかく
          },
        )),
        title: const Text(
          "サンプルアプリ",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        actions: <Widget>[
          // SizedBox(
          //   width: 48,
          //   child: FlatButton(onPressed: null, child: Icon(Icons.search)),
          // ),
          // SizedBox(
          //   width: 48,
          //   child: FlatButton(onPressed: () {}, child: Icon(Icons.more_vert)),
          // )
        ]);
  }
}
