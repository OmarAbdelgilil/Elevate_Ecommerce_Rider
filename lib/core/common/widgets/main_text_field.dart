import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.hint,
    this.label,
    this.isObscured = false,
    this.textInputType = TextInputType.text,
    this.cursorColor = Colors.black,
    this.readOnly = false,
    this.validation,
    this.onTap,
    this.maxLines = 1,
    this.customSuffixIcon,
    this.onCustomIconPressed,  this.onFilesPicked, this.customPrefixIcon, this.onPrefixPressed,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final String? hint;
  final String? label;
  final bool isObscured;
  final TextInputType textInputType;
  final Color cursorColor;
  final bool readOnly;
  final String? Function(String?)? validation;
  final void Function()? onTap;
  final int maxLines;
  final Widget? customSuffixIcon;
  final void Function()? onCustomIconPressed;


  final Widget? customPrefixIcon;
  final void Function()? onPrefixPressed;
  final void Function(List<File>?)? onFilesPicked;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ObscureTextCubit(isObscured),
      child: BlocBuilder<ObscureTextCubit, bool>(
        builder: (context, isObscuredState) {
          return TextFormField(
            controller: controller,

            focusNode: focusNode,
            obscureText: isObscured ? isObscuredState : false,
            keyboardType: textInputType,
            cursorColor: cursorColor,
            readOnly: readOnly,
            maxLines: maxLines,
            onTap: onTap,
            textInputAction: nextFocus == null ? TextInputAction.done : TextInputAction.next,
            onEditingComplete: () {
              focusNode?.unfocus();
              if (nextFocus != null) {
                FocusScope.of(context).requestFocus(nextFocus);
              }
            },
            validator: validation,
            decoration: InputDecoration(
              label: Text(label ?? ''),
              hintText: hint,
              border: const OutlineInputBorder(),
prefixIcon: customPrefixIcon != null
                  ? IconButton(
                icon: customPrefixIcon!,
                onPressed: onPrefixPressed,
              )
                  : null,
              suffixIcon: customSuffixIcon != null
                  ? IconButton(
                icon: customSuffixIcon!,
                onPressed: onCustomIconPressed,
              )
                  : (isObscured
                  ? IconButton(
                icon: Icon(
                  isObscuredState ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  context.read<ObscureTextCubit>().toggleObscure();
                },
              )
                  : null),
            ),
          );
        },
      ),
    );
  }




}

class ObscureTextCubit extends Cubit<bool> {
  ObscureTextCubit(bool initialState) : super(initialState);

  void toggleObscure() => emit(!state);
}
