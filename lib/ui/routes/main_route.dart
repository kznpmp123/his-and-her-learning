import 'package:flutter/material.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/data/models/course.dart';
import 'package:kzn/providers/course_provider.dart';
import 'package:kzn/providers/user_provider.dart';
import 'package:kzn/ui/components/combine/app_drawer.dart';
import 'package:kzn/ui/components/combine/app_fab.dart';
import 'package:kzn/ui/components/combine/course_list.dart';
import 'package:kzn/ui/components/combine/intro_slider.dart';
import 'package:kzn/ui/components/single/course_thumb.dart';

import 'package:kzn/ui/routes/tnc_route.dart';
import 'package:kzn/utils/open_facebook.dart';
import 'package:provider/provider.dart';

import 'about_route.dart';

class MainRoute extends StatefulWidget {
  static const routeName = '/main_route';
  @override
  _MainRouteState createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<CourseProvider>(context,listen: false).getCourseListForOneTime();
    //Provider.of<UserProvider>(context,listen: false).login(username: "admin", password: "admin");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KZN "),
      ),
      body: Column(
        children: [
          IntroSlider(photos: introSliderImages,),
          Expanded(child: _courseListFutureBuilder()),
        ],
      ),
      drawer: AppDrawer(),
      floatingActionButton: AppFab(),
    );
  }

  // 1 Course List Future Builder
  Widget _courseListFutureBuilder(){
    return FutureBuilder(
        future: Provider
            .of<CourseProvider>(context, listen: true)
            .courseList,
        builder: (BuildContext context, AsyncSnapshot<List<Course>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0){
              return Container(child: Center(child: Text('no course')),);
            }
            else{
              return  CourseList(courses: snapshot.data) ;
            }
          }
          else if (snapshot.hasError) {
            //_refreshController.refreshCompleted();
            return Container(child: Center(
                child: Text('error ${snapshot.error.toString()}')),);
          }
          else {
            //_refreshController.refreshCompleted();
            return Container(
              child: Center(child: Text('loading courses...')),);
          }
        }
    );
  }
}
