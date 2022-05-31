import 'package:equatable/equatable.dart';
import 'package:fsof/core/entities/fsof.dart';

class FsofModel extends Equatable {
  final String name;
  final String url;

  const FsofModel({required this.name, required this.url});

  factory FsofModel.fromEntity(Fsof entity) {
    return FsofModel(
      name: entity.name,
      url: entity.url,
    );
  }

  Fsof toEntity() => Fsof(
        name: name,
        url: url,
      );

  factory FsofModel.fromJson(Map<String, dynamic> json) {
    return FsofModel(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name, url];
}
