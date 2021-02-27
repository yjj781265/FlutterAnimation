import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedListDemo extends StatefulWidget {
  @override
  _AnimatedListDemoState createState() => _AnimatedListDemoState();
}

class _AnimatedListDemoState extends State<AnimatedListDemo> {
  final key = GlobalKey<AnimatedListState>();
  List<Item> _items = List();
  Random random = Random();

  @override
  void initState() {
    _items.add(Item(generateRandomColor()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                padding: const EdgeInsets.all(3),
                color: Colors.greenAccent,
                icon: Icon(Icons.add),
                onPressed: () {
                  _items.add(Item(generateRandomColor()));
                  key.currentState.insertItem(_items.length - 1);
                }),
            IconButton(
              padding: const EdgeInsets.all(3),
              color: Colors.redAccent,
              icon: Icon(Icons.remove),
              onPressed: () {
                if (_items.isEmpty) {
                  return;
                }

                int index =
                    _items.length == 1 ? 0 : random.nextInt(_items.length - 1);
                Item item = _items[index];
                _items.removeAt(index);
                AnimatedListRemovedItemBuilder builder = (context, animation) {
                  return buildItem(item, index, animation);
                };
                key.currentState.removeItem(index, builder);
              },
            ),
          ],
        ),
        Expanded(
          child: AnimatedList(
              key: key,
              initialItemCount: _items.length,
              shrinkWrap: true,
              itemBuilder: (context, index, animation) {
                return buildItem(_items[index], index, animation);
              }),
        ),
      ],
    );
  }

  Color generateRandomColor() {
    // Define all colors you want here
    const predefinedColors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.orangeAccent,
      Colors.blueAccent
    ];
    return predefinedColors[random.nextInt(predefinedColors.length)];
  }

  buildItem(Item item, int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: SizedBox(
        height: 100,
        child: Card(
          color: item.color,
          child: Center(
            child: Text('Item $index'),
          ),
        ),
      ),
    );
  }
}

class Item {
  Color _color;

  Item(this._color);

  Color get color => _color;
}
