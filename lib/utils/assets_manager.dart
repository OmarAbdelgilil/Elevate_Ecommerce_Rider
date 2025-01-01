class ImageAssets {
  static const String imagePath = "assets/images/";
}

class SVGAssets {
  SVGAssets._();

  static const String _basePath = "assets/svg/";

  static const String homeTab = "${_basePath}home_tab.svg";
  static const String personTab = "${_basePath}person_tab.svg";
  static const String ordersTab = "${_basePath}Transaction-order (交易清单).svg";
  static const String logoutIcon =
      "${_basePath}logout_24dp_5F6368_FILL0_wght400_GRAD0_opsz24 1.svg";

}

class LottieAssets {
  LottieAssets._();
  static const String _basePath = "assets/lotties/";
  static const String success = "${_basePath}success.json";
}
