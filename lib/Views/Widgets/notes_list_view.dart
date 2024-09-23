import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_notes_flutter/Cubites/read_notes/read_notes_cubit.dart';
import 'package:local_notes_flutter/Models/note_model.dart';
import 'package:local_notes_flutter/Views/Widgets/note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNotesCubit, ReadNotesState>(
      builder: (context, state) {
        List<NoteModel> allNotes =
            BlocProvider.of<ReadNotesCubit>(context).allNotes ?? [];
        return ListView.builder(
          itemCount: allNotes.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: NoteItem(noteModel: allNotes[index]),
            );
          },
        );
      },
    );
  }
}
