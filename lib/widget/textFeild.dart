import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField({Key? key,required this.hintText,this.labelText,required this.onChanged,this.inputType, this.security = false,this.textInitial}) : super(key: key);
  String hintText;
  Function(String text)? onChanged;
  bool? security;
  TextInputType ? inputType;
  String? textInitial;
  String? labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: TextEditingController()..text = textInitial!,
        keyboardType: inputType,
        obscureText: security!,
        validator: (data){
          if(data!.isEmpty)
            {
              return 'please enter the required';
            }
        },
        onChanged:onChanged ,
        style: TextStyle(color: Colors.black,fontSize: 18),
        decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Colors.black,
            ),
            labelText: labelText,
            hintText: hintText,
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6),borderSide: BorderSide(color: Colors.blue,width: 1.5)),
            errorBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(6),borderSide: BorderSide(color: Colors.red,width: 1.5)) ,
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple,width: 2),borderRadius: BorderRadius.circular(6))
        ),
      ),
    );
  }
}
