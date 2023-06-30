import 'package:test_lunapp/presentation/template/template.dart';
import 'package:test_lunapp/presentation/pages/lesson/lesson_provider.dart';

class LessonPage extends StatelessWidget {
  const LessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseProvider<LessonProvider>(
      model: LessonProvider(),
      onInit: (model) => model.init(context),
      builder: (context, model, child) => model.isLoading
          ? const CustomCircularProgressIndicator()
          : DefaultBody(
              bottomPadding: 100,
              horizontalPadding: 20,
              floatingBottomPadding: 28,
              floatingHorizontalPadding: 30,
              floatingActionButton: model.userMessages(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: model.widgets,
              ),
            ),
    );
  }
}
