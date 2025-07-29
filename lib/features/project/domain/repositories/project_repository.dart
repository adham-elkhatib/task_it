import 'package:dartz/dartz.dart';
import 'package:task_it/features/project/domain/entities/project_entity.dart';

import '../../../../../core/params/params.dart';
import '../../../../core/Services/Error Handling/errors/failure.dart';
import '../../../../core/params/project/project_id_params.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<ProjectEntity>>> getProjects(
    TemplateParams templateParams,
  );

  Future<Either<Failure, ProjectEntity>> getProject(
    ProjectIdParams templateParams,
  );

  Future<Either<Failure, ProjectEntity>> createProject(
    TemplateParams templateParams,
  );

  Future<Either<Failure, ProjectEntity>> updateProject(
    TemplateParams templateParams,
  );

  Future<Either<Failure, ProjectEntity>> archiveProject(
    TemplateParams templateParams,
  );

  Future<Either<Failure, ProjectEntity>> unArchiveProject(
    TemplateParams templateParams,
  );

  Future<Either<Failure, void>> deleteProject(TemplateParams templateParams);

  Future<Either<Failure, ProjectEntity>> transferOwnership(
    TransferProjectOwnershipParams params,
  );

  Future<Either<Failure, ProjectEntity>> restoreProject(ProjectIdParams params);
}
