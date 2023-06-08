import 'package:flutter_glori_new/features/splash/splash_viewmodel.dart';
import 'package:flutter_glori_new/features/nav_bar/nav_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashViewModel splashViewModel;
  @override
  void initState() {
    super.initState();
    splashViewModel = Provider.of<SplashViewModel>(context, listen: false);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NavBar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Lukea.",
          style: TextStyle(
              fontSize: 80, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
