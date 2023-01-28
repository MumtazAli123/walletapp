import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walletapp/data/models/auth_models.dart';
import 'package:walletapp/data/view/user_view_model.dart';
import 'package:walletapp/route/route.dart';
import 'constants/provider/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  static const String title = 'Light & Dark Theme';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>AuthViewModels()),
      ChangeNotifierProvider(create: (_)=>UserViewModel()),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}


