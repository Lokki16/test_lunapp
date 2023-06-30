import 'package:test_lunapp/presentation/template/template.dart';

class AppRoutes {
  static const String routeToMainMenuPage = '/main_menu_page';
  static const String routeToLessonPage = '/lesson_page';

  static dynamic getRoutes = {
    routeToMainMenuPage: (context) => const MainMenuPage(),
    routeToLessonPage: (context) => const LessonPage(),
  };
}
