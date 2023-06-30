import 'package:json_annotation/json_annotation.dart';

part 'messages_model.g.dart';

@JsonSerializable(anyMap: true)
class MessagesModel {
  final List<MessageModel> messages;

  @override
  const MessagesModel({required this.messages});

  factory MessagesModel.fromJson(Map<String, dynamic> json) =>
      _$MessagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessagesModelToJson(this);
}

@JsonSerializable(anyMap: true)
class MessageModel {
  final String source;
  final String type;
  final String text;
  final List<Map>? answers;

  @override
  const MessageModel({
    required this.source,
    required this.type,
    required this.text,
    this.answers,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
