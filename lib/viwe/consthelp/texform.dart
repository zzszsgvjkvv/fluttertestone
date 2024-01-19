import 'package:flutter/material.dart';


// ignore: must_be_immutable
class Textformitm extends StatelessWidget {
  Textformitm({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
    required this.validator,
    required this.icon, this.TextInputType, required this.boolobscureText,
  });
  TextEditingController controller = TextEditingController();
  final String? Function(String? v) validator;
  final String hint;
  final String label;
  final Icon icon;
  final   TextInputType ;
 final  bool boolobscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: boolobscureText,
      keyboardType: TextInputType,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.secondaryContainer,
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(fontSize: 20),
          label: Text(label),
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary)),
    );
  }
}
