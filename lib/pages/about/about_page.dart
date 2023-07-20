import 'package:evis/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../core/layout/layout.dart';
import '../../values/values.dart';
import '../../widgets/animatedWidgtes/animation.dart';
import 'widgets/about_header.dart';

class AboutPage extends StatefulWidget {
  static const String aboutPageRoute = StringConst.ABOUT_PAGE;
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
  GlobalKey key = GlobalKey();
  late AnimationController _controller;
  late AnimationController _technologyController;

  late AnimationController _technologyListController;

  late AnimationController _whoAreWeController;
  late AnimationController _whatWeDoController;
  late AnimationController _subSideriesController;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _technologyController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _technologyListController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _whoAreWeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _whatWeDoController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _subSideriesController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _technologyController.dispose();
    _technologyListController.dispose();
    _whoAreWeController.dispose();
    _whatWeDoController.dispose();
    _subSideriesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double contentAreaWidth = responsiveSize(
      context,
      assignWidth(context, 0.8),
      assignWidth(context, 0.75),
      sm: assignWidth(context, 0.8),
    );
    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.15),
      ),
      right: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.10),
        // sm: assignWidth(context, 0.10),
      ),
      top: responsiveSize(
        context,
        assignHeight(context, 0.15),
        assignHeight(context, 0.15),
        // sm: assignWidth(context, 0.10),
      ),
    );
    double widthOfBody = responsiveSize(
      context,
      assignWidth(context, 0.75),
      assignWidth(context, 0.5),
    );
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? bodyText1Style = textTheme.bodyLarge?.copyWith(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      height: 2.0,
      // letterSpacing: 2,
    );
    TextStyle? titleStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_20,
      ),
    );

    CurvedAnimation whoAreWeAnimation = CurvedAnimation(
      parent: _whoAreWeController,
      curve: const Interval(0.6, 1.0, curve: Curves.ease),
    );
    CurvedAnimation whatWeDoAnimation = CurvedAnimation(
      parent: _whatWeDoController,
      curve: const Interval(0.6, 1.0, curve: Curves.ease),
    );
    CurvedAnimation subSideriesAnimation = CurvedAnimation(
      parent: _subSideriesController,
      curve: const Interval(0.6, 1.0, curve: Curves.ease),
    );
    return PageWrapper(
      selectedRoute: AboutPage.aboutPageRoute,
      selectedPageName: StringConst.ABOUT_US,
      navBarAnimationController: _controller,
      onLoadingAnimationDone: () {
        _controller.forward();
      },
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          Padding(
            padding: padding,
            child: ContentArea(
              width: contentAreaWidth,
              child: Column(
                children: [
                  AboutHeader(
                    width: contentAreaWidth,
                    controller: _controller,
                    key: key,
                  ),

                  const CustomSpacer(heightFactor: 0.3),
                  VisibilityDetector(
                    key: const Key('who-are-we-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage >
                          responsiveSize(context, 30, 30, md: 40))   {
                        _whoAreWeController.forward();
                      }
                    },
                    child: ContentBuilder(
                      controller: _whoAreWeController,
                      number: "/01 ",
                      width: contentAreaWidth,
                      section: StringConst.WHO_ARE_WE_TITLE.toUpperCase(),
                      title: StringConst.WHO_ARE_WE_TITLE,
                      body: Column(
                        children: [
                          AnimatedPositionedText(
                            controller: whoAreWeAnimation,
                            width: widthOfBody,
                            // maxLines: 30,
                            // factor: 1.25,
                            text: StringConst.WHO_ARE_WE_LINE_1,
                            prefixtext: StringConst.SUB_TEXT_PREFIX,
                            textStyle: bodyText1Style,
                          ),
                          AnimatedPositionedText(
                            controller: whoAreWeAnimation,
                            width: widthOfBody,
                            // maxLines: 30,
                            text: StringConst.WHO_ARE_WE_LINE_2,
                            prefixtext: StringConst.SUB_TEXT_PREFIX,
                            textStyle: bodyText1Style,
                          ),
                          AnimatedPositionedText(
                            controller: whoAreWeAnimation,
                            width: widthOfBody,
                            // maxLines: 30,
                            text: StringConst.WHO_ARE_WE_LINE_3,
                            prefixtext: StringConst.SUB_TEXT_PREFIX,
                            textStyle: bodyText1Style,
                          ),
                          AnimatedPositionedText(
                            controller: whoAreWeAnimation,
                            width: widthOfBody,
                            // maxLines: 30,
                            text: StringConst.WHO_ARE_WE_LINE_4,
                            prefixtext: StringConst.SUB_TEXT_PREFIX,
                            textStyle: bodyText1Style,
                          ),
                          AnimatedPositionedText(
                            controller: whoAreWeAnimation,
                            width: widthOfBody,
                            maxLines: 30,
                            text: StringConst.WHO_ARE_WE_LINE_5,
                            prefixtext: StringConst.SUB_TEXT_PREFIX,
                            textStyle: bodyText1Style,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const CustomSpacer(heightFactor: 0.1),
                  VisibilityDetector(
                    key: const Key('what-are-we-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage >
                          responsiveSize(context, 30, 30, md: 40))  {
                        _whatWeDoController.forward();
                      }
                    },
                    child: ContentBuilder(
                      controller: _whatWeDoController,
                      number: "/02 ",
                      width: contentAreaWidth,
                      section: StringConst.WHAT_WE_DO_TITLE.toUpperCase(),
                      title: StringConst.WHAT_WE_DO_TITLE,
                      body: Column(
                        children: [
                          AnimatedPositionedText(
                            controller: whatWeDoAnimation,
                            width: widthOfBody,
                            maxLines: 30,
                            // factor: 1.25,
                            text: StringConst.WHAT_WE_DO_LINE_1,
                            prefixtext: StringConst.SUB_TEXT_PREFIX,
                            textStyle: bodyText1Style,
                          ),
                          AnimatedPositionedText(
                            controller: whatWeDoAnimation,
                            width: widthOfBody,
                            maxLines: 30,
                            text: StringConst.WHAT_WE_DO_LINE_2,
                            prefixtext: StringConst.SUB_TEXT_PREFIX,
                            textStyle: bodyText1Style,
                          ),
                          AnimatedPositionedText(
                            controller: whatWeDoAnimation,
                            width: widthOfBody,
                            maxLines: 30,
                            text: StringConst.WHAT_WE_DO_LINE_3,
                            prefixtext: StringConst.SUB_TEXT_PREFIX,
                            textStyle: bodyText1Style,
                          ),
                          AnimatedPositionedText(
                            controller: whatWeDoAnimation,
                            width: widthOfBody,
                            maxLines: 30,
                            text: StringConst.WHAT_WE_DO_LINE_4,
                            prefixtext: StringConst.SUB_TEXT_PREFIX,
                            textStyle: bodyText1Style,
                          ),
                          AnimatedPositionedText(
                            controller: whatWeDoAnimation,
                            width: widthOfBody,
                            maxLines: 30,
                            text: StringConst.WHAT_WE_DO_LINE_5,
                            prefixtext: StringConst.SUB_TEXT_PREFIX,
                            textStyle: bodyText1Style,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const CustomSpacer(heightFactor: 0.1),
                  VisibilityDetector(
                    key: const Key('sub-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage >
                          responsiveSize(context, 30, 30, md: 40))  {
                        _subSideriesController.forward();
                      }
                    },
                    child: ContentBuilder(
                      controller: _subSideriesController,
                      number: "/03 ",
                      width: contentAreaWidth,
                      section: StringConst.SUBSIDIARIES_TITLE.toUpperCase(),
                      title: StringConst.SUBSIDIARIES_TITLE,
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SpaceH20(),
                          AnimatedTextSlideBoxTransition(
                            controller: _subSideriesController,
                            text: StringConst.FIRST_SUBSIDIARIES_TITLE,
                            textStyle: titleStyle,
                          ),
                          const SpaceH16(),
                          AnimatedPositionedText(
                            controller: subSideriesAnimation,
                            width: widthOfBody,
                            maxLines: 30,
                            text: StringConst.FIRST_SUBSIDIARIES_LINE_1,
                            prefixtext: StringConst.SUB_TEXT_PREFIX,
                            textStyle: bodyText1Style,
                          ),
                          AnimatedPositionedText(
                            controller: subSideriesAnimation,
                            width: widthOfBody,
                            maxLines: 30,
                            text: StringConst.FIRST_SUBSIDIARIES_LINE_2,
                            prefixtext: StringConst.SUB_TEXT_PREFIX,
                            textStyle: bodyText1Style,
                          ),
                          const SpaceH40(),
                        ],
                      ),
                      footer: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedTextSlideBoxTransition(
                            controller: _subSideriesController,
                            text: StringConst.SECOND_SUBSIDIARIES_TITLE,
                            textStyle: titleStyle,
                          ),
                          const SpaceH16(),
                          AnimatedPositionedText(
                            controller: subSideriesAnimation,
                            width: widthOfBody,
                            maxLines: 30,
                            text: StringConst.SECOND_SUBSIDIARIES_LINE_1,
                            prefixtext: StringConst.SUB_TEXT_PREFIX,
                            textStyle: bodyText1Style,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const CustomSpacer(heightFactor: 0.1),
                ],
              ),
            ),
          ),
          const CustomSpacer(
            heightFactor: 0.1,
          ),
          const AnimatedFooter(),
        ],
      ),
    );
  }
}
