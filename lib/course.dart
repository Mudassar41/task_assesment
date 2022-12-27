class Course {
  String title;
  bool isExpanded;

  final List<Module> moduleList;

  Course(this.title, this.moduleList, this.isExpanded);
}

class Module {
  String moduleTitle;
  List<Lesson> lessonList;
  bool isExpanded;

  Module(this.moduleTitle, this.lessonList, this.isExpanded);
}

class Lesson {
  String lessonTitle;

  List<Slide> slideList;
  bool isExpanded;

  Lesson(this.lessonTitle, this.slideList, this.isExpanded);
}

class Slide {
  String slideTitle;

  Slide(this.slideTitle);
}
