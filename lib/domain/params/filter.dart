import '../entities/entities.dart';
import '../helpers/helpers.dart';

class FilterParams {
  String? searchTerm;
  AssetStatus? status;
  SensorType? type;

  FilterParams({
    this.searchTerm,
    this.status,
    this.type,
  });

  bool get isEmpty => searchTerm == null && status == null && type == null;

  bool filter(NodeEntity node) {
    if (isEmpty) return false;

    bool nameResult = false;
    bool statusResult = false;
    bool typeResult = false;

    if (searchTerm != null && node.name!.toLowerCase().contains(searchTerm!.toLowerCase())) {
      nameResult = true;
    }

    if (status != null && node.node is AssetEntity && (node.node as AssetEntity).status == status) {
      statusResult = true;
    }

    if (type != null && node.node is AssetEntity && (node.node as AssetEntity).sensorType == type) {
      typeResult = true;
    }

    if ((searchTerm == null || nameResult) &&
        (status == null || statusResult) &&
        (type == null || typeResult)) {
      return true;
    }

    return false;
  }
}
