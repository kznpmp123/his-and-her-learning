import 'package:flutter/material.dart';

class MainRoute extends StatefulWidget {
  static const routeName = '/main_route';
  @override
  _MainRouteState createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KZN "),
      ),
      body: Center(
        child: Text("KZN"),
      ),
    );
  }
}
