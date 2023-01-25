import 'package:flutter/material.dart';
import 'package:walletapp/screen/home/home_screen.dart';
import 'package:walletapp/screen/login/login.dart';
import 'package:walletapp/screen/post/post.dart';
import 'package:walletapp/screen/post/video.dart';
import 'package:walletapp/screen/products/products.dart';

class RouteGenerator {
  static Route<dynamic>generateRoute(RouteSettings settings){
    switch (settings.name){
      case'/':
        return MaterialPageRoute(builder: (_)=>const HomeScreen());
      case '/login':
        return MaterialPageRoute(builder: (_)=>const LoginScreen());
      case'/post':
        return MaterialPageRoute(builder: (_)=>const PostScreen());
      case'/video':
        return MaterialPageRoute(builder: (_)=>const VideoScreen());
      case'/products':
        return MaterialPageRoute(builder: (_)=>const ProductsScreen());
      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: const Text('No Route'),
        ),
        body: const Center(
          child: Text('Sorry no found page'),
        ),
      );
    });
  }
}

