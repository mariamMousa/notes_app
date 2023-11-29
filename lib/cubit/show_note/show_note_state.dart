part of 'show_note_cubit.dart';

@immutable
abstract class ShowNoteState {}

class ShowNoteInitial extends ShowNoteState {}

class ShowNoteLoding extends ShowNoteState {}

class ShowNoteSuccess extends ShowNoteState {}

class ShowNoteFailer extends ShowNoteState {
  final String errMessage;
  ShowNoteFailer(this.errMessage);
}
