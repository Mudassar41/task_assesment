// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_assesment/course.dart';

class SideBarView extends StatefulWidget {
  const SideBarView({super.key});

  @override
  State<SideBarView> createState() => _SideBarViewState();
}

class _SideBarViewState extends State<SideBarView> {
  var sideBarList = [
    Course(
        'Course',
        [
          //<--------------Module 1 Start----------->
          Module(
              'Module',
              [
                Lesson('Lesson', [Slide('Slide'), Slide('Slide')], false)
              ],
              false),
          //<--------------Module 1 End----------->
          //<--------------Module 2 Start----------->
          Module(
              'Module',
              [
                Lesson('Lesson', [Slide('Slide'), Slide('Slide')], false)
              ],
              false),

          //<--------------Module 2 End---------------------->
          //<--------------Module 3 Start----------->
          Module(
              'Module',
              [
                Lesson('Lesson', [Slide('Slide'), Slide('Slide')], false)
              ],
              false),

          //<--------------Module 3 End---------------------->
          //<--------------Module 4 Start----------->
          Module(
              'Module',
              [
                Lesson('Lesson', [Slide('Slide'), Slide('Slide')], false)
              ],
              false),
          //<--------------Module 4 End---------------------->
        ],
        false),

    //<----------------Course 1 End-------------------->
    //<------------------------------------------------>

    //<----------------Course 2 Start -------------------->

    Course(
        'Course',
        [
          //<--------------Module 1 Start----------->
          Module(
              'Module',
              [
                Lesson('Lesson', [Slide('Slide'), Slide('Slide')], false)
              ],
              false),
          //<--------------Module 1 End----------->
          //<--------------Module 2 Start----------->
          Module(
              'Module',
              [
                Lesson('Lesson', [Slide('Slide'), Slide('Slide')], false)
              ],
              false),

          //<--------------Module 2 End---------------------->
          //<--------------Module 3 Start----------->
          Module(
              'Module',
              [
                Lesson('Lesson', [Slide('Slide'), Slide('Slide')], false)
              ],
              false),

          //<--------------Module 3 End---------------------->
          //<--------------Module 4 Start----------->
          Module(
              'Module',
              [
                Lesson('Lesson', [Slide('Slide'), Slide('Slide')], false)
              ],
              false),
          //<--------------Module 4 End---------------------->
        ],
        false),
    //<----------------Course 2 End -------------------->

    //<----------------Course 3 Start -------------------->

    Course(
        'Course',
        [
          //<--------------Module 1 Start----------->
          Module(
              'Module',
              [
                Lesson('Lesson', [Slide('Slide'), Slide('Slide')], false)
              ],
              false),
          //<--------------Module 1 End----------->
          //<--------------Module 2 Start----------->
          Module(
              'Module',
              [
                Lesson('Lesson', [Slide('Slide'), Slide('Slide')], false)
              ],
              false),

          //<--------------Module 2 End---------------------->
          //<--------------Module 3 Start----------->
          Module(
              'Module',
              [
                Lesson('Lesson', [Slide('Slide'), Slide('Slide')], false)
              ],
              false),

          //<--------------Module 3 End---------------------->
          //<--------------Module 4 Start----------->
          Module(
              'Module',
              [
                Lesson('Lesson', [Slide('Slide'), Slide('Slide')], false)
              ],
              false),
          //<--------------Module 4 End---------------------->
        ],
        false),

    //<----------------Course 3 End -------------------->

    //<----------------Course 4 Start -------------------->
    Course(
        'Course',
        [
          //<--------------Module 1 Start----------->
          Module(
              'Module',
              [
                Lesson('Lesson', [Slide('Slide'), Slide('Slide')], false)
              ],
              false),
          //<--------------Module 1 End----------->
          //<--------------Module 2 Start----------->
          Module(
              'Module',
              [
                Lesson('Lesson', [Slide('Slide'), Slide('Slide')], false)
              ],
              false),

          //<--------------Module 2 End---------------------->
          //<--------------Module 3 Start----------->
          Module(
              'Module',
              [
                Lesson('Lesson', [Slide('Slide'), Slide('Slide')], false)
              ],
              false),

          //<--------------Module 3 End---------------------->
          //<--------------Module 4 Start----------->
          Module(
              'Module',
              [
                Lesson('Lesson', [Slide('Slide'), Slide('Slide')], false)
              ],
              false),
          //<--------------Module 4 End---------------------->
        ],
        false),

    //<----------------Course 4 End -------------------->
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                  itemCount: sideBarList.length,
                  itemBuilder: ((context, courseIdex) {
                    return Theme(
                      data: ThemeData()
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                          tilePadding: EdgeInsets.only(left: 6),
                          maintainState: true,
                          leading: Icon(
                            sideBarList[courseIdex].isExpanded
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_right,
                          ),
                          onExpansionChanged: (value) {
                            setState(() {
                              sideBarList[courseIdex].isExpanded =
                                  !sideBarList[courseIdex].isExpanded;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(
                            '${sideBarList[courseIdex].title} ${courseIdex + 1}',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w500),
                          ),
                          //modules
                          children:
                              sideBarList[courseIdex].moduleList.map<Widget>(
                            (module) {
                              int moduleIndex = sideBarList[courseIdex]
                                  .moduleList
                                  .indexOf(module);

                              return ExpansionTile(
                                  leading: Icon(
                                    module.isExpanded
                                        ? Icons.keyboard_arrow_down
                                        : Icons.keyboard_arrow_right,
                                  ),
                                  onExpansionChanged: (value) {
                                    setState(() {
                                      module.isExpanded = !module.isExpanded;
                                    });
                                  },
                                  tilePadding: EdgeInsets.only(left: 32),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  title: Text(
                                    '${module.moduleTitle}  ${moduleIndex + 1} ',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  //lessons
                                  children: sideBarList[courseIdex]
                                      .moduleList[moduleIndex]
                                      .lessonList
                                      .map<Widget>(
                                    (lesson) {
                                      int lessonsIndex = sideBarList[courseIdex]
                                          .moduleList[moduleIndex]
                                          .lessonList
                                          .indexOf(lesson);
                                      return ExpansionTile(
                                          onExpansionChanged: (value) {
                                            setState(() {
                                              lesson.isExpanded =
                                                  !lesson.isExpanded;
                                            });
                                          },
                                          leading: Icon(
                                            lesson.isExpanded
                                                ? Icons.keyboard_arrow_down
                                                : Icons.keyboard_arrow_right,
                                          ),
                                          tilePadding:
                                              EdgeInsets.only(left: 64),
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          title: Text(
                                            '${lesson.lessonTitle} ${lessonsIndex + 1}',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          children: sideBarList[courseIdex]
                                              .moduleList[moduleIndex]
                                              .lessonList[lessonsIndex]
                                              .slideList
                                              .map<Widget>((slide) {
                                            int slideIndex =
                                                sideBarList[courseIdex]
                                                    .moduleList[moduleIndex]
                                                    .lessonList[lessonsIndex]
                                                    .slideList
                                                    .indexOf(slide);
                                            return Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 140,
                                                    top: 8,
                                                    bottom: 8),
                                                child: Text(
                                                    '${slide.slideTitle} ${slideIndex + 1}'),
                                              ),
                                            );
                                          }).toList());
                                    },
                                  ).toList());
                            },
                          ).toList()),
                    );
                  })),
            ),
          ),
          Expanded(
              flex: 8,
              child: Container(
                color: Colors.white24,
              ))
        ],
      ),
    );
  }
}
