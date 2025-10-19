import 'package:blog_app/core/common/widgets/custom_button.dart';
import 'package:blog_app/core/constants/string_constants.dart';
import 'package:blog_app/core/extension/size_extension.dart';
import 'package:blog_app/core/theme/palette.dart';
import 'package:blog_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //-- variables
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //-- login text
              Text(
                StringConstants.logInText,
                style: GoogleFonts.poppins(
                  fontSize: context.width * 0.1,
                  fontWeight: FontWeight.w700,
                  color: Palette.secondaryColor,
                ),
              ),

              //-- email field
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CustomTextFormField(
                  emailController: emailController,
                  labelText: StringConstants.emailText,
                ),
              ),

              //-- password field
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: CustomTextFormField(
                  emailController: emailController,
                  labelText: StringConstants.passwordText,
                ),
              ),

              //-- dont have an account text
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont Have an Account?',
                      style: GoogleFonts.poppins(
                        fontSize: context.height * 0.018,
                        fontWeight: FontWeight.w700,
                        color: Palette.secondaryColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context.go('/signUp'),
                      child: Text(
                        ' Sign Up',
                        style: GoogleFonts.poppins(
                          decoration: TextDecoration.underline,
                          fontSize: context.height * 0.018,
                          fontWeight: FontWeight.w700,
                          color: Palette.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //-- login button
              CustomButton(
                onPressed: () {},
                borderRadius: 20,
                buttonHeight: context.height * 0.06,
                buttonWidth: context.width * 0.55,
                buttonText: StringConstants.logInText,
                bgColor: Palette.buttonColor,
                margin: const EdgeInsets.only(top: 15),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
