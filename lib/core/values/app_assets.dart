/// A centralized class containing all asset paths.
///
/// Usage:
/// ```dart
/// SvgPicture.asset(AppAssets.appbarLogo);
/// ```
final class AppAssets {
  const AppAssets._();

  // Base paths
  static const String _basePath = 'assets/images';

  // SVG Assets
  static const String appbarLogo = '$_basePath/appbar.png';
  static const String onboard1 = '$_basePath/onb1.png';
  static const String onboard2 = '$_basePath/onb2.png';
  static const String onboard3 = '$_basePath/onb3.png';
  static const String userRoleBg = '$_basePath/userRoleBG.png';
  static const String countryBg = 'assets/images/countryBg.png';
  static const String tradsmanBg = 'assets/images/tradsmanBg.png';
  static const String homebg = '$_basePath/home_bg.png';
  static const String trad2bg = '$_basePath/trad2.png';
  static const String clientdeshboard = '$_basePath/clientdeshboard.png';
  static const String companyBg = '$_basePath/companyBg.png';
}
