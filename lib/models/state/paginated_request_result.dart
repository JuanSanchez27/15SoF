import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:fsof/models/network/responses/common/meta_response_model.dart';

class PaginatedRequestResult<T extends StoreListItem> {
  const PaginatedRequestResult(this.data, this.meta);

  final List<T> data;
  final MetaResponseModel meta;
}
