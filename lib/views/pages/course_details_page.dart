import 'package:excess_edu/consts/colors.dart';
import 'package:excess_edu/consts/sizes.dart';
import 'package:excess_edu/views/widgets/course_details/curriculam_view_widget.dart';
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
  bool isLoading1 = true;
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

            return Column(
              children: [
                //Youtube Preview Video Widget Here
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
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.amber,
                    child: CurriculumViewWidget(
                        course: courseDetailsViewContrller.course[0]),
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
