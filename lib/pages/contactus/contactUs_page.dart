// ignore_for_file: file_names

import 'package:evis/pages/contactus/widgets/contactUs_form.dart';
import 'package:evis/pages/contactus/widgets/contactUs_header.dart';
import 'package:evis/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../core/layout/layout.dart';
import '../../values/values.dart';

class ContactUsPage extends StatefulWidget {
  static const String contactPageRoute = StringConst.CONTACT_US_PAGE;
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage>
    with TickerProviderStateMixin {
  GlobalKey key = GlobalKey();
  late AnimationController _controller;
  late AnimationController _headinngTextController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _headinngTextController = AnimationController(
      duration: Animations.slideAnimationDurationLong,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _headinngTextController.dispose();
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

    return PageWrapper(
        selectedRoute: ContactUsPage.contactPageRoute,
        selectedPageName: StringConst.CONTACT_US,
        navBarAnimationController: _controller,
        onLoadingAnimationDone: () {
          _controller.forward();
        },
        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: assignWidth(context, 0.05)),
              child: Column(
                children: [
                  PageHeader(
                    headingText: StringConst.CONTACT_US,
                    headingTextController: _headinngTextController,
                  ),
                  ContactUsHeader(
                    width: contentAreaWidth,
                    controller: _headinngTextController,
                  ),
                  const ContactUsForm(),
                ],
              ),
            ),
            // const SpaceH30(),
            Container(
              color: AppColors.black,
              height: heightOfScreen(context) * 0.1,
              width: widthOfScreen(context),
              child: ResponsiveBuilder(
                builder: (context, sizingInformation) {
                  double screenWidth = sizingInformation.screenSize.width;
                  if (screenWidth <= const RefinedBreakpoints().tabletNormal) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SimpleFooterSm(),
                      ],
                    );
                  } else {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SimpleFooterLg(),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ));
  }
}
