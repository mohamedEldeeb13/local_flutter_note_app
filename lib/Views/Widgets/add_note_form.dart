import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_notes_flutter/Cubites/add_note_cubit/add_note_cubit.dart';
import 'package:local_notes_flutter/Models/note_model.dart';
import 'package:local_notes_flutter/Views/Widgets/add_note_button.dart';
import 'package:local_notes_flutter/Views/Widgets/color_list_view.dart';
import 'package:local_notes_flutter/Views/Widgets/custom_text_field.dart';
import 'package:intl/intl.dart' as intl;

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            title: "title",
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            title: "content",
            maxLine: 7,
            onSaved: (value) {
              content = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const ColorListView(),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return AddNoteButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formattedDate =
                        intl.DateFormat('dd-mm-yyyy').format(currentDate);
                    var note = NoteModel(
                        title: title!,
                        subTitle: content!,
                        date: formattedDate,
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(note);
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
