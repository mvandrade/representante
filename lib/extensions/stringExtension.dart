import 'package:recorrente/utils/data_routing.dart';

extension StringExtension on String {
  DataRouting get getDataRouting {
    Uri uriData = Uri.parse(this);
    return DataRouting(
      uriData.path, uriData.queryParameters
    );
  }
}