import 'package:farm_furniture_factory/auth/ui/login_page.dart';
import 'package:farm_furniture_factory/constansts/image_constants.dart';
import 'package:farm_furniture_factory/constansts/string_constants.dart';
import 'package:farm_furniture_factory/home/ui/home_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final containerWidth =
        size.width / 3 < 350 ? size.width * 0.8 : size.width / 3;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height / 25),
              SizedBox(
                width: containerWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageConstants.appLogo,
                      height: size.height / 3,
                    ),
                    SizedBox(height: size.height / 25),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: AppStrings.nameLabel,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: size.height / 25),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: AppStrings.emailLabel,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: size.height / 25),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: AppStrings.passwordLabel,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: size.height / 25),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomePage()));
                        },
                        child: const Text(AppStrings.signUpButton),
                      ),
                    ),
                    SizedBox(height: size.height / 25),
                    const Text(
                      AppStrings.signUpAgreement,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: size.height / 25),
                    const Divider(),
                    SizedBox(height: size.height / 25),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                        },
                        child: const Text(AppStrings.alreadyHaveAccountButton),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
