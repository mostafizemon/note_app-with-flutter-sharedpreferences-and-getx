import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp_getx/Screens/home_screen.dart';
import 'package:noteapp_getx/models/notes_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesController extends GetxController {
  RxList<NotesModel> notes = <NotesModel>[].obs;

  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

  void createNote() {
    if (titlecontroller.text.isEmpty || descriptioncontroller.text.isEmpty) {
      Get.snackbar(
        "Error",
        "All Fields Required.",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.red,
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
        backgroundColor: Colors.white10,
      );
      return;
    }
    notes.add(
      NotesModel(
        title: titlecontroller.text,
        description: descriptioncontroller.text,
        createdat: DateTime.now(),
      ),
    );
    Get.snackbar(
      "Success",
      "Note Added SUccessful.",
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.green,
      icon: const Icon(
        Icons.done_outline_sharp,
        color: Colors.green,
      ),
      backgroundColor: Colors.white10,
    );
    storeData();
    update();
    titlecontroller.clear();
    descriptioncontroller.clear();
    Get.off(const HomeScreen());
  }

  void deleteNote(int index) {
    notes.removeAt(index);
    storeData();
    update();
    Get.snackbar(
      "Deleted",
      "Note Deleted",
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.red,
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
      ),
      backgroundColor: Colors.white10,
    );
  }

  void updateNote() {}

  void storeData() async {
    var prefs = await SharedPreferences.getInstance();
    var noteslistMap = notes.map((note) {
      return {
        'title': note.title,
        'description': note.description,
        'createdat': note.createdat.toString(),
      };
    }).toString();

    var notelistString = jsonEncode(noteslistMap);
    prefs.setString("note", notelistString);
  }

  void loadNotes() async {
    var prefs = await SharedPreferences.getInstance();
    var noteListString = prefs.getString("note");
    if (noteListString != null) {
      var notesListMap = jsonDecode(noteListString);
      print("Decoded Notes: ${notesListMap.runtimeType}");
      var noteListModel = notesListMap.map(
        (note) {
          return NotesModel(
            title: note['title'],
            description: note['description'],
            createdat: DateTime.parse(
              note['createdat'],
            ),
          );
        },
      ).toList();
      notes.addAll(noteListModel);
      update();
      refresh();
    }
  }

  @override
  void onInit() {
    loadNotes();
    super.onInit();
  }

///////////////
}


