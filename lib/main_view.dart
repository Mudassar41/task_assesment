// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_assesment/app_utills.dart';
import 'package:task_assesment/expansion_tile_component.dart';
import 'package:task_assesment/slide_component.dart';

class SideBarView extends StatefulWidget {
  const SideBarView({super.key});

  @override
  State<SideBarView> createState() => _SideBarViewState();
}

class _SideBarViewState extends State<SideBarView> {
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
                  itemCount: AppUtills.courseList.length,
                  itemBuilder: ((context, courseIdex) {
                    return Theme(
                      data: ThemeData()
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTileComponents(
                          icon: AppUtills.courseList[courseIdex].isExpanded
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_right,
                          expensionTitle:
                              '${AppUtills.courseList[courseIdex].title} ${courseIdex + 1}',
                          paddingLeft: 6,
                          onExpansionChanged: (val) {
                            setState(() {
                              AppUtills.courseList[courseIdex].isExpanded =
                                  !AppUtills.courseList[courseIdex].isExpanded;
                            });
                          },
                          //modules
                          childrens: AppUtills.courseList[courseIdex].moduleList
                              .map<Widget>(
                            (module) {
                              int moduleIndex = AppUtills
                                  .courseList[courseIdex].moduleList
                                  .indexOf(module);

                              return ExpansionTileComponents(
                                  icon: module.isExpanded
                                      ? Icons.keyboard_arrow_down
                                      : Icons.keyboard_arrow_right,
                                  expensionTitle:
                                      '${module.moduleTitle} ${moduleIndex + 1}',
                                  paddingLeft: 32,
                                  onExpansionChanged: (val) {
                                    setState(() {
                                      module.isExpanded = !module.isExpanded;
                                    });
                                  },
                                  //lessons
                                  childrens: AppUtills.courseList[courseIdex]
                                      .moduleList[moduleIndex].lessonList
                                      .map<Widget>(
                                    (lesson) {
                                      int lessonsIndex = AppUtills
                                          .courseList[courseIdex]
                                          .moduleList[moduleIndex]
                                          .lessonList
                                          .indexOf(lesson);

                                      return ExpansionTileComponents(
                                          icon: lesson.isExpanded
                                              ? Icons.keyboard_arrow_down
                                              : Icons.keyboard_arrow_right,
                                          expensionTitle:
                                              '${lesson.lessonTitle} ${lessonsIndex + 1}',
                                          paddingLeft: 64,
                                          onExpansionChanged: (val) {
                                            setState(() {
                                              lesson.isExpanded =
                                                  !lesson.isExpanded;
                                            });
                                          },
                                          childrens: AppUtills
                                              .courseList[courseIdex]
                                              .moduleList[moduleIndex]
                                              .lessonList[lessonsIndex]
                                              .slideList
                                              .map<Widget>((slide) {
                                            int slideIndex = AppUtills
                                                .courseList[courseIdex]
                                                .moduleList[moduleIndex]
                                                .lessonList[lessonsIndex]
                                                .slideList
                                                .indexOf(slide);
                                            return SlideComponent(
                                                slideTile: slide.slideTitle,
                                                slideIndex: slideIndex);
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
