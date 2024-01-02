import 'package:flutter/material.dart';

void showErrorMessage(BuildContext context, {required String message}) {
  final snackBar = SnackBar(
    backgroundColor: Colors.red,
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSuccessfullyMessage(BuildContext context, {required String message}) {
  final snackBar = SnackBar(
    backgroundColor: Colors.black,
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
