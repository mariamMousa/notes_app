import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubit/show_note/show_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'package:notes_app/views/edit_note_view.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  final ShowNoteCubit showNoteCubit = ShowNoteCubit();

  @override
  void initState() {
    super.initState();
    showNoteCubit.showNote();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowNoteCubit, ShowNoteState>(
      bloc: showNoteCubit,
      builder: (context, state) {
        if (state is ShowNoteSuccess) {
          final List<NoteModel> notes = state.notes;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 24, bottom: 24, left: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(note.color)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const EditNoteView();
                            }));
                          },
                          child: ListTile(
                            title: Text(
                              note.title,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 26),
                            ),
                            subtitle: Text(
                              note.subTitle,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(.5),
                                  fontSize: 18),
                            ),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  FontAwesomeIcons.trash,
                                  size: 25,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: Text(
                            "May21, 2022",
                            style: TextStyle(
                                color: Colors.black.withOpacity(.4),
                                fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is ShowNoteLoding) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ShowNoteFailer) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return const Center(child: Text('No notes available.'));
      },
    );
  }
}











    // return ListView.builder(
    //   padding: EdgeInsets.zero,
    //   itemCount: noteList.length,
    //   itemBuilder: (context, index) {
    //     var note = noteList[index];
    //     return Padding(
    //       padding: const EdgeInsets.symmetric(vertical: 8),
    //       child: Container(
    //         padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(16),
    //             color: Color(note.color)),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.end,
    //           children: [
    //             GestureDetector(
    //               onTap: () {
    //                 Navigator.push(context,
    //                     MaterialPageRoute(builder: (context) {
    //                   return const EditNoteView();
    //                 }));
    //               },
    //               child: ListTile(
    //                 title: Text(
    //                   note.title,
    //                   style:
    //                       const TextStyle(color: Colors.black, fontSize: 26),
    //                 ),
    //                 subtitle: Padding(
    //                   padding: const EdgeInsets.only(top: 16, bottom: 16),
    //                   child: Text(
    //                     note.subTitle,
    //                     style: TextStyle(
    //                         color: Colors.black.withOpacity(.5),
    //                         fontSize: 18),
    //                   ),
    //                 ),
    //                 trailing: IconButton(
    //                     onPressed: () {},
    //                     icon: const Icon(
    //                       FontAwesomeIcons.trash,
    //                       size: 25,
    //                       color: Colors.black,
    //                     )),
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(right: 24),
    //               child: Text(
    //                 "May21, 2022",
    //                 style: TextStyle(
    //                     color: Colors.black.withOpacity(.4), fontSize: 14),
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );
  