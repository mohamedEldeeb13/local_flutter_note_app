import 'package:flutter/material.dart';
import 'package:local_notes_flutter/Models/note_model.dart';
import 'package:local_notes_flutter/Views/Widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(noteModel: note),
    );
  }
}
