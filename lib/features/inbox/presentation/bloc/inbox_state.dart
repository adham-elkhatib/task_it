part of 'inbox_bloc.dart';

sealed class InboxState extends Equatable {
  const InboxState();
}

final class InboxInitial extends InboxState {
  @override
  List<Object> get props => [];
}
