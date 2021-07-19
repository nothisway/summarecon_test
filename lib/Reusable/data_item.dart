import 'package:flutter/material.dart';

class DataItem extends StatelessWidget {
  final String data;
  DataItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(data),
    );
  }
}