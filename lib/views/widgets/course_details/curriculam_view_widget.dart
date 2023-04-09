import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../models/course_details_model/course_model.dart';

class CurriculumViewWidget extends StatelessWidget {
  final Course course;

  CurriculumViewWidget({required this.course});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hlwwww"),
      color: Colors.amber,
    );
  }
}
