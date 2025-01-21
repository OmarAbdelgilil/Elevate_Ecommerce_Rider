class ImageAssets {
  static const String imagePath = "assets/images/";
}

class SVGAssets {
  SVGAssets._();

  static const String _basePath = "assets/svg/";

  static const String homeTab = "${_basePath}home_tab.svg";
  static const String menu = "${_basePath}Vector.svg";
  static const String upload = "${_basePath}upload.svg";
  static const String personTab = "${_basePath}person_tab.svg";
  static const String ordersTab = "${_basePath}Transaction-order (交易清单).svg";
  static const String egyptFlag = "${_basePath}egypt-flag-icon.svg";

}

class LottieAssets {
  static const String _basePath = "assets/lotties/";
  LottieAssets._();

  static const String success = "${_basePath}success.json";
  static const String loading = "${_basePath}loading.json";
  static const String error = "${_basePath}error.json";
  static const String call = "${_basePath}viber.json";
  static const String underConstruction = "${_basePath}under_construction.json";
  static const String noContent = "${_basePath}no_content.json";
  static const String noPermissions = "${_basePath}no_permissions.json";
  static const String verificationPending =
      "${_basePath}verification_pending.json";

}
