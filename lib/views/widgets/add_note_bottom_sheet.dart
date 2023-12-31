import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubit/show_note/show_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/constants.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:uuid/uuid.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: AddNoteForm(),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String title = "Default", subTitle = "Default";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            hint: 'Title',
            onSaved: (value) {
              title = value!;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hint: 'content',
            maxLines: 5,
            onSaved: (value) {
              subTitle = value!;
            },
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                setState(() {});
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
              // Assuming you have access to your AddNoteCubit instance
              final addNoteCubit = context.read<AddNoteCubit>();

              //Generate Id for note
              final String noteId  = const Uuid().v4(); // Generate a UUID

              // Generate a random index
              final int randomIndex = Random().nextInt(noteColor.length);

              // Get the random color
              final Color randomColor = noteColor[randomIndex];

              // Create a NoteModel (you can get the title and subTitle from your form fields)
              final note = NoteModel(
                  title: title,
                  subTitle: subTitle,
                  date: '',
                  color: randomColor.value,
                  noteId: noteId);

              // Call the addNote function
              setState(() {
                addNoteCubit.addNote(note);
                ShowNoteCubit().showNote();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) {
                  return const NotesView();
                }), (route) => false);
              });
            },
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
