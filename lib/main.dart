import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubit/delete_note_cubit/delete_cubit.dart';
import 'package:notes_app/cubit/show_note/show_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/constants.dart';
import 'package:notes_app/views/notes_view.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => AddNoteCubit())),
        BlocProvider(create: ((context) => ShowNoteCubit())),
        BlocProvider(create: ((context) => DeleteCubit())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Caveat'),
        home: const NotesView(),
      ),
    );
  }
}
