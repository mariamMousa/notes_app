part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoding extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNoteFailer extends AddNoteState {
  final String errMessage;
  AddNoteFailer(this.errMessage);
}
