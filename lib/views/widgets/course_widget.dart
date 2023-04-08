import 'dart:developer';

import 'package:excess_edu/config/app_config.dart';
import 'package:excess_edu/consts/colors.dart';
import 'package:excess_edu/utils/routes.dart';
import 'package:excess_edu/views/pages/course_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/course_model.dart';

class CourseWidget extends StatelessWidget {
  final Course course;

  const CourseWidget({required this.course}) : assert(course != null);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CourseDetailsPage(course.id, course.name)));
      },
      trailing: Image.asset(course.image), // replace with your image asset
      title: Text(
        course.name,
        style:
            TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold),
        textScaleFactor: 0.9,
      ),
      subtitle: Text(
        "${course.price} ${AppConfig.currency}",
        textScaleFactor: 1,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }
}
