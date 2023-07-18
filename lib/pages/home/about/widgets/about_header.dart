import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../core/layout/layout.dart';
import '../../../../values/values.dart';
import '../../../../widgets/animatedWidgtes/animation.dart';
import '../../../../widgets/widgets.dart';

class AboutHeader extends StatelessWidget {
  const AboutHeader({
    Key? key,
    required this.width,
    required this.controller,
  }) : super(key: key);

  final double width;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    double spacing = responsiveSize(
      context,
      width * 0.15,
      width * 0.15,
      md: width * 0.05,
    );
    double imageWidthLg = responsiveSize(
      context,
      width * 0.3,
      width * 0.3,
      md: width * 0.4,
    );
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        if (screenWidth <= const RefinedBreakpoints().tabletSmall) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AboutDescription(
                controller: controller,
                width: widthOfScreen(context),
              ),
              const SpaceH30(),
              ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: SvgPicture.asset(
                  ImagePath.ORGANISATION_LOGO,
                  fit: BoxFit.cover,
                  width: widthOfScreen(context),
                  height: assignHeight(context, 0.45),
                ),
              ),
            ],
          );
        } else {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ContentArea(
                width: width * 0.55,
                child: AboutDescription(
                  controller: controller,
                  width: width * 0.55,
                ),
              ),
              SizedBox(
                width: spacing,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: imageWidthLg,
                  minWidth: imageWidthLg,
                  maxHeight: assignHeight(context, 0.45),
                ),
                child: SvgPicture.asset(
                  ImagePath.ORGANISATION_LOGO,
                  fit: BoxFit.cover,
                  height: assignHeight(context, 0.2),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class AboutDescription extends StatelessWidget {
  const AboutDescription({
    Key? key,
    required this.controller,
    required this.width,
  }) : super(key: key);

  final AnimationController controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyText1?.copyWith(
      fontSize: responsiveSize(context, 30, 44, md: 34),
      height: 1.2,
      fontWeight: FontWeight.w100,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedTextSlideBoxTransition(
          controller: controller,
          text: StringConst.ABOUT_ORG_CATCH_LINE_1,
          width: width,
          maxLines: 2,
          textStyle: style,
          boxColor: AppColors.transperent,
          coverColor: AppColors.transperent,
        ),
        const SpaceH8(),
        AnimatedTextSlideBoxTransition(
          controller: controller,
          text: StringConst.ABOUT_ORG_CATCH_LINE_1,
          width: width,
          maxLines: 3,
          // heightFactor: 2,
          boxColor: AppColors.transperent,
          coverColor: AppColors.transperent,
          textStyle: style,
        ),
        const SpaceH8(),
        AnimatedTextSlideBoxTransition(
          controller: controller,
          text: StringConst.ABOUT_ORG_CATCH_LINE_1,
          width: width,
          maxLines: 10,
          boxColor: AppColors.transperent,
          coverColor: AppColors.transperent,
          textStyle: style,
        ),
        const SpaceH8(),
        AnimatedTextSlideBoxTransition(
          controller: controller,
          text: StringConst.ABOUT_ORG_CATCH_LINE_1,
          width: width,
          boxColor: AppColors.transperent,
          coverColor: AppColors.transperent,
          maxLines: 10,
          textStyle: style,
        ),
      ],
    );
  }
}
