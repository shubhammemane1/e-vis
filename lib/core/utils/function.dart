
import 'package:flutter/material.dart';

class Functions {
  // static void launchUrl(String url) async {
  //   await launch(url);
  // }

  static Size textSize({
    required String text,
    required TextStyle? style,
    int maxLines = 1,
    double maxWidth = double.infinity,
  }) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: maxLines,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: maxWidth);
    return textPainter.size;
  }

  // static void navigateToProject({
  //   required BuildContext context,
  //   required List<ProjectItemData> dataSource,
  //   required ProjectItemData currentProject,
  //   required int currentProjectIndex,
  // }) {
  //   ProjectItemData? nextProject;
  //   bool hasNextProject;
  //   if ((currentProjectIndex + 1) > (dataSource.length - 1)) {
  //     hasNextProject = false;
  //   } else {
  //     hasNextProject = true;
  //     nextProject = dataSource[currentProjectIndex + 1];
  //   }
  //   Navigator.of(context).pushNamed(
  //     ProjectDetailPage.projectDetailPageRoute,
  //     arguments: ProjectDetailArguments(
  //       dataSource: dataSource,
  //       currentIndex: currentProjectIndex,
  //       data: currentProject,
  //       nextProject: nextProject,
  //       hasNextProject: hasNextProject,
  //     ),
  //   );
  // }
}
