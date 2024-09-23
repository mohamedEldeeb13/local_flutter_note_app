import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_notes_flutter/Cubites/read_notes/read_notes_cubit.dart';
import 'package:local_notes_flutter/Models/note_model.dart';
import 'package:local_notes_flutter/Views/Widgets/custom_app_bar.dart';
import 'package:local_notes_flutter/Views/Widgets/custom_text_field.dart';
import 'package:local_notes_flutter/Views/Widgets/edit_color_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.noteModel.title;
    contentController.text = widget.noteModel.subTitle;
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          CustomAppBar(
            title: "Edit Note",
            icon: Icons.check,
            onTap: () {
              widget.noteModel.title = titleController.text == ""
                  ? widget.noteModel.title
                  : titleController.text;
              widget.noteModel.subTitle = contentController.text == ""
                  ? widget.noteModel.subTitle
                  : contentController.text;
              widget.noteModel.save();
              BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 60,
          ),
          CustomTextField(
            title: "title",
            textEditingController: titleController,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            title: "content",
            maxLine: 7,
            textEditingController: contentController,
          ),
          const SizedBox(
            height: 16,
          ),
          EditColorListView(
            note: widget.noteModel,
          )
        ],
      ),
    );
  }
}
