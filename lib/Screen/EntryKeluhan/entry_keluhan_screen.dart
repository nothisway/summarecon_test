import 'package:flutter/material.dart';
import 'package:summarecon_test/Model/blok_nomor_response.dart';
import 'package:summarecon_test/Network/entry_keluhan_repo.dart';
import 'package:summarecon_test/Network/list_data_repo.dart';
import 'package:toast/toast.dart';

class EntryKeluhanScreen extends StatefulWidget {
  @override
  _EntryKeluhanScreenState createState() => _EntryKeluhanScreenState();
}

class _EntryKeluhanScreenState extends State<EntryKeluhanScreen> {
  String blokNomorValue = "";
  String selectedLocation = "RUANG TAMU";

  TextEditingController _keluhanController = new TextEditingController();
  BlokNomorResponse _blokNomorResponse;

  List<String> blkNoList = [];
  bool filledForm = false;

  _getBlokNo() async {
    ListDataRepo().getNomorBlok().then((value) {
      blkNoList.clear();
      setState(() {
        value.dataBlokNomor.forEach((element) {
          blkNoList.add(element.blokno);
          blokNomorValue = blkNoList[0];
        });
      });
    });
  }


  @override
  void initState() {
    _getBlokNo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entry Keluhan"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: ListView(
        children: [
          Text("Blok Nomor", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1)
            ),
            child: DropdownButton<String>(
              value: blokNomorValue,
              icon: const Icon(Icons.keyboard_arrow_down),
              isExpanded: true,
              iconSize: 24,
              style: const TextStyle(color: Colors.black),
              onChanged: (newValue) {
                setState(() {
                  blokNomorValue = newValue;
                });
              },
              items: blkNoList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text("Lokasi", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1)
            ),
            child: DropdownButton<String>(
              value: selectedLocation,
              icon: const Icon(Icons.keyboard_arrow_down),
              isExpanded: true,
              iconSize: 24,
              style: const TextStyle(color: Colors.black),
              onChanged: (newLokasi) {
                setState(() {
                  selectedLocation = newLokasi;
                });
              },
              items: <String>['RUANG TAMU', 'KAMAR MANDI', 'KAMAR TIDUR', 'BALKON']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),

          SizedBox(
            height: 40,
          ),

          Text("Keluhan", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: _keluhanController,
            maxLines: 5,
            onChanged: (value){
              if(value.isNotEmpty){
                setState(() {
                  filledForm = true;
                });
              } else {
                setState(() {
                  filledForm = false;
                });
              }
            },
            decoration: InputDecoration(
              hintText: "Input Keluhan",
              counter: Container(),
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.black)),
            ),
          ),

          SizedBox(
            height: 10,
          ),

          RaisedButton(
            onPressed: filledForm ? (){
              EntryKeluhanRepo().insDataKeluhan(blokNomorValue, selectedLocation, _keluhanController.text).then((value) {
                if (value == true){
                  Toast.show("Data Berhasil Diinput", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                } else {
                  Toast.show("Mohon Maaf Terjadi Kesalahan", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

                }
              });
            }: null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            color: Colors.orange,
            child: Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Text("SUBMIT", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)),
            ),
          )
        ],
      )),
    );
  }
}
