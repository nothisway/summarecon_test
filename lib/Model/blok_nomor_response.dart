import 'dart:convert';

BlokNomorResponse blokNomorResponseFromJson(String str) => BlokNomorResponse.fromJson(json.decode(str));

String blokNomorResponseToJson(BlokNomorResponse data) => json.encode(data.toJson());

class BlokNomorResponse {
  BlokNomorResponse({
    this.dataBlokNomor,
  });

  List<DataBlokNomor> dataBlokNomor;

  factory BlokNomorResponse.fromJson(Map<String, dynamic> json) => BlokNomorResponse(
    dataBlokNomor: json["DataBlokNomor"] == null ? null : List<DataBlokNomor>.from(json["DataBlokNomor"].map((x) => DataBlokNomor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "DataBlokNomor": dataBlokNomor == null ? null : List<dynamic>.from(dataBlokNomor.map((x) => x.toJson())),
  };
}

class DataBlokNomor {
  DataBlokNomor({
    this.blokno,
  });

  String blokno;

  factory DataBlokNomor.fromJson(Map<String, dynamic> json) => DataBlokNomor(
    blokno: json["BLOKNO"] == null ? null : json["BLOKNO"],
  );

  Map<String, dynamic> toJson() => {
    "BLOKNO": blokno == null ? null : blokno,
  };
}
