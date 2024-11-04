import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tots/feature/main_dashboard/bloc/client_bloc.dart';
import 'package:tots_ui/tots_ui.dart';

class AppCreaterModal extends StatefulWidget {
  const AppCreaterModal({Key? key}) : super(key: key);

  @override
  _AppCreaterModalState createState() => _AppCreaterModalState();
}

class _AppCreaterModalState extends State<AppCreaterModal> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController controllerFirstName = TextEditingController();
  final TextEditingController controllerLastName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.whiteCard,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppSpacing.lg),
                  topLeft: Radius.circular(AppSpacing.lg),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 25,
                        ),
                        child: Text(
                          'Add new client',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      Center(
                        child: Container(
                          height: 119,
                          width: 119,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image,
                                color: Colors.grey[400],
                              ),
                              const Text(
                                'Upload image',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      TextFormField(
                        controller: controllerFirstName,
                        //  keyboardType: TextInputType.emailAddress,
                        autofillHints: const [AutofillHints.username],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Campo requerido";
                          }
                          return null;
                        },
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: 'First name*',
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
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: controllerLastName,
                        //  keyboardType: TextInputType.emailAddress,
                        autofillHints: const [AutofillHints.username],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Campo requerido";
                          }
                          return null;
                        },
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: 'Last name*',
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
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: controllerEmail,
                        //  keyboardType: TextInputType.emailAddress,
                        autofillHints: const [AutofillHints.username],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Campo requerido";
                          }
                          return null;
                        },
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: 'Email address*',
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
                      const SizedBox(
                        height: 48,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 159,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          InkWell(
                            onTap: () {
                              _formKey.currentState!.validate();
                              if (controllerFirstName.text.isNotEmpty &&
                                  controllerFirstName.text.isNotEmpty &&
                                  controllerEmail.text.isNotEmpty) {
                                context.read<ClientBloc>().add(
                                      CreaterClientEvent(
                                        firstName: controllerFirstName.text,
                                        lastName: controllerLastName.text,
                                        email: controllerEmail.text,
                                        context: context,
                                      ),
                                    );
                              }
                            },
                            child: Container(
                              height: 46,
                              width: 159,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: const Center(
                                child: Text(
                                  'SAVE',
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
