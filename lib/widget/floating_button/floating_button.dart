import 'package:flutter/material.dart';
import '../popup/show_dialog.dart';

class CustomFloating extends StatelessWidget {
  const CustomFloating({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: (){
        showDialog(context: context, builder: (context){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ImagePopup(text: 'Upload Post', detail: 'Upload Image',
                  icon: Icons.camera_alt),

            ],
          );
        });

      },
    );
  }

}