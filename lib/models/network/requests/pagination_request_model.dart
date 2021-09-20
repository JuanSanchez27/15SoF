import 'package:fsof/utils/extensions.dart';
import 'package:meta/meta.dart';

const int itemsPerPage = 25;

@immutable
class QueryParameter {
  const QueryParameter(
    this.name,
    this.value, [
    this.parameterName = 'q',
  ]);

  final String name;
  final String value;
  final String parameterName;

  @override
  String toString() {
    return parameterName.isNotEmpty
        ? '$parameterName[$name]=$value'
        : '$name=$value';
  }
}

class PaginationRequestModel {
  PaginationRequestModel.offset({
    required int offset,
    String nameCont = '',
    String nameStart = '',
    String sort = '',
    String kind = '',
    List<QueryParameter> additionalParams = const [],
    this.perPage = itemsPerPage,
  })  : page = _getPage(offset, perPage),
        parameters = [
          QueryParameter('name_cont', nameCont),
          QueryParameter('name_start', nameStart),
          QueryParameter('s', sort),
          QueryParameter('kind_cont', kind),
          ...additionalParams,
        ];

  PaginationRequestModel.page({
    required this.page,
    String nameCont = '',
    String nameStart = '',
    String sort = '',
    String kind = '',
    List<QueryParameter> additionalParams = const [],
    this.perPage = itemsPerPage,
  }) : parameters = [
          QueryParameter('name_cont', nameCont),
          QueryParameter('name_start', nameStart),
          QueryParameter('s', sort),
          QueryParameter('kind_cont', kind),
          ...additionalParams,
        ];

  PaginationRequestModel.parameters({
    required this.page,
    this.perPage = itemsPerPage,
    this.parameters = const [],
  });

  final int page;
  final int perPage;
  final List<QueryParameter> parameters;

  Map<String, dynamic> toQueryParams() {
    final requestParameters = <String, dynamic>{};

    requestParameters['page'] = page;
    requestParameters['per_page'] = perPage;

    parameters.where((p) => p.value.isNotEmpty).forEach((parameter) {
      if (parameter.parameterName.isEmpty) {
        requestParameters[parameter.name] = parameter.value;
      } else {
        requestParameters['${parameter.parameterName}[${parameter.name}]'] =
            parameter.value;
      }
    });

    return requestParameters;
  }

  static int _getPage(int offset, int perPage) {
    return offset ~/ perPage + 1;
  }

  String? getSearchText() {
    final containsSearchParam =
        parameters.firstWhereOrNull((p) => p.name == 'name_cont');

    if (containsSearchParam != null) {
      return containsSearchParam.value;
    }

    final startsSearchParam =
        parameters.firstWhereOrNull((p) => p.name == 'name_start');

    if (startsSearchParam != null) {
      return startsSearchParam.value;
    }

    return null;
  }

  String toParams() {
    return parameters
        .where((parameter) => parameter.value.isNotEmpty)
        .map((parameter) => parameter.toString())
        .join('&');
  }
}
