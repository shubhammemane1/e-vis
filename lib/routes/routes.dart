import 'package:evis/pages/contactus/contactUs_page.dart';
import 'package:evis/pages/news/news_page.dart';
import 'package:flutter/material.dart';

import '../pages/about/about_page.dart';
import '../pages/home/home_page.dart';

typedef PathWidgetBuilder = Widget Function(
    BuildContext, String? /*Map<String, String>*/);

class Path {
  const Path(this.pattern, this.builder);

  /// A RegEx string for route matching.
  final String pattern;

  final PathWidgetBuilder builder;
}

class RouteConfiguration {
  static List<Path> paths = [
    Path(
      r'^' + ContactUsPage.contactPageRoute,
      (context, matches) => const ContactUsPage(),
    ),
    Path(
      r'^' + AboutPage.aboutPageRoute,
      (context, matches) => const AboutPage(),
    ),
    Path(
      r'^' + NewsPage.newsPageRoute,
      (context, matches) => const NewsPage(),
    ),
    // Path(
    //   r'^' + WorksPage.worksPageRoute,
    //       (context, matches) => const WorksPage(),
    // ),
    // Path(
    //   r'^' + ProjectDetailPage.projectDetailPageRoute,
    //       (context, matches) => const ProjectDetailPage(),
    // ),
    // Path(
    //   r'^' + ExperiencePage.experiencePageRoute,
    //       (context, matches) => const ExperiencePage(),
    // ),
    // Path(
    //   r'^' + CertificationPage.certificationPageRoute,
    //       (context, matches) => const CertificationPage(),
    // ),
    Path(
      r'^' + HomePage.homePageRoute,
      (context, matches) => const HomePage(),
    ),
  ];

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    for (Path path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name!)) {
        final firstMatch = regExpPattern.firstMatch(settings.name!)!;
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;
        return NoAnimationMaterialPageRoute<void>(
          builder: (context) => path.builder(context, match),
          settings: settings,
        );
      }
    }
    // If no match is found, [WidgetsApp.onUnknownRoute] handles it.
    return null;
  }

  /// The route generator callback used when the app is navigated to a named
  /// route. Set it on the [MaterialApp.onGenerateRoute] or
  /// [WidgetsApp.onGenerateRoute] to make use of the [paths] for route
  /// matching.
//  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
//    for (final path in paths) {
//      final regExpPattern = RegExp(path.pattern);
//      if (regExpPattern.hasMatch(settings.name)) {
//        final match = regExpPattern.firstMatch(settings.name);
//        var groupNameToMatch = <String, String>{};
//        for (final groupName in match.groupNames) {
//          groupNameToMatch[groupName] = match.namedGroup(groupName);
//        }
//        print(groupNameToMatch);
//        print(path.pattern);
//        if (kIsWeb) {
//          return NoAnimationMaterialPageRoute<void>(
//            builder: (context) => path.builder(context, groupNameToMatch),
//            settings: settings,
//          );
//        }
//
//        return MaterialPageRoute<void>(
//          builder: (context) => path.builder(context, groupNameToMatch),
//          settings: settings,
//        );
//      }
//    }
//    // If no match was found, we let [WidgetsApp.onUnknownRoute] handle it.
//    return null;
//  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
