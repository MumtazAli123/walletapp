import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../../models/user_model.dart';
import '../user_view_model.dart';

class SplashServices {
  Future <UserModel> getUserDate()=> UserViewModel().getUser();
  void checkAuthentication(BuildContext context)async{
    getUserDate().then((value) async {
      if (value.token == 'null' || value.token == ""){
       await Future.delayed(const Duration(seconds: 4));
       Navigator.pushNamed(context, '/login');


      }else {
        await Future.delayed(const Duration(seconds: 4));
         Navigator.pushNamed(context, "/home");

      }
      
    }).onError((error, stackTrace){
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}