import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_resto_fic14/core/assets/assets.gen.dart';
import 'package:pos_resto_fic14/core/components/buttons.dart';
import 'package:pos_resto_fic14/core/components/custom_text_field.dart';
import 'package:pos_resto_fic14/core/components/spaces.dart';
import 'package:pos_resto_fic14/core/constants/colors.dart';
import 'package:pos_resto_fic14/presentation/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 124.0, vertical: 20.0),
        children: [
          const SpaceHeight(80.0),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130.0),
              child: SvgPicture.asset(
                Assets.icons.homeResto.path,
                width: 100,
                height: 100,
                // ignore: deprecated_member_use
                color: AppColors.primary,
              )),
          const SpaceHeight(24.0),
          const Center(
            child: Text(
              'POS RESTO BATCH 14',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          const SpaceHeight(8.0),
          const Center(
            child: Text(
              'Akses Login Kasir',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ),
          const SpaceHeight(40.0),
          CustomTextField(
            controller: usernameController,
            label: 'Username',
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            controller: passwordController,
            label: 'Password',
            obscureText: true,
          ),
          const SpaceHeight(24.0),
          Button.filled(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            label: 'Masuk',
          ),
        ],
      ),
    );
  }
}
