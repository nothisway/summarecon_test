import 'package:flutter/material.dart';
import 'package:summarecon_test/Network/list_data_repo.dart';
import 'package:summarecon_test/Reusable/data_item.dart';
import 'package:summarecon_test/Screen/ListData/list_data_detail_screen.dart';

class ListDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Data"),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
          future: ListDataRepo().getNomorBlok(),
          builder: (context, snapshot){
            if (snapshot.hasData){
              return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index){
                    return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ListDataDetailScreen(snapshot.data.dataBlokNomor[index].blokno.toString())));
                        },
                        child: DataItem(snapshot.data.dataBlokNomor[index].blokno));
                  });
            } else if (snapshot.hasError){
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Center(
                  child: Text(snapshot.error),
                ),
              );
            } else {
              return Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        )
      ),
    );
  }
}

