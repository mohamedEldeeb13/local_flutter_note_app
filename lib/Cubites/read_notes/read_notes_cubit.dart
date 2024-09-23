import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:local_notes_flutter/Models/note_model.dart';
import 'package:meta/meta.dart';

part 'read_notes_state.dart';

class ReadNotesCubit extends Cubit<ReadNotesState> {
  ReadNotesCubit() : super(ReadNotesInitial());
  List<NoteModel>? allNotes;
  fetchAllNotes() async {
    emit(ReadNotesLoading());
    var noteBox = Hive.box<NoteModel>("note_box");
    allNotes = noteBox.values.toList();
    emit(ReadNotesSuccess());
  }
}
