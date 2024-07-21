import 'package:flutter/material.dart';
import 'package:hello_world/widgets/custom_scaffold.dart';
import 'package:hello_world/widgets/input_text.dart';
import 'package:hello_world/widgets/send_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Cadastro',
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(50),
            child: Text(
              'Cadastro',
              style: TextStyle(fontSize: 30, shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 2.5,
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: InputText(hintText: 'Nome', controller: firstNameController),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InputText(hintText: 'Sobrenome', controller: lastNameController),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SendButton(firstNameController: firstNameController, lastNameController: lastNameController,),
          )
        ],
      ),
    );
  }
}
