part of widgets;

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
    this.title = "E-VIS",
    this.titleColor = AppColors.black,
    this.titleStyle,
    this.fontSize = 60,
  }) : super(key: key);

  final String title;
  final TextStyle? titleStyle;
  final Color titleColor;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(ImagePath.ORGANISATION_LOGO,height: Sizes.HEIGHT_44,);

    // Image.asset(
    //   'assets/images/newevislogo1.png',
    //   height: 130,
    //   width: 130,
    // );
    //     Text(
    //   title,
    //   style: titleStyle ??
    //       textTheme.headline2?.copyWith(
    //         color: titleColor,
    //         fontSize: fontSize,
    //       ),
    //   textAlign: TextAlign.center,
    // );
  }
}
