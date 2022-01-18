import 'package:flutter/material.dart';

import 'cart_list_item.dart';
import 'cart_list_widget.dart';
import 'listitemwidget.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<ListItem> items = List.from(listItems);
  final listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: AnimatedList(
            key: listKey,
            initialItemCount: items.length,
            itemBuilder: (context, index, animation) => ListItemWidget(
                  item: items[index],
                  animation: animation,
                  onClicked: () => removeItem(index),
                )),
      );
  void removeItem(int index) {
    final removedItem = items[index];

    items.removeAt(index);
    listKey.currentState!.removeItem(
      index,
      (context, animation) => ListItemWidget(
        item: removedItem,
        animation: animation,
        onClicked: () {},
      ),
      duration: Duration(milliseconds: 600),
    );
  }
}
