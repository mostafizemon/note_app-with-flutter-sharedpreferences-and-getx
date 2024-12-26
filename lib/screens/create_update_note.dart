import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp_getx/controllers/notes_controller.dart';
import 'package:noteapp_getx/models/notes_model.dart';

import '../widgets/inputfield.dart';

class CreateUpdateNote extends StatefulWidget {
  final String appbartitle;
  final NotesModel? note;

  const CreateUpdateNote({super.key, required this.appbartitle, this.note});

  @override
  State<CreateUpdateNote> createState() => _CreateUpdateNoteState();
}

class _CreateUpdateNoteState extends State<CreateUpdateNote> {
  final controller = Get.put(NotesController());

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      controller.titlecontroller.text = widget.note!.title;
      controller.descriptioncontroller.text = widget.note!.description;
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.titlecontroller.clear();
    controller.descriptioncontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white70,
          ),
        ),
        title: Text(
          widget.appbartitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (widget.note != null) {
              } else {
                controller.createNote();
              }
            },
            icon: const Icon(
              Icons.done,
              color: Colors.white70,
            ),
          ),
        ],
      ),
      body: InputField(controller: controller),
    );
  }
}
