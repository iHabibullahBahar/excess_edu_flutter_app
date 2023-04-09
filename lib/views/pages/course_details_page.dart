import 'package:excess_edu/consts/colors.dart';
import 'package:excess_edu/consts/sizes.dart';
import 'package:excess_edu/views/widgets/course_details/curriculam_view_widget.dart';
import 'package:excess_edu/views/widgets/course_details/section_view_widget.dart';
import '../../models/course_details_model/course_model.dart';
import '/views/widgets/label_widget.dart';
import 'package:get/get.dart';
import '../widgets/course_details/bottom_floating_bar_widget.dart';
import '../widgets/course_details/what_you_learn_widget.dart';
import '../widgets/course_details/youtube_player_widget.dart';
import '/views/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../../controllers/course_details_view-controller.dart';

class CourseDetailsPage extends StatefulWidget {
  int courseId;
  var courseName;

  CourseDetailsPage(this.courseId, this.courseName);

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  var courseDetailsViewContrller = Get.put(DetailsViewController());
  double padding = AppsSizeConfigs.defaultPadding;

  //Course Include Details
  Course? course;
  int? totalSection;
  int? totalLecture;
  int? totalDuration;
  int? totalHour;
  int? totalMinute;

  //Section View Variable
  List<bool> _isExpandedList = [];

  @override
  void initState() {
    super.initState();
    padding = padding + 2;
    // otherwise, retrieve the video ID from the first course in the list
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          Obx(() {
            if (courseDetailsViewContrller.isLoading == true) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
              );
            }
            course = courseDetailsViewContrller.course[0];
            totalSection = course?.courseIncludes.totalSection;
            totalLecture = course?.courseIncludes.totalVideo;
            totalDuration = course?.courseIncludes.courseDuration;
            totalHour = ((totalDuration! / 60) / 60).toInt();
            totalMinute = (totalDuration! % 60);
            print(totalHour);
            print(totalMinute);

            return Column(
              children: [
                //Youtube Preview Video Widget Here//
                Container(
                  child: YoutubePlayerWidget(
                    videoUrl: courseDetailsViewContrller.course[0].coverVideo,
                  ),
                ),
                //Course Name  Here
                Padding(
                  padding: EdgeInsets.fromLTRB(padding, padding, padding, 0),
                  child: Container(
                    child: Text(
                      courseDetailsViewContrller.course[0].name,
                      textScaleFactor: 1.5,
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                //Course Short Details Here
                Padding(
                  padding: EdgeInsets.fromLTRB(padding, padding, padding, 0),
                  child: Container(
                    child: Text(
                      courseDetailsViewContrller.course[0].shortDescription,
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
                //What You Will Learn Section Started Here
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: Container(
                    //color: Colors.amberAccent,
                    child: WhatYouLearnWidget(
                      course: courseDetailsViewContrller.course[0],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(padding),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: LabelWidget(text: "Curriculum"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Container(
                            child: Text(
                              "${totalSection} section - ${totalLecture} lecture - ${totalHour}h ${totalMinute}min total length",
                              style: TextStyle(),
                              textScaleFactor: 1,
                            ),
                          ),
                        ),
                        Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: course!.curriculum.sections.length,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Section ${index + 1} - ${course!.curriculum.sections[index].sectionName} ",
                                          textScaleFactor: 1.2,
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _isExpandedList[index] =
                                                    !_isExpandedList[index];
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
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Text(course!
                                          .curriculum
                                          .sections[index]
                                          .lessons[0]
                                          .lessonName),
                                    ),
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 300,
                        ),
                        Container(
                          child: SectionViewWidget(course: course!),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
        ],
      ),
      bottomNavigationBar: Obx(
        () {
          if (courseDetailsViewContrller.isLoading == true) {
            return BottomBar(
              currency: "USD",
              price: 0,
              onEnrollPressed: () {},
            );
          }
          ;
          return BottomBar(
            currency: courseDetailsViewContrller.course[0].priceUnit,
            price: courseDetailsViewContrller.course[0].price,
            onEnrollPressed: () {
              print(courseDetailsViewContrller.course[0].whatYouLearn[0]);
            },
          );
        },
      ),
      extendBody: true,
    );
  }
}
