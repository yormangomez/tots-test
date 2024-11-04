import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tots/feature/main_dashboard/bloc/client_bloc.dart';
import 'package:tots_ui/tots_ui.dart';

class AppUpdateModal extends StatefulWidget {
  const AppUpdateModal({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.id,
  });
  final String firstName;
  final String lastName;
  final String email;
  final String id;

  @override
  _AppUpdateModalState createState() => _AppUpdateModalState();
}

class _AppUpdateModalState extends State<AppUpdateModal> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController controllerFirstName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  @override
  void initState() {
    super.initState();

    controllerFirstName = TextEditingController(text: widget.firstName);
    controllerLastName = TextEditingController(text: widget.lastName);
    controllerEmail = TextEditingController(text: widget.email);
  }

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
                          'Edit client',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      const Center(
                        child: SizedBox(
                          height: 119,
                          width: 119,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://gravatar.com/avatar/00e6b1a1b95675680ba8dafabe92d850?s=400&d=robohash&r=x",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      TextFormField(
                        controller: controllerFirstName,
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
                                      UpdateClientEvent(
                                        firstName: controllerFirstName.text,
                                        lastName: controllerLastName.text,
                                        email: controllerEmail.text,
                                        id: widget.id,
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
