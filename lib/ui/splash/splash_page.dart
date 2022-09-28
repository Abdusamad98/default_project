import 'package:default_project/utils/color.dart';
import 'package:default_project/utils/constants.dart';
import 'package:default_project/utils/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Center(
        child: SvgPicture.asset(
          MyIcons.categ,
          width: 250,
          height: 250,
          color: MyColors.primaryColor,
        ),
      ),
    );
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, homePage);
    });
  }
}
