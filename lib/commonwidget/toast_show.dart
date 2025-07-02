import 'package:flutter/material.dart';


void showToast(BuildContext context,String message){
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: 1),
    content: Text(message),));

}

