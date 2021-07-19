import 'package:flutter/material.dart';
import 'package:summarecon_test/Reusable/data_item.dart';

class ListDataDetailScreen extends StatelessWidget {
  final String data;
  ListDataDetailScreen(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Data Detail"),
        centerTitle: true,
      ),
      body: DataItem("Ini adalah Data " + data)
    );
  }
}
