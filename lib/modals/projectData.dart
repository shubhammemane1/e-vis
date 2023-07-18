// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../values/values.dart';

class ProjectItemData {
  ProjectItemData({
    required this.title,
    required this.image,
    required this.coverUrl,
    required this.subtitle,
    required this.portfolioDescription,
    required this.platform,
    required this.primaryColor,
    required this.category,
    this.designer,
    this.projectAssets = const [],
    this.imageSize,
    this.technologyUsed,
    this.isPublic = false,
    this.isOnPlayStore = false,
    this.isLive = false,
    this.gitHubUrl = "",
    this.hasBeenReleased = true,
    this.playStoreUrl = "",
    this.webUrl = "",
    this.navTitleColor = AppColors.grey600,
    this.navSelectedTitleColor = AppColors.black,
    this.appLogoColor = AppColors.black,
  });

  final Color primaryColor;
  final Color navTitleColor;
  final Color navSelectedTitleColor;
  final Color appLogoColor;
  final String image;
  final String coverUrl;
  final String category;
  final List<String> projectAssets;
  final String portfolioDescription;
  final double? imageSize;
  final String title;
  final String subtitle;
  final String platform;
  final String? designer;
  final bool isPublic;
  final bool hasBeenReleased;
  final String gitHubUrl;
  final bool isOnPlayStore;
  final String playStoreUrl;
  final bool isLive;
  final String webUrl;
  final String? technologyUsed;
}
