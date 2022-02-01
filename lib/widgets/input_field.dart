import 'package:flutter/material.dart';
import 'package:student_app/constants.dart';

class InputField extends StatelessWidget {
  final String hint;
  final Function(String) onChanged;
  final TextInputType type;
  final String? Function(String?)? validator;
  const InputField({
    Key? key,
    required this.hint,
    required this.onChanged,
    required this.validator,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: TextFormField(
        keyboardType: type,
        validator: validator,
        onChanged: onChanged,
        textCapitalization: TextCapitalization.words,
        autocorrect: true,
        style: kBodyTextStyle,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          filled: true,
          border: InputBorder.none,
          hintText: hint,
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
}
