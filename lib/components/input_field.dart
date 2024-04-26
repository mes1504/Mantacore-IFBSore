import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String? labelText;
  final FocusNode? focusNode;
  final IconData? icon;
  final Widget? trailing;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final bool isVisible;
  final String? errorText;

  const InputField({
    super.key,
    this.labelText,
    this.focusNode,
    this.icon,
    this.trailing,
    this.controller,
    this.validator,
    this.isVisible = true,
    this.errorText,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool focusText = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(() {
      setState(() {
        focusText = widget.focusNode!.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    widget.focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).textTheme.bodyMedium!.color!,
            width: 1
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).textTheme.bodyMedium!.color!,
            width: 2
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: widget.labelText,
        labelStyle: 
          focusText ? const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ) : null,
        errorText: widget.errorText,
        filled: true,
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.trailing
      ),
      obscureText: !widget.isVisible,
    );
  }
}