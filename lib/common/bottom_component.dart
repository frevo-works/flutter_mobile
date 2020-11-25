import 'dart:developer';

import 'package:flutter/material.dart';

class BottomComponent extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<BottomComponent> createState() => BottomComponentState();

  @override
  Size get preferredSize => Size.fromHeight(40.0);
}
class BottomComponentState extends State<BottomComponent> {
  @override
  BottomNavigationBar build(BuildContext context) {
    return BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
        ],
      );
  }
}