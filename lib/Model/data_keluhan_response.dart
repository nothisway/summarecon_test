import 'dart:convert';

DataKeluhanResponse dataKeluhanResponseFromJson(String str) => DataKeluhanResponse.fromJson(json.decode(str));

String dataKeluhanResponseToJson(DataKeluhanResponse data) => json.encode(data.toJson());

class DataKeluhanResponse {
  DataKeluhanResponse({
    this.dataKeluhan,
  });

  List<DataKeluhan> dataKeluhan;

  factory DataKeluhanResponse.fromJson(Map<String, dynamic> json) => DataKeluhanResponse(
    dataKeluhan: json["DataKeluhan"] == null ? null : List<DataKeluhan>.from(json["DataKeluhan"].map((x) => DataKeluhan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "DataKeluhan": dataKeluhan == null ? null : List<dynamic>.from(dataKeluhan.map((x) => x.toJson())),
  };
}

class DataKeluhan {
  DataKeluhan({
    this.id,
    this.blokno,
    this.lokasi,
    this.keluhan,
  });

  String id;
  String blokno;
  String lokasi;
  String keluhan;

  factory DataKeluhan.fromJson(Map<String, dynamic> json) => DataKeluhan(
    id: json["ID"] == null ? null : json["ID"],
    blokno: json["BLOKNO"] == null ? null : json["BLOKNO"],
    lokasi: json["LOKASI"] == null ? null : json["LOKASI"],
    keluhan: json["KELUHAN"] == null ? null : json["KELUHAN"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id == null ? null : id,
    "BLOKNO": blokno == null ? null : blokno,
    "LOKASI": lokasi == null ? null : lokasi,
    "KELUHAN": keluhan == null ? null : keluhan,
  };
}
