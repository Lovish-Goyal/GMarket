import 'package:flutter/material.dart';
import 'package:utils_widget/utils_widget.dart';

void customSuccessNotice(String message) {
  showSuccessNotice(
    leading: Icon(Icons.check_circle_sharp, color: Colors.white, size: 30),
    "Success",
    message,
  );
}

void customErrorNotice(String message) {
  showErrorNotice(
    leading: Icon(Icons.error, color: Colors.white, size: 30),
    "Error",
    message,
  );
}

void customInfoNotice(String message) {
  showInfoNotice(
    leading: Icon(Icons.info, color: Colors.white, size: 30),
    "Information",
    message,
  );
}
