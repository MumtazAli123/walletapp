import 'package:flutter/material.dart';

class ImagePopup extends StatelessWidget {
  final String text;
  final String detail;
  final Function()? onTap;
  final IconData icon;
  const ImagePopup(
      {Key? key,
      required this.text,
      required this.detail,
      this.onTap,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(bottom: 20.0),
      content: Column(
        children: [
          Container(
            color: Colors.indigo,
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.cancel,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [

              const SizedBox(height: 20,),
              ElevatedButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(context, '/post');
                  }, icon: const Icon(Icons.image),
                  label: const Text("Add a photo")),
              const SizedBox(height: 20,),
              ElevatedButton.icon(onPressed: (){
                Navigator.pushNamed(context, '/video');
              }, icon: const Icon(Icons.video_camera_back),
                  label: const Text("Take a Video")),
              const SizedBox(height: 20,),
              ElevatedButton.icon(onPressed: (){
                Navigator.pushNamed(context, '/products');
              }, icon: const Icon(Icons.add_shopping_cart),
                  label: const Text("Upload Products")),
              const SizedBox(height: 20,),
            ],
          )
        ],
      ),
    );
  }
}
