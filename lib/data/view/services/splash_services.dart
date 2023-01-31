import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../../models/user_model.dart';
import '../user_view_model.dart';

class SplashServices {
  Future <UserModel> getUserDate()=> UserViewModel().getUser();
  void checkAuthentication(BuildContext context)async{
    getUserDate().then((value){
      if (value.token == null || value.token == ""){
        Navigator.pushNamed(context, '/login');
      }else {
        Navigator.pushNamed(context, "/home");
      }
      
    }).onError((error, stackTrace){
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}