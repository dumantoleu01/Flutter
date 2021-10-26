import 'package:flutter/material.dart';
import 'package:test_app/db/currencies.dart';
import 'package:test_app/db/notes_database.dart';
import 'package:test_app/model/currency.dart';
import 'package:test_app/model/note.dart';
import 'package:test_app/screens/sortable_page.dart';
import 'package:test_app/services/networking.dart';
import 'package:test_app/widget/tabbar_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late List<Note> notes;

  // bool isLoading = false;

  // late Note currency;
  late Currencies currencies;

  @override
  void initState() {
    super.initState();

    // refreshNotes();
    getDataFromUrl();
  }

  Future getDataFromUrl() async {
    Networking networking = Networking();
    dynamic curr = await networking.getData();
    dynamic dates = curr["data"];
    for (dynamic date in dates) {
      currencies.addCurrency(date["symbol"], date["name"],
          date["metrics"]["market_data"]["price_usd"]);
    }
  }

  // Future refreshNotes() async {
  //   setState(() => isLoading = true);

  //   this.notes = await NotesDatabase.instance.readAllNotes();

  //   setState(() => isLoading = false);
  // }

  // void addOrUpdateNote(Note note) async {
  //   final isUpdating = note != null;

  //   if (isUpdating) {
  //     await updateNote(note);
  //   } else {
  //     await addNote(note);
  //   }
  // }

  // Future updateNote(Note note) async {}

  // Future addNote(Note note) async {
  //   await NotesDatabase.instance.create(note);
  // }

  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: "Test App",
        tabs: [
          Tab(icon: Icon(Icons.sort_by_alpha), text: 'Sortable'),
          Tab(icon: Icon(Icons.select_all), text: 'Selectable'),
          Tab(icon: Icon(Icons.edit), text: 'Editable'),
        ],
        children: [
          SortablePage(
            currencies: currencies,
          ),
          Container(),
          Container(),
        ],
      );
}
