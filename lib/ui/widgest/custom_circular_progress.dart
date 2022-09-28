import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class CustomCircularProgressbar extends StatelessWidget {
  const CustomCircularProgressbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : const Scaffold(
            body: Center(
              child: CupertinoActivityIndicator(
                radius: 25,
              ),
            ),
          );
  }
}
