import 'package:flutter/material.dart';
import 'package:local_notes_flutter/Views/Widgets/add_note_bottom_sheet.dart';
import 'package:local_notes_flutter/Views/Widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff62fcd7),
          shape: const CircleBorder(),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return const AddNoteBottomSheet();
                });
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        body: const NotesViewBody());
  }
}
