import 'package:flutter/material.dart';
import 'package:walletapp/widget/floating_button/floating_button.dart';


class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
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
      title: const Text('Upload Video'),
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
