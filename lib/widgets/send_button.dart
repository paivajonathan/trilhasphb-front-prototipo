import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        print(firstNameController.text);
        print(lastNameController.text);
        firstNameController.clear();
        lastNameController.clear();
      },
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.black),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        padding: WidgetStatePropertyAll(
            EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10)),
      ),
      child: const Text('Enviar', style: TextStyle(fontSize: 20)),
    );
  }
}

