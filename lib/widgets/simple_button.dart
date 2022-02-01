import 'package:flutter/material.dart';
import 'package:student_app/constants.dart';

class SimpleButton extends StatelessWidget {
  final Function() click;
  final String text;
  const SimpleButton({
    Key? key,
    required this.text,
    required this.click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Colors.black.withOpacity(.4),
              offset: const Offset(2.8, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: kBodyTextStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
