
import 'package:dio/dio.dart';

import 'api_config.dart';

class EntryKeluhanRepo {
  Future<bool> insDataKeluhan(String blokNo, String lokasi, String keluhan) async {
    var dio = Dio();
    var formData = FormData.fromMap({
      'blokno': blokNo,
      'lokasi': lokasi,
      'keluhan': keluhan,
    });

    Response response;
    response = await dio.post(ApiConfig.instDataKeluhan, data: formData);
    print("response data keluhan : " + response.data.toString());
    if (response.data == true){
      return true;
    } else {
      return false;
    }
  }
}