// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatasModel _$DatasModelFromJson(Map<String, dynamic> json) => DatasModel(
      forumsList: (json['forumsList'] as List<dynamic>)
          .map((e) => ForumModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DatasModelToJson(DatasModel instance) =>
    <String, dynamic>{
      'forumsList': instance.forumsList.map((e) => e.toJson()).toList(),
    };
