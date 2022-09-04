import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier {
  final GlobalKey<AnimatedListState> key = GlobalKey();
  final _items = ['Foods', 'Bread', 'Shakes', 'Fast Food'];

  List get items => _items;

  void removeItem(int index) {
    key.currentState!.removeItem(index, (_, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(10),
          elevation: 7,
          color: Color.fromARGB(255, 110, 19, 12),
          child: ListTile(
              contentPadding: EdgeInsets.all(15),
              title: Text("Deleted",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ))),
        ),
      );
    }, duration: const Duration(seconds: 1));

    _items.removeAt(index);
  }

  addItem() {
    key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
    notifyListeners();
  }
}
