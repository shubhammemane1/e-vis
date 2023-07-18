import 'package:evis/pages/home/widget/home_page_header.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../core/layout/layout.dart';
import '../../modals/projectData.dart';
import '../../values/values.dart';
import '../../widgets/animatedWidgtes/animation.dart';
import '../../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  static const String homePageRoute = StringConst.HOME_PAGE;

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  GlobalKey key = GlobalKey();
  late AnimationController _slideTextController;
  late AnimationController _recentWorksController;

  @override
  void initState() {
    // _arguments = NavigationArguments();
    // _viewProjectsController = AnimationController(
    //   vsync: this,
    //   duration: Duration(milliseconds: 300),
    // );
    _slideTextController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );
    _recentWorksController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _slideTextController.dispose();
    _recentWorksController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double projectItemHeight = assignHeight(context, 0.4);
    double subHeight = (3 / 4) * projectItemHeight;
    double extra = projectItemHeight - subHeight;
    TextTheme textTheme = Theme.of(context).textTheme;
    EdgeInsets margin = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.15),
        sm: assignWidth(context, 0.15),
      ),
    );
    return PageWrapper(
        selectedRoute: HomePage.homePageRoute,
        selectedPageName: StringConst.HOME_PAGE,
        navBarAnimationController: _slideTextController,
        child: ListView(
          children: [
            HomePageHeader(
              controller: _slideTextController,
              scrollToWorksKey: key,
            ),
            Container( color: AppColors.white,child: const CustomSpacer(heightFactor: 0.1,)),
            Container(
              color: AppColors.white,
              child: VisibilityDetector(
                key: const Key('recent-projects'),
                onVisibilityChanged: (visibilityInfo) {
                  double visiblePercentage = visibilityInfo.visibleFraction * 100;
                  if (visiblePercentage > 45) {
                    _recentWorksController.forward();
                  }
                },
                child: Container(
                  key: key,
                  margin: margin.copyWith(
                    top: 0
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedTextSlideBoxTransition(
                        controller: _recentWorksController,
                        text: StringConst.CRAFTED_WITH_INNOVATION,
                        coverColor: AppColors.white,
                        textStyle: textTheme.headlineMedium?.copyWith(
                          color: AppColors.black,
                          fontSize: responsiveSize(context, 30, 48, md: 40, sm: 36),
                          height: 2.0,
                        ),
                      ),
                      const SpaceH16(),
                      AnimatedPositionedText(
                        controller: CurvedAnimation(
                          parent: _recentWorksController,
                          curve: const Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
                        ),
                        text: StringConst.SELECTION,
                        textStyle: textTheme.bodyLarge?.copyWith(
                          fontSize: responsiveSize(
                            context,
                            Sizes.TEXT_SIZE_16,
                            Sizes.TEXT_SIZE_18,
                          ),
                          height: 2,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container( color: AppColors.white,child: const CustomSpacer(heightFactor: 0.1,)),
            ResponsiveBuilder(
              builder: (context, sizingInformation) {
                double screenWidth = sizingInformation.screenSize.width;

                if (screenWidth <= const RefinedBreakpoints().tabletSmall) {
                  return Column(
                    children: _buildProjectsForMobile(
                      data: Data.recentWorks,
                      projectHeight: projectItemHeight.toInt(),
                      subHeight: subHeight.toInt(),
                    ),
                  );
                } else {
                  return SizedBox(
                    height: (subHeight * (Data.recentWorks.length)) + extra,
                    child: Stack(
                      children: _buildRecentProjects(
                        data: Data.recentWorks,
                        projectHeight: projectItemHeight.toInt(),
                        subHeight: subHeight.toInt(),
                      ),
                    ),
                  );
                }
              },
            ),
            const CustomSpacer(heightFactor: 0.15),
            const AnimatedFooter(),
          ],
        ));
  }


  List<Widget> _buildRecentProjects({
    required List<ProjectItemData> data,
    required int projectHeight,
    required int subHeight,
  }) {
    List<Widget> items = [];
    int margin = subHeight * (data.length - 1);
    for (int index = data.length - 1; index >= 0; index--) {
      items.add(
        Container(
          margin: EdgeInsets.only(top: margin.toDouble()),
          child: ProjectItemLg(
            projectNumber: index + 1 > 3
                ? "${index + 1}"
                : "0${index + 1}", //for the prefix 0 samore
            imageUrl: data[index].image,
            projectItemheight: projectHeight.toDouble(),
            subheight: subHeight.toDouble(),
            backgroundColor: AppColors.accentColor2.withOpacity(0.35),
            title: data[index].title.toUpperCase(),
            subtitle: data[index].category,
            containerColor: data[index].primaryColor,
            onTap: () {
              // Functions.navigateToProject(
              //   context: context,
              //   dataSource: data,
              //   currentProject: data[index],
              //   currentProjectIndex: index,
              // );
            },
          ),
        ),
      );
      margin -= subHeight;
    }
    return items;
  }

  List<Widget> _buildProjectsForMobile({
    required List<ProjectItemData> data,
    required int projectHeight,
    required int subHeight,
  }) {
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        ProjectItemSm(
          projectNumber: index + 1 > 3 ? "${index + 1}" : "0${index + 1}",
          imageUrl: data[index].image,
          title: data[index].title.toLowerCase(),
          subtitle: data[index].category,
          containerColor: data[index].primaryColor,
          onTap: () {
            // Functions.navigateToProject(
            //   context: context,
            //   dataSource: data,
            //   currentProject: data[index],
            //   currentProjectIndex: index,
            // );
          },
        ),
      );
      items.add(const CustomSpacer(
        heightFactor: 0.10,
      ));
    }
    return items;
  }
}
