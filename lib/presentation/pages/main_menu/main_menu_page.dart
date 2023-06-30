import 'package:test_lunapp/presentation/template/template.dart';
import 'package:test_lunapp/presentation/pages/main_menu/main_menu_provider.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultBody(
      horizontalPadding: 32,
      child: BaseProvider<MainMenuProvider>(
        model: MainMenuProvider(),
        onInit: (model) => model.init(context),
        onDispose: (model) => model.disp(),
        builder: (context, model, child) {
          return SpacedColumn(
            space: 26,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(textEditingController: model.textController),
              CustomButton(
                text: 'Начать урок',
                buttonHeight: 66,
                onTap: () => model.onTapStartLesson(model.textController.text),
              ),
            ],
          );
        },
      ),
    );
  }
}
