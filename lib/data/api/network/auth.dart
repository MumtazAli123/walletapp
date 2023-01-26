import 'package:walletapp/data/api/network/BaseApi.dart';
import 'package:walletapp/data/api/network/NetworkApi.dart';
import 'package:walletapp/data/api/network/app_url.dart';

class AuthRepository{
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi()async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.baseUrl, data)

    }catch(e) {
      rethrow;

    }

  }
}