import 'package:default_project/main.dart';
import 'package:default_project/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: MyColors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: LottieBuilder.asset(
                "assets/lottie/no_internet_connection.json",
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
