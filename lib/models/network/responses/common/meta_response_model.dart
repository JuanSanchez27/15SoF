import 'package:fsof/models/network/response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meta_response_model.g.dart';

@JsonSerializable()
class MetaResponseModel extends ResponseModel {
  const MetaResponseModel({
    required this.totalCount,
    this.prevPage,
    this.currentPage,
    this.nextPage,
  });

  factory MetaResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MetaResponseModelFromJson(json);

  final int? prevPage;
  final int? currentPage;
  final int? nextPage;
  final int totalCount;

  @override
  Map<String, dynamic> toJson() => _$MetaResponseModelToJson(this);
}
