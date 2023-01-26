import 'package:flutter/material.dart';
import 'package:walletapp/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

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
    final height = MediaQuery.of(context).size.height * 1;
    return SafeArea(
      child: Center(
        child: SizedBox(width: 380,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
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
                      controller: passwordController,
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

               SizedBox(height: height * 0.1,),
              ElevatedButton.icon(
                  onPressed: () {
                    Utils.snackBar('No Internet connection', context);
                    Utils.flushBarErrorMessage("No Internet connection",  context);
                    Navigator.pushNamed(context, '/home');
                  },
                  icon: const Icon(Icons.person),
                  label: const Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}
