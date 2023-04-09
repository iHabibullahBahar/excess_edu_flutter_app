import 'package:excess_edu/views/widgets/course_details/lesson_view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/course_details_model/course_model.dart';

class SectionViewWidget extends StatefulWidget {
  Course course;

  SectionViewWidget({required this.course});

  @override
  State<SectionViewWidget> createState() => _SectionViewWidgetState();
}

class _SectionViewWidgetState extends State<SectionViewWidget> {
  //Section View Variable
  List<bool> _isExpandedList = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.course!.curriculum.sections.length,
      itemBuilder: (context, index) {
        if (_isExpandedList.length <= index) {
          // initialize the expansion state for this section
          _isExpandedList.add(false);
        }
        return Column(
          children: [
            SizedBox(
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Section ${index + 1} - ${widget.course!.curriculum.sections[index].sectionName} ",
                    textScaleFactor: 1.2,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpandedList[index] = !_isExpandedList[index];
                        });
                        print(_isExpandedList[index]);
                      },
                      child: _isExpandedList[index]
                          ? Icon(Icons.arrow_drop_up)
                          : Icon(Icons.arrow_drop_down)),
                ],
              ),
            ),
            if (_isExpandedList[index])
              Container(
                child: LessonViewWidget(
                  section: widget.course.curriculum.sections[index],
                ),
              )
          ],
        );
      },
    );
  }
}
