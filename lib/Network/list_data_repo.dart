
import 'package:dio/dio.dart';
import 'package:summarecon_test/Model/blok_nomor_response.dart';
import 'package:summarecon_test/Network/api_config.dart';

class ListDataRepo {

  Future<BlokNomorResponse> getNomorBlok() async {
    var dio = Dio();
    Response response;
    response = await dio.get(ApiConfig.getNomorBlok);
    print("response getNomorBlok : " + response.data.toString());
    BlokNomorResponse blokNomorResponse = BlokNomorResponse.fromJson(response.data);
    return blokNomorResponse;
  }
}