import 'package:test_lunapp/presentation/template/template.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMenuProvider extends BaseBloc {
  late BuildContext context;

  static const linkText =
      'http://lunappstudio.com/hr/test_spanish_numerals.json';

  TextEditingController textController = TextEditingController(text: linkText);

  void init(BuildContext contxt) {
    setLoading(true);
    context = contxt;
    setLoading(false);

    notifyListeners();
  }

  void disp() {
    textController.dispose();

    notifyListeners();
  }

  void onTapStartLesson(String link) async {
    if (await MessagesRepository().getMessages(link) != null) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('lessonLink', link);

      if (context.mounted) {
        Navigator.pushNamed(
          context,
          AppRoutes.routeToLessonPage,
        );
      }
    } else {
      if (context.mounted) {
        errorDialog(context);
      }
    }

    notifyListeners();
  }
}
