import 'package:blog_app/core/common/widgets/custom_button.dart';
import 'package:blog_app/core/common/widgets/loader.dart';
import 'package:blog_app/core/constants/string_constants.dart';
import 'package:blog_app/core/extension/size_extension.dart';
import 'package:blog_app/core/theme/palette.dart';
import 'package:blog_app/core/utils/show_snackbar.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //-- variables
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthFailure) {
                return showCustomSnackBar(context: context, content: state.message);
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return Loader();
              }
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: context.height * 0.2),
                      Text(
                        StringConstants.signUpText,
                        style: GoogleFonts.poppins(
                          fontSize: context.width * 0.1,
                          fontWeight: FontWeight.w700,
                          color: Palette.secondaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: CustomTextFormField(
                          emailController: nameController,
                          labelText: StringConstants.nameText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: CustomTextFormField(
                          emailController: emailController,
                          labelText: StringConstants.emailText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: CustomTextFormField(
                          emailController: passwordController,
                          labelText: StringConstants.passwordText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already Have an Account?',
                              style: GoogleFonts.poppins(
                                fontSize: context.height * 0.018,
                                fontWeight: FontWeight.w700,
                                color: Palette.secondaryColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.go('/login');
                              },
                              child: Text(
                                ' Log in here',
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

                      CustomButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                              AuthSignUp(
                                name: nameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
                          }
                        },
                        borderRadius: 20,
                        buttonHeight: context.height * 0.06,
                        buttonWidth: context.width * 0.55,
                        buttonText: StringConstants.signUpText,
                        bgColor: Palette.buttonColor,
                        margin: const EdgeInsets.only(top: 15),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
