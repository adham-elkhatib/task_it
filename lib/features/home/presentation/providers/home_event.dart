part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadHome extends HomeEvent {
  const LoadHome();

  @override
  List<Object?> get props => [];
}
