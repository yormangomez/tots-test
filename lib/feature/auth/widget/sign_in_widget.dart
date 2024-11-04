// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:tots/app/bloc/app_bloc.dart';
import 'package:tots/feature/auth/bloc/auth_bloc.dart';
import 'package:tots/feature/main_dashboard/widget/paint_clipper.dart';
import 'package:tots_ui/tots_ui.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  String email = '';
  final emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
  );
  final RegExp passwordUpperCase = RegExp('[A-Z]');
  final RegExp passwordMayu = RegExp('[A-Za-z]');
  final RegExp passwordNum = RegExp('[0-9]');
  final RegExp specialCharacters = RegExp(r'[^a-zA-Z\d]');
  final formKey = GlobalKey<FormState>();

  bool isVisible = false;
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: Stack(
            children: [
              Positioned(
                top: -80,
                left: 300,
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 0.5),
                  duration: const Duration(seconds: 2),
                  builder: (context, opacity, child) {
                    return Opacity(
                      opacity: opacity,
                      child: ClipPath(
                        clipper: PaintClipper(), // Usa el clipper personalizado
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE4F353),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFE4F353).withOpacity(0.6),
                                offset: const Offset(0.5, 0.5),
                                blurRadius: 8,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 250,
                right: 400,
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 0.5),
                  duration: const Duration(seconds: 2),
                  builder: (context, opacity, child) {
                    return Opacity(
                      opacity: opacity,
                      child: ClipPath(
                        clipper: PaintClipper(), // Usa el clipper personalizado
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE4F353),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFE4F353).withOpacity(0.6),
                                offset: const Offset(0.5, 0.5),
                                blurRadius: 8,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 92,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 52),
                      child: Image.network(
                        'https://s3-alpha-sig.figma.com/img/3f9d/fba5/9cc32ba3aad3e60f4a9d383ad2b48eac?Expires=1731283200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=JZ5FIQTiJjF-9snJwXrj2rbSi-vki0C-jTKQja3uwq9EUHuGtNf3lWrpgh4L-ESvOI-XZL5mxodT9TdlBI6B04PsxB-0tQH-KRqWteHdNT6SukrsGP2a2sqqeUNUQTWqmbUEC9u55rmAvBiqpGqpKWz1rzwTPIq5Hk7qEBFx-Hm~XU73pgjlrp8JSHv4OuXQBZ-yt7tmfmVU7yDNMeheOwbgn1Qk1OdUHwtlEbBKWk52QiMXPnjB-3XbXD~pebGnu8KGbI~tG59~ULPnFjqK0uTj~g8-Gcpa6WsyvDCUReY0ZqMb4H732mIQt0boJznp5HT5jBuzjOsns7SiS6KNNg__',
                        width: 250,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      'LOG IN',
                      style: UITextStyle.labels.label.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 42),
                      child: TextFormField(
                        controller: controllerEmail,
                        autofillHints: const [AutofillHints.username],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Campo requerido";
                          }
                          return null;
                        },
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: 'Main',
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(68),
                            borderSide: const BorderSide(
                              color: Color(0xff1F1D2B9C),
                            ),
                          ),
                          hintStyle: const TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          hoverColor: AppColors.transparent,
                          fillColor: AppColors.transparent,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 42),
                      child: TextFormField(
                        controller: controllerPassword,
                        autofillHints: const [AutofillHints.password],
                        obscureText: showPassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Campo requerido";
                          }
                          return null;
                        },
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            child: showPassword
                                ? const Icon(
                                    Icons.visibility_off,
                                    size: 32,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    size: 32,
                                  ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(68),
                            borderSide: const BorderSide(
                              color: Color(0xff1F1D2B9C),
                            ),
                          ),
                          hintStyle: const TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          hoverColor: AppColors.transparent,
                          fillColor: AppColors.transparent,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 52,
                    ),
                    BlocBuilder<AppBloc, AppState>(
                      builder: (context, state) {
                        return state.signIn
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xFFE4F353),
                                  backgroundColor: AppColors.primaryYello,
                                ),
                              )
                            : SizedBox(
                                height: 52,
                                width: 296,
                                child: ElevatedButton(
                                  onPressed: () {
                                    formKey.currentState!.validate();
                                    if (controllerEmail.text.isNotEmpty &&
                                        controllerPassword.text.isNotEmpty &&
                                        passwordUpperCase.hasMatch(
                                            controllerPassword.text) &&
                                        passwordNum.hasMatch(
                                            controllerPassword.text)) {
                                      BlocProvider.of<AppBloc>(context).add(
                                        const signInEvent(
                                          signIn: true,
                                        ),
                                      );
                                      context.read<AuthBloc>().login(
                                            context,
                                            email: controllerEmail.text
                                                .toLowerCase(),
                                            password: controllerPassword.text,
                                            onSuccess: (value) async {},
                                          );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    elevation: 5,
                                  ),
                                  child: const Text(
                                    'LOG IN',
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontFamily: 'DrukText',
                                        package: 'packages/klg_ui',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: () {
                        context.read<AuthBloc>().add(
                              AuthIndexEvent(
                                  authIndex: state.authIndex == 0 ? 1 : 2),
                            );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: '¿No tienes una cuenta? ',
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                              TextSpan(
                                text: ' Regístrate ahora.',
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
