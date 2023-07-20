// ignore_for_file: library_private_types_in_public_api

part of widgets;

class PageHeader extends StatefulWidget {
  const PageHeader({
    Key? key,
    required this.headingText,
    required this.headingTextController,
  }) : super(key: key);

  final String headingText;
  final AnimationController headingTextController;

  @override
  _PageHeaderState createState() => _PageHeaderState();
}

class _PageHeaderState extends State<PageHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    animation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: const Offset(0, -0.5),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? headingStyle = textTheme.displayMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_40,
        Sizes.TEXT_SIZE_60,
      ),
    );
    return SizedBox(
      width: widthOfScreen(context),
      height: heightOfScreen(context),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              ImagePath.WAVE_CIRCLE,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              color: AppColors.white,
              height: assignHeight(context, 0.1),
              // width: 1000,
              child: SelectableText(
                // controller: widget.headingTextController,
                // text:
                 widget.headingText,
                style: headingStyle,
                // boxColor: AppColors.white,
                // coverColor: AppColors.white,
                // heightFactor: 0.1,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: Sizes.MARGIN_40),
              child: AnimatedSlideTranstion(
                controller: controller,
                position: animation,
                child: Image.asset(
                  ImagePath.ARROW_DOWN,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
