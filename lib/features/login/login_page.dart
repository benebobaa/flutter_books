import 'package:flutter_glori_new/features/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glori_new/features/register/register_page.dart';
import 'package:provider/provider.dart';

class LoginPageFirst extends StatefulWidget {
  const LoginPageFirst({super.key});

  @override
  State<LoginPageFirst> createState() => _LoginPageFirstState();
}

class _LoginPageFirstState extends State<LoginPageFirst> {
  late LoginViewModel loginViewModel;
  final usernameControler = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
              _forgotPassword(context),
              _signup(context),
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: const [
        Text(
          "Lukea.",
          style: TextStyle(
              fontSize: 80, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text("Register Your Account",
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: usernameControler,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: "Username",
              hintStyle: const TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.white,
              )),
        ),
        const SizedBox(height: 10),
        Consumer<LoginViewModel>(
          builder: (context, vm, child) => TextField(
            controller: passwordController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: const TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.white,
              ),
              suffixIcon: IconButton(
                icon: vm.isVisible
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onPressed: () {
                  vm.isVisible = !vm.isVisible;
                },
                color: Colors.white,
              ),
            ),
            obscureText: vm.isVisible,
          ),
        ),
        const SizedBox(height: 10),
        Consumer<LoginViewModel>(
            builder: (context, vm, child) => ElevatedButton(
                  onPressed: (vm.isLoading)
                      ? null
                      : () {
                          vm.isLoading = true;
                          loginViewModel.login(context, usernameControler.text,
                              passwordController.text);
                        },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: const Color(0xFFE69316)),
                  child: (vm.isLoading)
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Login",
                          style: TextStyle(fontSize: 20),
                        ),
                )),
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(
        onPressed: () {},
        child: const Text(
          "Forgot password?",
          style: TextStyle(color: Color(0xFFE69316)),
        ));
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont have an account?", style: TextStyle(color: Colors.white)),
        TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage()));
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(color: Color(0xFFE69316)),
            ))
      ],
    );
  }
}
