import 'package:test_lunapp/presentation/template/template.dart';

class ThemeShadows {
  static List<BoxShadow> shadow = [
    BoxShadow(
      offset: const Offset(0, 1),
      blurRadius: 4,
      spreadRadius: 0,
      color: ThemeColors.black.withOpacity(0.25),
    ),
  ];
}
