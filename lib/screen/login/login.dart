import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walletapp/data/models/auth_models.dart';
import 'package:walletapp/data/utils/utils.dart';
import 'package:walletapp/widget/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> obsecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    obsecurePassword.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('Login'),
    );
  }

  _buildBody() {
    final authViewModel = Provider.of<AuthViewModels>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return SafeArea(
      child: Center(
        child: SizedBox(width: 380,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    label: Text('Enter Email ')
                ),
                onFieldSubmitted: (value){
                  Utils.focusChange(context, emailFocusNode, passwordFocusNode);
                },
              ),
              const SizedBox(height: 20,),
              ValueListenableBuilder(
                  valueListenable: obsecurePassword,
                  builder: (context, value, child ){
                    return TextFormField(
                      obscureText: obsecurePassword.value,
                      controller: _passwordController,
                      decoration:  InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: (){
                              obsecurePassword.value =!obsecurePassword.value;
                            },icon:  Icon(obsecurePassword.value?
                          Icons.visibility_off_outlined : Icons.visibility),
                          ),
                          border: const OutlineInputBorder(),
                          label: const Text('Enter Password ')
                      ),
                    );
                  }),

               SizedBox(height: height * 0.058,),
                CustomButton(
                  loading: authViewModel.loading,
                    title: 'Submit', onPress: (){
                  if (_emailController.text.isEmpty){
                    Utils.snackBar1('Plz Enter Email', context);
                    Utils.flushBarErrorMessage("Plz Enter Email", context);
                  }else if(_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage("Plz Enter Password", context);
                  }else if(_passwordController.text.length < 4) {
                    Utils.flushBarErrorMessage("Plz Enter 4 Digit Password", context);
                  }else {
                    Map data = {
                      "email": _emailController.text.toString(),
                      "password": _passwordController.text.toString(),
                    };
                    authViewModel.loginApi(data, context);
                  }
                }, icon: Icons.person),
              SizedBox(height: height * 0.04,),
              Row(
                children:  [
                  const Text('Before not register ? '),
                  const Spacer(),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, '/signup');
                  }, child: const Text('Register now')),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
