// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../core/layout/layout.dart';
import '../../../values/values.dart';
import '../../../widgets/animatedWidgtes/animation.dart';
import '../../../widgets/widgets.dart';

class ContactUsHeader extends StatefulWidget {
  ContactUsHeader({
    Key? key,
    required this.width,
    required this.controller,
  }) : super(key: key);

  final double width;
  final AnimationController controller;

  @override
  State<ContactUsHeader> createState() => _ContactUsHeaderState();
}

class _ContactUsHeaderState extends State<ContactUsHeader>
    with TickerProviderStateMixin {
  late AnimationController _contactUsController;

  @override
  void initState() {
    _contactUsController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _contactUsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double spacing = responsiveSize(
      context,
      widget.width * 0.15,
      widget.width * 0.15,
      md: widget.width * 0.05,
    );
    double imageWidthLg = responsiveSize(
      context,
      widget.width * 0.3,
      widget.width * 0.3,
      md: widget.width * 0.4,
    );
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyLarge?.copyWith(
      fontSize: responsiveSize(context, 30, 44, md: 34),
      height: 1.2,
      fontWeight: FontWeight.w100,
    );
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        if (screenWidth <= const RefinedBreakpoints().tabletSmall) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContactUsDescription(
                controller: widget.controller,
                width: widthOfScreen(context),
              ),
              // const SpaceH30(),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(80),
              //   child: SvgPicture.asset(
              //     ImagePath.ORGANISATION_LOGO,
              //     fit: BoxFit.cover,
              //     width: widthOfScreen(context),
              //     height: assignHeight(context, 0.1),
              //   ),
              // ),
            ],
          );
        } else {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: ContentArea(
                    width: widget.width * 0.55,
                    height: assignHeight(context, 0.1),
                    child: AnimatedTextSlideBoxTransition(
                      text: StringConst.CONTACT_US,
                      textStyle: style,
                      controller: _contactUsController,
                      heightFactor: 0.1,
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   width: spacing,
              // ),
              Expanded(
                flex: 1,
                child: SvgPicture.asset(
                  ImagePath.ORGANISATION_LOGO,
                  fit: BoxFit.contain,
                  // width: widthOfScreen(context) * 0.3,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class ContactUsDescription extends StatelessWidget {
  const ContactUsDescription({
    Key? key,
    required this.controller,
    required this.width,
  }) : super(key: key);

  final AnimationController controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyLarge?.copyWith(
      fontSize: responsiveSize(context, 30, 44, md: 34),
      height: 1.2,
      fontWeight: FontWeight.w100,
    );
    return SizedBox(
      height: assignHeight(context, 0.1),
      width: assignWidth(context, 0.9),
      child: AnimatedTextSlideBoxTransition(
        controller: controller,
        text: StringConst.CONTACT_US,
        width: width,
        maxLines: 2,
        heightFactor: .2,
        textStyle: style,
        boxColor: AppColors.transperent,
        coverColor: AppColors.transperent,
      ),
    );
  }
}
