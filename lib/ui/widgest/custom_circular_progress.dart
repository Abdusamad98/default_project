import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class CustomCircularProgressbar extends StatelessWidget {
  const CustomCircularProgressbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? const Center(child: CircularProgressIndicator())
        : const Center(
      child: CupertinoActivityIndicator(
        radius: 25,
      ),
    );
  }
}
