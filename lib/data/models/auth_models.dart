import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:walletapp/data/api/network/auth.dart';
import 'package:walletapp/utils/utils.dart';

class AuthViewModels with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
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
        Utils.flushBarErrorMessage('No internet', context);
        print(error.toString());
      }

    });
  }

}