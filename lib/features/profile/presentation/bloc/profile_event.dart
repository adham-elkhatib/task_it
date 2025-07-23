part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

final class GetProfileEvent extends ProfileEvent {
  const GetProfileEvent();

  @override
  List<Object?> get props => [];
}

final class CreateProfileEvent extends ProfileEvent {
  final CreateProfileParams params;

  const CreateProfileEvent({required this.params});

  @override
  List<Object?> get props => [params];
}

final class LogoutEvent extends ProfileEvent {
  const LogoutEvent();

  @override
  List<Object?> get props => [];
}

final class UpdateProfileEvent extends ProfileEvent {
  final UpdateProfileParams params;

  const UpdateProfileEvent({required this.params});

  @override
  List<Object?> get props => [params];
}
final class UpdateProfilePictureEvent extends ProfileEvent {
  final File file;

  const UpdateProfilePictureEvent({required this.file});

  @override
  List<Object?> get props => [file];
}

final class RemoveProfilePictureEvent extends ProfileEvent {

  const RemoveProfilePictureEvent();

  @override
  List<Object?> get props => [];
}