import 'base_project_params.dart';

class UpdateProjectParams extends BaseParams {
  final String projectId;
  final String title;
  final String? description;
  final String? deadline;
  final int status;
  final String? colorHex;
  final List<String> tags;

  UpdateProjectParams({
    required this.projectId,
    required this.title,
    this.description,
    this.deadline,
    this.status = 0,
    this.colorHex,
    this.tags = const [],
  });
}
