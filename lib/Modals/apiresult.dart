import 'package:json_annotation/json_annotation.dart';

import 'modalclass.dart';

part 'apiresult.g.dart';

@JsonSerializable()
class ApiResultModel {
  List<BreakingBad> breakingBad;

  ApiResultModel({required this.breakingBad});

  factory ApiResultModel.fromJson(Map<String, dynamic> data) =>
      _$ApiResultModelFromJson(data);

  Map<String, dynamic> toJson() => _$ApiResultModelToJson(this);
}
