import 'package:equatable/equatable.dart';

class Fsof extends Equatable{
  final String name;
  final String url;

  const Fsof({
    required this.name,
    required this.url
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    name,
    url
  ];

}