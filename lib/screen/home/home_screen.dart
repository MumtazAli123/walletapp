import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walletapp/data/view/user_view_model.dart';
import '../../widget/floating_button/floating_button.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: const CustomFloating(),
    );
  }
  _buildAppBar(){
    final userPreference = Provider.of<UserViewModel>(context);
    return AppBar(
      title: const Text('Home'),
      leading: IconButton(onPressed: () {
        userPreference.remove().then((value){
          Navigator.pushNamed(context, '/login');
        });

      }, icon: const Icon(Icons.lock),),
    );
  }
  _buildBody(){
    return Center(
      child:  SizedBox(
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Enter Title ')
              ),
            ),

            // Image.file(file)
          ],
        ),
      ),
    );
  }
}
