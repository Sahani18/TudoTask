
import 'package:json_annotation/json_annotation.dart';

part 'modalclass.g.dart';

@JsonSerializable()
class BreakingBad {
  late String name;
  late String birthday;
  late String image;


  BreakingBad( this.name, this.birthday, this.image);

  factory BreakingBad.fromJson(Map<String, dynamic> data) =>
      _$BreakingBadFromJson(data);

  Map<String, dynamic> toJson() => _$BreakingBadToJson(this);
}
