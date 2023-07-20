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
    TextStyle? defaultNumberStyle = textTheme.bodyLarge?.copyWith(
      fontSize: Sizes.TEXT_SIZE_10,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      height: 2.0,
      letterSpacing: 2,
    );
    TextStyle? defaultSectionStyle = defaultNumberStyle?.copyWith(
      color: AppColors.grey600,
    );
    TextStyle? defaultTitleStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_20,
      ),
    );
    return SizedBox(
      width: width,
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;

          if (screenWidth <= const RefinedBreakpoints().tabletNormal) {
            return Column(
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
                    const SpaceW8(),
                    AnimatedTextSlideBoxTransition(
                      controller: controller,
                      text: section,
                      textStyle: sectionStyle ?? defaultSectionStyle,
                      // boxColor: AppColors.transperent,
                      // coverColor: AppColors.transperent,
                    ),
                  ],
                ),
                const SpaceH16(),
                heading ??
                    AnimatedTextSlideBoxTransition(
                      controller: controller,
                      text: title!,
                      textStyle: titleStyle ?? defaultTitleStyle,
                      boxColor: AppColors.transperent,
                      coverColor: AppColors.transperent,
                    ),
                const SpaceH30(),
                body,
                footer ?? const Empty(),
              ],
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
                      const SpaceW16(),
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
                const SpaceW40(),
                SizedBox(
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
                      const SpaceH20(),
                      body,
                      footer ?? const Empty(),
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
