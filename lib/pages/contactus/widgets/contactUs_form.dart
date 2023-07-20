// ignore_for_file: file_names

import 'package:evis/core/layout/layout.dart';
import 'package:evis/values/values.dart';
import 'package:evis/widgets/animatedWidgtes/animation.dart';
import 'package:evis/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContactUsForm extends StatefulWidget {
  const ContactUsForm({super.key});

  @override
  State<ContactUsForm> createState() => _ContactUsFormState();
}

class _ContactUsFormState extends State<ContactUsForm>
    with TickerProviderStateMixin {
  late AnimationController _contactDetailsController;

  @override
  void initState() {
    // TODO: implement initState

    _contactDetailsController = AnimationController(
        vsync: this, duration: Animations.slideAnimationDurationShort);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _contactDetailsController.dispose();
    super.dispose();
  }

  TextStyle? titleStyle;
  TextStyle? subTitleStyle;
  TextStyle? subTextStyle;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    titleStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_28,
        Sizes.TEXT_SIZE_32,
      ),
      fontWeight: FontWeight.w600,
    );
    subTitleStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_20,
        Sizes.TEXT_SIZE_22,
      ),
      fontWeight: FontWeight.w600,
    );
    subTextStyle = textTheme.titleMedium?.copyWith(
        color: AppColors.black,
        fontSize: responsiveSize(
          context,
          Sizes.TEXT_SIZE_14,
          Sizes.TEXT_SIZE_16,
        ),
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.clip);
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        if (screenWidth <= const RefinedBreakpoints().tabletSmall) {
          return SizedBox(
            width: widthOfScreen(context) * 0.99,
            // height: heightOfScreen(context) * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: heightOfScreen(context) * 0.12,
                  child: columnOfTextField(StringConst.NAME),
                ),
                SizedBox(
                  height: heightOfScreen(context) * 0.12,
                  child: columnOfTextField(StringConst.EMAIL),
                ),
                SizedBox(
                  height: heightOfScreen(context) * 0.12,
                  child: columnOfTextField(StringConst.PHONE),
                ),
                SizedBox(
                    height: heightOfScreen(context) * 0.3,
                    child: columnOfTextFormField(StringConst.MESSAGE)),
              ],
            ),
          );
        } else {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                // width: assignWidth(context, 0.7),
                // height: heightOfScreen(context) * 0.4,
                // alignment: Alignment.centerRight,
                // color: AppColors.INSPECT_ASSIST,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        columnOfTextField(StringConst.NAME),
                        columnOfTextField(StringConst.EMAIL),
                        columnOfTextField(StringConst.PHONE),
                      ],
                    ),
                    const SpaceH16(),
                    SizedBox(
                      height: assignHeight(context, 0.35),
                      child: columnOfTextFormField(
                        StringConst.MESSAGE,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // color: AppColors.GREEN_LIGHT,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.WIDTH_16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   height: assignHeight(context, 0.06),
                      //   child: AnimatedTextSlideBoxTransition(
                      //     controller: _contactDetailsController,
                      //     text: StringConst.CONTACT_DETAILS,
                      //     heightFactor: 0.2,
                      //     textStyle: titleStyle,
                      //   ),
                      // ),
                      // SpaceH8(),
                      details(
                        header: StringConst.ADDRESS,
                        icon: Icons.home,
                        info: StringConst.ORG_ADDRESS,
                      ),
                      const SpaceH12(),
                      details(
                        header: StringConst.PHONE,
                        icon: Icons.phone_enabled_rounded,
                        info: StringConst.ORG_PHONE,
                      ),
                      const SpaceH12(),
                      details(
                        header: StringConst.EMAIL,
                        icon: Icons.email_outlined,
                        info: StringConst.ORG_EMAIL,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  details({String? header, IconData? icon, String? info}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header!,
          style: subTitleStyle,
        ),
        const SpaceH4(),
        Container(
          padding: EdgeInsets.only(top: assignHeight(context, 0.001)),
          // height: assignHeight(context, 0.02),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                icon,
                color: AppColors.primaryColor.withOpacity(0.7),
                // size: Sizes.HEIGHT_16,
              ),
              const SpaceW8(),
              SizedBox(
                width: assignWidth(context, 0.18),
                child: SelectableText(
                  info!,
                  style: subTextStyle,
                  // softWrap: true,
                  // maxLines: 4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  columnOfTextField(String? title) {
    return Flexible(
      // width: assignWidth(context, 0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.WIDTH_8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(title!),
            const SpaceH4(),
            const AnimatedTextField(),
          ],
        ),
      ),
    );
  }

  columnOfTextFormField(String? title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.WIDTH_8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(title!),
          const SpaceH4(),
          TextFormField(
            decoration: InputDecoration(
              // label: Container(),
              filled: true,
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(),
              enabledBorder: const UnderlineInputBorder(),
              fillColor: AppColors.primaryColor.withOpacity(0.1),
            ),
            maxLines: 7,
            // maxLength: 500,
            magnifierConfiguration:
                TextMagnifier.adaptiveMagnifierConfiguration,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
          ),
        ],
      ),
    );
  }
}
