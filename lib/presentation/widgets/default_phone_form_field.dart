import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class DefaultPhoneFormField extends StatelessWidget {
  final TextEditingController? controller;
  final InputBorder? border;
  final String? hintText;
  final String? Function(String?)? validator;

  const DefaultPhoneFormField(
      {Key? key,
        required this.controller,
        this.border = const OutlineInputBorder(borderSide: BorderSide(width: 1)),
        this.hintText = 'Eg. 123456789', this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: CountryCodePicker(
          onChanged: print,
          initialSelection: 'EG',
          favorite: ['+20', 'EG'],
        ),
        isDense: true,
        border: border,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        hintTextDirection: TextDirection.ltr,
      ),
    );
  }
}