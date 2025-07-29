import 'base_project_params.dart';

class TransferProjectOwnershipParams extends BaseParams {
  final String projectId;
  final String newOwnerId;

  TransferProjectOwnershipParams({
    required this.projectId,
    required this.newOwnerId,
  });
}
