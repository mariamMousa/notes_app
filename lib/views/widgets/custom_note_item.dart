import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubit/show_note/show_note_cubit.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({super.key});

  @override
  State<NoteItem> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<NoteItem> {
  @override
  void initState() {
    super.initState();
    ShowNoteCubit().showNote();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.amber),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const EditNoteView();
              }));
            },
            child: ListTile(
              title: const Text(
                "Mariam",
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  "Create the first app in flutter",
                  style: TextStyle(
                      color: Colors.black.withOpacity(.5), fontSize: 18),
                ),
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
              style:
                  TextStyle(color: Colors.black.withOpacity(.4), fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
