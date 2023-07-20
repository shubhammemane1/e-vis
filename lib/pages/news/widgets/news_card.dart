import 'package:evis/core/layout/layout.dart';
import 'package:evis/values/values.dart';
import 'package:evis/widgets/animatedWidgtes/animation.dart';
import 'package:evis/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    this.height,
    this.width,
    this.backgroundColor = AppColors.black,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_28,
        Sizes.TEXT_SIZE_32,
      ),
      fontWeight: FontWeight.w600,
    );
    TextStyle? subTitleStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_18,
      ),
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
    );
    TextStyle? subTextStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_12,
        Sizes.TEXT_SIZE_14,
      ),
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.clip,
    );

    return Container(
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          if (screenWidth <= const RefinedBreakpoints().tabletNormal) {
            return ListView.builder(
              itemCount: 6,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const NewsCardSm();
              },
            );
          } else {
            return GridView.builder(
              itemCount: 6,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 8 / 3.5,
                crossAxisSpacing: Sizes.HEIGHT_30,
                mainAxisSpacing: Sizes.HEIGHT_10,
              ),
              itemBuilder: (context, index) {
                return const NewsCardLg();
              },
            );
          }
        },
      ),
    );
  }
}

class NewsCardLg extends StatelessWidget {
  const NewsCardLg({super.key});
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_28,
        Sizes.TEXT_SIZE_32,
      ),
      fontWeight: FontWeight.w600,
    );
    TextStyle? subTitleStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_18,
      ),
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
    );
    TextStyle? subTextStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_12,
        Sizes.TEXT_SIZE_14,
      ),
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.clip,
    );
    return Stack(
      fit: StackFit.passthrough,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Card(
              elevation: 5,
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                topLeft: Radius.circular(15),
                topRight: Radius.circular(0),
                bottomRight: Radius.circular(0),
              )),
              child: Stack(
                children: [
                  Container(
                    width: widthOfScreen(context) * 0.3,
                    height: heightOfScreen(context) * 0.3,
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                      image: DecorationImage(
                          image: AssetImage(ImagePath.INSPECT_ASSIST),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Sizes.HEIGHT_30),
                    decoration: BoxDecoration(
                      color: AppColors.GREEN_LIGHT,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.HEIGHT_16,
                      vertical: Sizes.HEIGHT_8,
                    ),
                    child: SelectableText(
                      "19 july 2023",
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ],
              )),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            color: AppColors.white,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.35,
              // color: AppColors.grey100.withOpacity(0.5),
              padding: const EdgeInsets.symmetric(horizontal: Sizes.WIDTH_8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SpaceH20(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: SelectableText(
                      "NORTHERN GRAMPIANS GO DIGITAL WITH GREENLIGHT OPMcghdghmndghmjfcgh",
                      style: subTitleStyle,
                      // maxLines: 2,
                    ),
                  ),
                  const SpaceH12(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: SelectableText(
                      "Northern Grampians Embraces Digital Transformation for Building and Planning Permits with zdfbsdfbsnbbzdf vjszdfhbv szkdjfbgkdfbjvszdkfljbvzdfkbvzdfkjjbkdjfjvbkzdsjfbvkjdfbvkjdfbnvkjszdfbbkjvszdxfbjknGreenLight OPM",
                      style: subTextStyle,
                      maxLines: 6,
                    ),
                  ),
                  Container(
                    // width: MediaQuery.of(context).size.width * 0.2,
                    padding:
                        const EdgeInsets.symmetric(horizontal: Sizes.WIDTH_8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SelectableText("19 july 2023"),
                        AnimatedBubbleButton(
                          title: StringConst.GET_IN_TOUCH,
                          titleStyle: const TextStyle(
                              // color: AppColors.grey100,
                              ),
                          color: AppColors.GREEN_LIGHT.withOpacity(0.5),
                          // onTap: () {
                          //   Navigator.pushNamed(
                          //       context, ContactUsPage.contactPageRoute);
                          // },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NewsCardSm extends StatelessWidget {
  const NewsCardSm({super.key});
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_28,
        Sizes.TEXT_SIZE_32,
      ),
      fontWeight: FontWeight.w600,
    );
    TextStyle? subTitleStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_18,
      ),
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
    );
    TextStyle? subTextStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_12,
        Sizes.TEXT_SIZE_14,
      ),
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.clip,
    );
    return Container(
      width: widthOfScreen(context) * 0.9,
      margin: EdgeInsets.symmetric(vertical: Sizes.HEIGHT_8),
      // color: AppColors.INSPECT_ASSIST,
      child: Row(
        // fit: StackFit.expand,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 5,
            margin: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topLeft: Radius.circular(15),
            )),
            child: Container(
              width: widthOfScreen(context) * 0.4,
              height: heightOfScreen(context) * 0.3,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                image: DecorationImage(
                    image: AssetImage(ImagePath.GREEN_LIGHT),
                    fit: BoxFit.cover),
              ),
              // child: Image.asset(
              //   ImagePath.GREEN_LIGHT,
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              color: AppColors.white,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.4,
                // color: AppColors.grey100.withOpacity(0.5),
                padding: const EdgeInsets.symmetric(horizontal: Sizes.WIDTH_8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SpaceH20(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: SelectableText(
                        "NORTHERN GRAMPIANS GO DIGITAL WITH GREENLIGHT OPMcghdghmndghmjfcgh",
                        style: subTitleStyle,
                        maxLines: 2,
                      ),
                    ),
                    const SpaceH8(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: SelectableText(
                        "Northern Grampians Embraces Digital Transformation for Building and Planning Permits with zdfbsdfbsnbbzdf vjszdfhbv szkdjfbgkdfbjvszdkfljbvzdfkbvzdfkjjbkdjfjvbkzdsjfbvkjdfbvkjdfbnvkjszdfbbkjvszdxfbjknGreenLight OPM",
                        style: subTextStyle,
                        maxLines: 6,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SelectableText("19 july 2023"),
                        SpaceH4(),
                        AnimatedBubbleButton(
                          title: StringConst.GET_IN_TOUCH,
                          titleStyle: const TextStyle(
                              // color: AppColors.grey100,
                              ),
                          color: AppColors.GREEN_LIGHT.withOpacity(0.5),
                          // onTap: () {
                          //   Navigator.pushNamed(
                          //       context, ContactUsPage.contactPageRoute);
                          // },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
