part of 'delete_cubit.dart';

@immutable
sealed class DeleteState {}

final class DeleteInitial extends DeleteState {}

class DeleteNoteLoding extends DeleteState {}

class DeleteNoteSuccess extends DeleteState {}

class DeleteNoteFailer extends DeleteState {
  final String errMessage;
  DeleteNoteFailer(this.errMessage);
}
