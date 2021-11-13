// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiresult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResultModel _$ApiResultModelFromJson(Map<String, dynamic> json) =>
    ApiResultModel(
      breakingBad: (json['breakingBad'] as List<dynamic>)
          .map((e) => BreakingBad.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiResultModelToJson(ApiResultModel instance) =>
    <String, dynamic>{
      'breakingBad': instance.breakingBad,
    };
