import 'package:test_lunapp/presentation/template/template.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LessonProvider extends BaseBloc {
  late BuildContext context;
  late String link;
  late MessagesModel messagesModel;
  late List<MessageModel> messages;

  int index = 0;
  List<Widget> listOfMessages = [];
  Widget? floatingActionButton;
  bool isFalse = false;
  bool isFirstAns = true;

  void init(BuildContext contxt) async {
    setLoading(true);

    context = contxt;

    final prefs = await SharedPreferences.getInstance();
    link = prefs.getString('lessonLink')!;

    messagesModel = (await MessagesRepository().getMessages(link))!;
    messages = messagesModel.messages;

    while (index < messages.length && messages[index].source != 'user') {
      listOfMessages.add(MessageTile(
        message: messages[index].text,
        sender: messages[index].source,
        isUserMessage: messages[index].source == 'user',
      ));
      index++;
    }

    if (messages[index].source == 'user') {
      userMessages();
    }

    setLoading(false);

    notifyListeners();
  }

  void botMessages() {
    if (index < messages.length) {
      if (messages[index].source == 'bot') {
        if (messages[index].type == 'quiz') {
          if (isFirstAns) {
            listOfMessages.add(MessageTile(
              message: messages[index].text,
              sender: messages[index].source,
              isUserMessage: messages[index].source == 'user',
            ));
          }
          floatingActionButton = SpacedRow(
            space: 7,
            children: [
              for (final ans in messages[index].answers!) ...[
                Expanded(
                  child: CustomButton(
                    text: ans['text'],
                    buttonColor: (isFalse && ans['correct'] != 'true')
                        ? ThemeColors.red
                        : ThemeColors.gray2,
                    onTap: () {
                      isFirstAns = false;
                      if (ans['correct'] == 'true') {
                        listOfMessages.add(MessageTile(
                          message: ans['text'],
                          sender: 'user',
                          isUserMessage: true,
                        ));
                        isFalse = false;
                        index++;
                      } else {
                        isFalse = true;
                      }
                      botMessages();
                    },
                  ),
                ),
              ],
            ],
          );
        } else {
          floatingActionButton = null;
          listOfMessages.add(MessageTile(
            message: messages[index].text,
            sender: messages[index].source,
            isUserMessage: messages[index].source == 'user',
          ));
          index++;
          botMessages();
        }
      } else {
        userMessages();
      }
      notifyListeners();
    }
  }

  void userMessages() {
    if (index < messages.length) {
      floatingActionButton = CustomButton(
        text: messages[index].text,
        onTap: () {
          listOfMessages.add(MessageTile(
            message: messages[index].text,
            sender: messages[index].source,
            isUserMessage: messages[index].source == 'user',
          ));
          index++;
          botMessages();
        },
      );
    } else {
      floatingActionButton = null;
    }
    notifyListeners();
  }
}
