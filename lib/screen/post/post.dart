import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:walletapp/widget/floating_button/floating_button.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController textController = TextEditingController();

  File? imagePath;
  String? imageTitle;
  String? imageData;
  ImagePicker imagePicker = ImagePicker();

  Future<void> getImage() async {
    var getImage = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagePath = File(getImage!.path);
      if (kDebugMode) {
        print(imagePath);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: const CustomFloating(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('Post'),
    );
  }

  _buildBody() {
    return Center(
      child: SizedBox(
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('Enter Title ')),
            ),
            const SizedBox(height: 10,),
            imagePath != null ? Image.file(imagePath!): const Text('image not found yet'),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  getImage();
                },
                icon: const Icon(Icons.image),
                label: const Text('Upload Image'))
          ],
        ),
      ),
    );
  }
}
