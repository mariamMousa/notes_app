import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/views/constants.dart';

part 'delete_state.dart';

class DeleteCubit extends Cubit<DeleteState> {
  DeleteCubit() : super(DeleteInitial());

  Future deleteNote(String noteId) async {
    try {
      emit(DeleteNoteLoding());

      var notesBox = Hive.box(kNotesBox);

      await notesBox.delete(noteId);
      
      emit(DeleteNoteSuccess());
      print("Notes after deletion: ${notesBox.values.toList()}");
      print("after deleted ammount is ${notesBox.length}");
    } catch (e) {
      DeleteNoteFailer(e.toString());
    }
  }
}
