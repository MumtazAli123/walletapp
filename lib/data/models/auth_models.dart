import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:walletapp/data/api/network/auth.dart';
import 'package:walletapp/utils/utils.dart';

class AuthViewModels with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  late bool _signupLoading = false;
  bool get signupLoading => _signupLoading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  setSignupLoading(bool value){
    _signupLoading = value;
    notifyListeners();
  }

  Future<void> loginApi (dynamic data, BuildContext context)async{
    setLoading(true);
    _myRepo.loginApi(data).then((value){
      setLoading(false);
      Utils.snackBar("Login Successfully", context);
      Navigator.pushNamed(context, '/home');
      if (kDebugMode) {
        print(value.toString());
      }

    }).onError((error, stackTrace){
      setLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage('Email or password wrong', context);
        print(error.toString());
      }

    });
  }
  Future<void> registerApi (dynamic data, BuildContext context)async{
    setSignupLoading(true);
    _myRepo.registerApi(data).then((value){
      setSignupLoading(false);
      Utils.snackBar("Register Successfully", context);
      Navigator.pushNamed(context, '/home');
      if (kDebugMode) {
        print(value.toString());
      }

    }).onError((error, stackTrace){
      setSignupLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }

    });
  }

}