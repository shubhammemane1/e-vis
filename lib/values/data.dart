// ignore_for_file: non_constant_identifier_names

part of values;
class Data {
  static List<NavItemData> menuItems = [
    NavItemData(name: StringConst.HOME, route: StringConst.HOME_PAGE),
    NavItemData(name: StringConst.ABOUT, route: StringConst.ABOUT_PAGE),
    NavItemData(name: StringConst.WORKS, route: StringConst.WORKS_PAGE),
    // NavItemData(
    //   name: StringConst.EXPERIENCE,
    //   route: StringConst.EXPERIENCE_PAGE,
    // ),
    // NavItemData(
    //   name: StringConst.CERTIFICATIONS,
    //   route: StringConst.CERTIFICATION_PAGE,
    // ),
    // NavItemData(name: StringConst.CONTACT, route: StringConst.CONTACT_PAGE),
  ];

  static List<ProjectItemData> recentWorks = [
    Projects.INSPECT_ASSIST,
    Projects.GREEN_LIGHT,
    Projects.PERMA_ASSIST,
    // Projects.ROAM,
    // Projects.LOGIN_CATALOG,
    // Projects.FOODY_BITE,
    // Projects.NIMBUS,
  ];
}


class Projects {
  static ProjectItemData INSPECT_ASSIST = ProjectItemData(
    title: StringConst.INSPECT_ASSIST,
    subtitle: StringConst.INSPECT_ASSIST,
    platform: StringConst.INSPECT_ASSIST_PLATFORM,
    primaryColor: AppColors.INSPECT_ASSIST,
    image: ImagePath.INSPECT_ASSIST,
    coverUrl: ImagePath.INSPECT_ASSIST,
    navSelectedTitleColor: AppColors.flutterCatalogSelectedNavTitle,
    appLogoColor: AppColors.INSPECT_ASSIST,
    projectAssets: [
      ImagePath.INSPECT_ASSIST,
      ImagePath.GREEN_LIGHT,
      ImagePath.GREEN_LIGHT,
      ImagePath.GREEN_LIGHT,
      ImagePath.GREEN_LIGHT,
      ImagePath.GREEN_LIGHT,
    ],
    category: StringConst.INSPECT_ASSIST_CATEGORY,
    portfolioDescription: StringConst.INSPECT_ASSIST_DETAIL,
    isPublic: true,
    isOnPlayStore: false,
    technologyUsed: "",
    playStoreUrl: StringConst.INSPECT_ASSIST_PLAYSTORE_URL,
  );

  static ProjectItemData GREEN_LIGHT = ProjectItemData(
    title: StringConst.GREEN_LIGHT,
    subtitle: StringConst.GREEN_LIGHT,
    platform: StringConst.GREEN_LIGHT_PLATFORM,
    primaryColor: AppColors.GREEN_LIGHT,
    image: ImagePath.GREEN_LIGHT,
    coverUrl: ImagePath.GREEN_LIGHT,
    navSelectedTitleColor: AppColors.flutterCatalogSelectedNavTitle,
    appLogoColor: AppColors.GREEN_LIGHT,
    projectAssets: [
      ImagePath.INSPECT_ASSIST,
      ImagePath.GREEN_LIGHT,
      ImagePath.GREEN_LIGHT,
      ImagePath.GREEN_LIGHT,
      ImagePath.GREEN_LIGHT,
      ImagePath.GREEN_LIGHT,
    ],
    category: StringConst.GREEN_LIGHT_CATEGORY,
    portfolioDescription: StringConst.GREEN_LIGHT_DETAIL,
    isPublic: true,
    isOnPlayStore: false,
    technologyUsed: "",
    playStoreUrl: StringConst.GREEN_LIGHT_PLAYSTORE_URL,
  );

  static ProjectItemData PERMA_ASSIST = ProjectItemData(
    title: StringConst.PERMA_ASSIST,
    subtitle: StringConst.PERMA_ASSIST,
    platform: StringConst.PERMA_ASSIST_PLATFORM,
    primaryColor: AppColors.PERMA_ASSIST,
    image: ImagePath.PERMA_ASSIST,
    coverUrl: ImagePath.PERMA_ASSIST,
    navSelectedTitleColor: AppColors.flutterCatalogSelectedNavTitle,
    appLogoColor: AppColors.PERMA_ASSIST,
    projectAssets: [
      ImagePath.INSPECT_ASSIST,
      ImagePath.GREEN_LIGHT,
      ImagePath.GREEN_LIGHT,
      ImagePath.GREEN_LIGHT,
      ImagePath.GREEN_LIGHT,
      ImagePath.GREEN_LIGHT,
    ],
    category: StringConst.PERMA_ASSIST_CATEGORY,
    portfolioDescription: StringConst.PERMA_ASSIST_DETAIL,
    isPublic: true,
    isOnPlayStore: false,
    technologyUsed: "",
    playStoreUrl: StringConst.PERMA_ASSIST_PLAYSTORE_URL,
  );


}

