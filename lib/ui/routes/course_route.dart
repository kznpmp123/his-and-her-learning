import 'package:flutter/material.dart';

class CourseRoute extends StatefulWidget {
  static const routeName = '/course_route';
  @override
  _CourseRouteState createState() => _CourseRouteState();
}

class _CourseRouteState extends State<CourseRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course"),
      ),
      body: Column(
        children: [
          Placeholder(fallbackHeight: 300,),
          Expanded(
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Container(height: 100, child: Text('Hello $index'),),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: 50
              )
          )
        ],
      ),
    );
  }
}
