import 'package:flutter/material.dart';
import 'package:walletapp/data/utils/utils.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  final IconData icon;
  const CustomButton(
      {Key? key,
      required this.title,
      this.loading = false,
      required this.onPress,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 40,
      color: Utils.buttonColor,
      child: ElevatedButton.icon(
          onPressed: onPress,
          icon: Icon(icon, size: 30),
          label: loading ? const CircularProgressIndicator(color: Colors.green,): Text(title, style: const TextStyle(fontSize: 20),)),
    );
  }
}
