import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

double widthOfScreen(BuildContext context){
  return MediaQuery.of(context).size.width;
}
double heightOfScreen(BuildContext context){
  return MediaQuery.of(context).size.height;
}

double responsiveSize(
    BuildContext context,
    double xs,
    double lg, {
      double? sm,
      double? md,
      double? xl,
    }) {
  return context.layout.value(
    xs: xs,
    sm: sm ?? (md ?? xs), //assign md to sm if it is not null, if null assign xs
    md: md ?? lg,
    lg: lg,
    xl: xl ?? lg,
  );
}


double assignHeight(
    BuildContext context,
    double fraction, {
      double additions = 0,
      double subs = 0,
    }) {
  return (heightOfScreen(context) - (subs) + (additions)) * fraction;
}

//
double assignWidth(
    BuildContext context,
    double fraction, {
      double additions = 0,
      double subs = 0,
    }) {
  return (widthOfScreen(context) - (subs) + (additions)) * fraction;
}