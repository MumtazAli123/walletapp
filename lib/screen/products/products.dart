import 'package:flutter/material.dart';
import 'package:walletapp/widget/floating_button/floating_button.dart';



class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: const CustomFloating(),
    );
  }
  _buildAppBar(){
    return AppBar(
      title: const Text('Products'),
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
            )

            // Image.file(file)
          ],
        ),
      ),
    );
  }
}
