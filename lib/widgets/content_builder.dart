part  of widgets;

class ContentBuilder extends StatelessWidget {
  const ContentBuilder({
    Key? key,
    required this.width,
    required this.number,
    required this.section,
    required this.body,
    required this.controller,
    this.title = '',
    this.numberStyle,
    this.sectionStyle,
    this.titleStyle,
    this.heading,
    this.footer,
  }) : super(key: key);

  final double width;
  final AnimationController controller;
  final String number;
  final String section;
  final String? title;
  final TextStyle? numberStyle;
  final TextStyle? sectionStyle;
  final TextStyle? titleStyle;
  final Widget? heading;
  final Widget body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? defaultNumberStyle = textTheme.bodyText1?.copyWith(
      fontSize: Sizes.TEXT_SIZE_10,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      height: 2.0,
      letterSpacing: 2,
    );
    TextStyle? defaultSectionStyle = defaultNumberStyle?.copyWith(
      color: AppColors.grey600,
    );
    TextStyle? defaultTitleStyle = textTheme.subtitle1?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_20,
      ),
    );
    return Container(
      width: width,
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;

          if (screenWidth <= RefinedBreakpoints().tabletNormal) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedTextSlideBoxTransition(
                        controller: controller,
                        text: number,
                        textStyle: numberStyle ?? defaultNumberStyle,
                        // boxColor: AppColors.transperent,
                        // coverColor: AppColors.transperent,
                      ),
                      SpaceW8(),
                      AnimatedTextSlideBoxTransition(
                        controller: controller,
                        text: section,
                        textStyle: sectionStyle ?? defaultSectionStyle,
                        // boxColor: AppColors.transperent,
                        // coverColor: AppColors.transperent,
                      ),
                    ],
                  ),
                  SpaceH16(),
                  heading ??
                      AnimatedTextSlideBoxTransition(
                        controller: controller,
                        text: title!,
                        textStyle: titleStyle ?? defaultTitleStyle,
                        boxColor: AppColors.transperent,
                        coverColor: AppColors.transperent,
                      ),
                  SpaceH30(),
                  body,
                  footer ?? Empty(),
                ],
              ),
            );
          } else {
            return Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedTextSlideBoxTransition(
                        controller: controller,
                        text: number,
                        textStyle: numberStyle ?? defaultNumberStyle,
                        // boxColor: AppColors.transperent,
                        // coverColor: AppColors.transperent,
                      ),
                      SpaceW16(),
                      Expanded(
                        child:  AnimatedTextSlideBoxTransition(
                        controller: controller,
                        text: section,
                        textStyle: sectionStyle ?? defaultSectionStyle,
                        // boxColor: AppColors.transperent,
                        // coverColor: AppColors.transperent,
                      ),
                      ),
                    ],
                  ),
                ),
                SpaceW40(),
                Container(
                  width: width * 0.80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      heading ??
                          AnimatedTextSlideBoxTransition(
                        controller: controller,
                        text: title!,
                        textStyle: titleStyle ?? defaultTitleStyle,
                        boxColor: AppColors.transperent,
                        coverColor: AppColors.transperent,
                      ),
                      SpaceH20(),
                      body,
                      footer ?? Empty(),
                    ],
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
