import 'package:flutter/material.dart';
import 'package:kzn/data/models/course.dart';
import 'package:kzn/ui/components/single/course_thumb.dart';

class CourseList extends StatelessWidget {
  final List<Course> courses;
  CourseList({this.courses});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => CourseThumb(course: courses[index]),
        separatorBuilder: (context, index) => Divider(),
        itemCount: courses.length
    );
  }
}
