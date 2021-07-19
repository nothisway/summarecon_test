import 'package:flutter/material.dart';

class MenuContainer extends StatelessWidget {
  final String title;
  MenuContainer(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue
      ),
      height: 100,
      width: 100,
      child: Center(
        child: Text(title, style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
      ),
    );
  }
}
