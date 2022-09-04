import 'package:animatedlistflutterbyktech/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedListByKtech extends StatefulWidget {
  const AnimatedListByKtech({Key? key}) : super(key: key);

  @override
  _AnimatedListByKtechState createState() => _AnimatedListByKtechState();
}

class _AnimatedListByKtechState extends State<AnimatedListByKtech> {
  @override
  Widget build(BuildContext context) {
    final listProvider = Provider.of<ListProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List ktech'),
        backgroundColor: Color.fromARGB(255, 111, 67, 1),
      ),
      body: Consumer<ListProvider>(builder: (context, value, child) {
        return Container(
          child: AnimatedList(
            key: value.key,
            initialItemCount: 0,
            padding: const EdgeInsets.all(10),
            itemBuilder: (_, index, animation) {
              return SizeTransition(
                key: UniqueKey(),
                sizeFactor: animation,
                child: Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 10,
                  color: Color.fromARGB(255, 111, 67, 1),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(4),
                    title: Text(value.items[index],
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.white,
                      onPressed: () => listProvider.removeItem(index),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: listProvider.addItem(),
        child: const Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 111, 67, 1),
      ),
    );
  }
}
