import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextField({Key? key, required this.controller, required this.hintText }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ,
      validator: (val){
        if(val==null||val.isEmpty) {
          return "Digite o seu ${hintText}";
        }
        return null;
      },
      decoration: InputDecoration(
          hintText:hintText,
          border : OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          )
        )
      ),

    );
  }
}
