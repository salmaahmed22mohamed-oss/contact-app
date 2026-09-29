// ignore_for_file: unnecessary_string_escapes

abstract class AppAssets {
  static const String rootPath = 'assets/images/';
  static const String routeLogo = '${rootPath}route_logo.png';
  static const String routeTitle = '${rootPath}route_title.png';
  static const String emailIcon = '${rootPath}email_icon.svg';
  static const String phoneIcon = '${rootPath}phone_icon.png';
}

abstract class AppAnimations {
  static const String animationLootPath = 'assets/animations/';

  static const String emptyListAnimation =
      '${animationLootPath}empty_list.json';



  static const String imagePickerAnimation =
      '${animationLootPath}image_picker.json';
}
