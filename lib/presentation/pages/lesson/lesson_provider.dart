import 'package:test_lunapp/presentation/template/template.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LessonProvider extends BaseBloc {
  late BuildContext context;
  late String link;
  late MessagesModel messagesModel;
  late List<MessageModel> messages;

  int index = 0;
  Color buttonColor = ThemeColors.gray2;
  List<Widget> widgets = [];

  void init(BuildContext contxt) async {
    setLoading(true);

    context = contxt;

    final prefs = await SharedPreferences.getInstance();
    link = prefs.getString('lessonLink')!;

    messagesModel = (await MessagesRepository().getMessages(link))!;
    messages = messagesModel.messages;

    setLoading(false);

    notifyListeners();
  }

  Widget? botMessages() {
    while (index < messages.length && messages[index].source != 'user') {
      widgets.add(MessageTile(
        message: messages[index].text,
        sender: messages[index].source,
        isUserMessage: messages[index].source == 'user',
      ));
      if (messages[index].type == 'quiz') {
        return SpacedRow(space: 7, children: [
          for (final answer in messages[index].answers!) ...[
            Expanded(
              child: FloatingActionButton.extended(
                label: answer['text'],
                onPressed: () {
                  if (answer['correct'] == true) {
                    widgets.add(
                      MessageTile(
                        message: messages[index].text,
                        sender: messages[index].source,
                        isUserMessage: messages[index].source == 'user',
                      ),
                    );
                    index++;
                    notifyListeners();
                    botMessages();
                  } else {
                    notifyListeners();
                  }
                },
              ),
            ),
          ],
        ]);
      }
      index++;
      notifyListeners();
    }
    return null;
  }

  Widget? userMessages() {
    while (index < messages.length) {
      if (messages[index].source == 'bot' && index == 0) {
        botMessages();
      }
      if (messages[index].source == 'user') {
        return Expanded(
          child: CustomButton(
            text: messages[index].text,
            onTap: () {
              widgets.add(MessageTile(
                message: messages[index].text,
                sender: messages[index].source,
                isUserMessage: messages[index].source == 'user',
              ));
              index++;
              notifyListeners();
              botMessages();
            },
          ),
        );
      }
    }
    return null;
  }
}
