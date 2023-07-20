import 'package:evis/pages/news/widgets/news_card.dart';
import 'package:evis/values/values.dart';
import 'package:evis/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../core/layout/layout.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  static const String newsPageRoute = StringConst.NEWS_PAGE;

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _headingTextController;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
        vsync: this, duration: Animations.slideAnimationDurationShort);
    _headingTextController = AnimationController(
        vsync: this, duration: Animations.slideAnimationDurationShort);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _headingTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      selectedRoute: NewsPage.newsPageRoute,
      selectedPageName: StringConst.NEWS,
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
                EdgeInsets.symmetric(horizontal: assignWidth(context, 0.04)),
            child: Column(
              children: [
                PageHeader(
                  headingText: StringConst.NEWS,
                  headingTextController: _headingTextController,
                ),
                const SpaceH16(),
                NewsCard(width: assignWidth(context, 0.99) ,height: assignHeight(context, 0.9)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
