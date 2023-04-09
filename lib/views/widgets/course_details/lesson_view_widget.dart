import 'package:excess_edu/models/course_details_model/lesson_model.dart';
import 'package:excess_edu/models/course_details_model/section_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/course_details_model/course_model.dart';

class LessonViewWidget extends StatelessWidget {
  final Section section;

  LessonViewWidget({required this.section});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: section.lessons.length,
      itemBuilder: (builder, index) {
        return Container(
          child: Text(section.lessons[index].lessonName),
        );
      },
    );
  }
}
