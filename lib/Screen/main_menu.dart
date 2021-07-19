import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summarecon_test/Reusable/menu_container.dart';
import 'package:summarecon_test/Screen/EntryKeluhan/entry_keluhan_screen.dart';
import 'package:summarecon_test/Screen/ListData/list_data_screen.dart';
import 'package:toast/toast.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  List<int> numberList = [1, 4, -3, 30];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Menu Utama"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 100),
        color: Colors.white,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      numberList[0] = 6;
                      numberList[1] = 24;
                      numberList[2] = -18;
                      numberList[3] = -120;
                    });
                    Toast.show(numberList.toString(), context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                  },
                    child: MenuContainer("Manipulasi Elemen")),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ListDataScreen()));
                    },
                    child: MenuContainer("List\nData")),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => EntryKeluhanScreen()));
                  },
                    child: MenuContainer("Entry\nKeluhan")),
                InkWell(
                    onTap: (){
                      if (Platform.isAndroid){
                        SystemNavigator.pop();
                      } else {
                        exit(0);
                      }
                    },
                    child: MenuContainer("Keluar \n Aplikasi")),
              ],
            )
          ],
        )
      ),
    );
  }
}
