import 'base_project_params.dart';

class CreateProjectParams extends BaseParams {
  final String projectOwnerId;
  final String title;
  final String? description;
  final String? deadline;
  final int status;
  final String? colorHex;
  final List<String> tags;

  CreateProjectParams({
    required this.projectOwnerId,
    required this.title,
    this.description,
    this.deadline,
    this.status = 0,
    this.colorHex,
    this.tags = const [],
  });
}
