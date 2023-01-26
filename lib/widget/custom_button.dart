import 'package:flutter/material.dart';

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
    return SizedBox(
      width: 350,
      height: 40,
      child: ElevatedButton.icon(
          onPressed: onPress, icon: Icon(icon), label: Text(title)),
    );
  }
}
