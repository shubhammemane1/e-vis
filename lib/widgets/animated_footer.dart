// ignore_for_file: library_private_types_in_public_api

part of widgets;

class AnimatedFooter extends StatefulWidget {
  const AnimatedFooter({
    Key? key,
    this.height,
    this.width,
    this.backgroundColor = AppColors.black,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color backgroundColor;

  @override
  _AnimatedFooterState createState() => _AnimatedFooterState();
}

class _AnimatedFooterState extends State<AnimatedFooter>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double circleImageSize = responsiveSize(context, 100, 150);
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyLarge?.copyWith(
      color: AppColors.accentColor,
      fontSize: Sizes.TEXT_SIZE_14,
    );
    TextStyle? titleStyle = textTheme.headlineMedium?.copyWith(
      color: AppColors.accentColor,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_30,
        Sizes.TEXT_SIZE_60,
        md: Sizes.TEXT_SIZE_50,
      ),
    );
    TextStyle? subtitleStyle = style?.copyWith(
      color: AppColors.grey550,
      fontSize: Sizes.TEXT_SIZE_18,
      fontWeight: FontWeight.w400,
    );

    return Container(
      width: widget.width ?? widthOfScreen(context),
      height: widget.height ?? assignHeight(context, 0.8),
      color: widget.backgroundColor,
      child: VisibilityDetector(
        key: const Key('animated-footer'),
        onVisibilityChanged: (visibilityInfo) {
          double visiblePercentage = visibilityInfo.visibleFraction * 100;
          if (visiblePercentage > 25) {
            controller.forward();
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            SizedBox(
              height: circleImageSize,
              child: Stack(
                children: [
                  Positioned(
                    right: responsiveSize(
                      context,
                      assignWidth(context, 0.15),
                      assignWidth(context, 0.25),
                      md: assignWidth(context, 0.15),
                    ),
                    child: AnimatedPositionedWidget(
                      controller: CurvedAnimation(
                        parent: controller,
                        curve: Curves.fastOutSlowIn,
                      ),
                      width: circleImageSize,
                      height: circleImageSize,
                      child: Image.asset(
                        ImagePath.PATTERN_CIRCLE,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: AnimatedPositionedText(
                      text: StringConst.ORG_DESC,
                     
                      textAlign: TextAlign.center,
                      textStyle: titleStyle,
                      controller: CurvedAnimation(
                        parent: controller,
                        curve: Curves.fastOutSlowIn,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            AnimatedPositionedText(
              text: StringConst.ABOUT_US_DESC,
              textAlign: TextAlign.center,
              textStyle: subtitleStyle,
              factor: 4.0,
              controller: CurvedAnimation(
                parent: controller,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            const SpaceH40(),
            AnimatedBubbleButton(
              title: StringConst.GET_IN_TOUCH,
              onTap: () {
                Navigator.pushNamed(context, ContactUsPage.contactPageRoute);
              },
            ),
            // const Spacer(flex: 3),
            // AnimatedPositionedText(
            //   text: StringConst.COPYRIGHT,
            //   textAlign: TextAlign.center,
            //   textStyle: subtitleStyle,
            //   factor: 2.0,
            //   controller: CurvedAnimation(
            //     parent: controller,
            //     curve: Curves.fastOutSlowIn,
            //   ),
            // ),
            const Spacer(flex: 2),
            ResponsiveBuilder(
              builder: (context, sizingInformation) {
                double screenWidth = sizingInformation.screenSize.width;
                if (screenWidth <= const RefinedBreakpoints().tabletNormal) {
                  return const Column(
                    children: [
                      SimpleFooterSm(),
                    ],
                  );
                } else {
                  return const Column(
                    children: [
                      SimpleFooterLg(),
                    ],
                  );
                }
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}


