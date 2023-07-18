
import 'package:evis/pages/home/home_page.dart';
import 'package:evis/routes/routes.dart';
import 'package:evis/values/values.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

void main() {
  runApp(const Evis());
}

class Evis extends StatelessWidget {
  const Evis({super.key});

  @override
  Widget build(BuildContext context) {
    return const Layout(child: MaterialApp(
      title: StringConst.APP_NAME,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      initialRoute: HomePage.homePageRoute,
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    ),);
  }
}
