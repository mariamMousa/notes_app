import 'package:hive/hive.dart';

class NoteModel extends HiveObject {
  final String title;
  final String subTitle;
  final String date;
  final int color;

  NoteModel(
      {required this.title,
      required this.subTitle,
      required this.date,
      required this.color});
}
