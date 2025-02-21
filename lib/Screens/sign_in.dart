import 'package:didfood/Screens/signup_process.dart';
import 'package:didfood/Screens/text_field.dart';
import 'package:didfood/backGround_Image.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscurePassword = true;

  GestureDetector eyeToggle() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _obscurePassword = !_obscurePassword;
        });
      },
      child: Icon(
        _obscurePassword ? Icons.visibility : Icons.visibility_off,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            const BackImage(),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 55.0),
                      child: Image(
                        image: AssetImage('assets/images/Group 1909.png'),
                        height: 214.85,
                        width: 120,
                      ),
                    ),
                    const SizedBox(height: 47.15),
                    const Text(
                      'Login To Your Account',
                      style: TextStyle(
                          fontFamily: 'Bentonsans_Bold', fontSize: 20),
                    ),
                    const SizedBox(height: 40.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: AppTextField(
                          controller: emailController, hintText: 'Email'),
                    ),
                    const SizedBox(height: 12.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: AppTextField(
                        controller: passwordController,
                        obscureText: _obscurePassword,
                        hintText: 'Password',
                        suffixIcon: eyeToggle(),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Or Continue With',
                      style: TextStyle(
                        fontFamily: 'Bentonsans_Bold',
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/facebook-3 1.png',
                            height: 25,
                            width: 25,
                          ),
                          label: const Text(
                            'Facebook',
                            style: TextStyle(
                              fontFamily: 'Bentonsans_Medium',
                              fontSize: 14,
                              color: Color(0xFF22242E),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFFFFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            fixedSize: const Size(152, 57),
                          ),
                        ),
                        const SizedBox(width: 21.0),
                        ElevatedButton.icon(
                          onPressed: () {},
                          label: const Text(
                            'Google',
                            style: TextStyle(
                              fontFamily: 'Bentonsans_Medium',
                              fontSize: 14,
                              color: Color(0xFF22242E),
                            ),
                          ),
                          icon: Image.asset(
                            'assets/images/google-icon 1.png',
                            height: 25,
                            width: 25,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFFFFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            fixedSize: const Size(152, 57),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF6B50F6),
                      ),
                      child: const Text(
                        'Forgot Your Password?',
                        style: TextStyle(
                            fontFamily: 'Bentonsans_Medium',
                            fontSize: 12,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    const SizedBox(height: 36.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6B50F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          fixedSize: const Size(157, 57)),
                      onPressed: (() => Signin()),
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'BentonSans_Bold',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const SignUpProcess(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(0.0, 1.0);
                              const end = Offset.zero;
                              const curve = Curves.ease;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF6B50F6),
                      ),
                      child: const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                            fontFamily: 'Bentonsans_Medium',
                            fontSize: 12,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
