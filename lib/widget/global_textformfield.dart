import 'package:flutter/material.dart';

class GlobalTextFormField extends StatelessWidget {
  GlobalTextFormField({super.key, this.maxLength = 50,
    this.selectValidator = true,
    this.initialValue,
   required this.onSaved,
  });

  final maxLength;
  final bool selectValidator;
 final String? initialValue;
  void Function(String?) onSaved;



  @override
  Widget build(BuildContext context) {
    return TextFormField(

      maxLength: maxLength,
      keyboardType: selectValidator !=true ? TextInputType.number:null,
      initialValue: initialValue,
      onSaved: onSaved,
      decoration: InputDecoration(
        label:selectValidator ? Text("İsim"):Text("Miktar"),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),

      ),
      validator: selectValidator ? (value) {
        if (value == null ||
            value.trim().length <= 1 ||
            value.trim().length > 50) {
          return "1 ile 50 arasında bir karakter olmalıdır.";
        }
        return null;
      }:(value) {
        if (value == null ||
            int.tryParse(value) == null ||
            int.tryParse(value)! <= 0) {
          return "Lütfen Pozitif bir sayı giriniz";
        }
        return null;
      },
    );
  }
}
