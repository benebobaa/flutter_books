import 'package:flutter_glori_new/features/register/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameControler = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: const EdgeInsets.all(24),
          child: ListView(
            children: [
              const SizedBox(height: 65),
              _header(context),
              const SizedBox(height: 35),
              _inputField(context),
              _forgotPassword(context),
              const SizedBox(height: 35),
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
        Text("Welcome Nerds!",
            style:
                TextStyle(fontSize: 20, color: Colors.white, letterSpacing: 6)),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          style: const TextStyle(color: Colors.white),
          controller: usernameControler,
          decoration: InputDecoration(
              hintText: "Username",
              hintStyle: const TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.person, color: Colors.white)),
        ),
        const SizedBox(height: 10),
        TextField(
          style: const TextStyle(color: Colors.white),
          controller: passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            hintStyle: const TextStyle(color: Colors.white),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.lock, color: Colors.white),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 10),
        TextField(
          style: const TextStyle(color: Colors.white),
          controller: confirmPassController,
          decoration: InputDecoration(
            hintText: "Confirm Password",
            hintStyle: const TextStyle(color: Colors.white),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.lock_person, color: Colors.white),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 10),
        Consumer<RegisterViewModel>(
            builder: (context, vm, child) => ElevatedButton(
                  onPressed: (vm.isLoading)
                      ? null
                      : () {
                          vm.isLoading = true;
                          vm.register(
                              context,
                              usernameControler.text,
                              passwordController.text,
                              confirmPassController.text);
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
                          "Register",
                          style: TextStyle(fontSize: 20),
                        ),
                )),
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(onPressed: () {}, child: const Text(""));
  }

  _signup(context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text("Already Have an Account? ",
          style: TextStyle(color: Colors.white, fontSize: 15)),
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Login",
              style: TextStyle(fontSize: 15, color: Color(0xFFE69316))))
    ]);
  }
}
