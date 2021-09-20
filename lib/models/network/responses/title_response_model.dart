import 'package:json_annotation/json_annotation.dart';

part 'title_response_model.g.dart';

@JsonSerializable()
class TitleResponseModel {
  const TitleResponseModel({
    required this.title,
  });

  factory TitleResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TitleResponseModelFromJson(json);

  @JsonKey(name: 'title')
  final String title;

  Map<String, dynamic> toJson() => _$TitleResponseModelToJson(this);
}
