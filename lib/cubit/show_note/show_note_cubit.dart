import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';
// import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/constants.dart';

part 'show_note_state.dart';

class ShowNoteCubit extends Cubit<ShowNoteState> {
  ShowNoteCubit() : super(ShowNoteInitial());

  Future showNote() async {
    try {
      var notesBox = Hive.box(kNotesBox);
      emit(ShowNoteSuccess());
      final List<NoteModel> notes =
          notesBox.values.whereType<NoteModel>().toList();
      final List<String> noteTitles = notes.map((note) => note.title).toList();
      final List<String> noteContents =
          notes.map((note) => note.subTitle).toList();
      final List<String> noteDate = notes.map((note) => note.date).toList();
      final List<int> noteColor = notes.map((note) => note.color).toList();
      print('Note Titles: $noteTitles');
      print('Note Contents: $noteContents');
      print('Note Data: $noteDate');
      print('Note Color: $noteColor');

      print(notes);
      emit(ShowNoteLoding());
      print("ammount is ${notesBox.length}");
    } catch (e) {
      ShowNoteFailer(e.toString());
    }
  }
}
