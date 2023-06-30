// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagesModel _$MessagesModelFromJson(Map json) => MessagesModel(
      messages: (json['messages'] as List<dynamic>)
          .map(
              (e) => MessageModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$MessagesModelToJson(MessagesModel instance) =>
    <String, dynamic>{
      'messages': instance.messages,
    };

MessageModel _$MessageModelFromJson(Map json) => MessageModel(
      source: json['source'] as String,
      type: json['type'] as String,
      text: json['text'] as String,
      answers:
          (json['answers'] as List<dynamic>?)?.map((e) => e as Map).toList(),
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'text': instance.text,
      'answers': instance.answers,
    };
