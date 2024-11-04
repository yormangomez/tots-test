// ignore_for_file: unused_element

import 'package:api_helper/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:tots_ui/tots_ui.dart';

class PerfilTab extends StatelessWidget {
  const PerfilTab({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width >= 768 &&
        MediaQuery.of(context).size.width < 1366;
    final bool isDesktop = MediaQuery.of(context).size.width >= 1366;

    return OrientationBuilder(
      builder: (context, orientation) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'PERFIL',
                    style: UITextStyle.captions.captionMedium.copyWith(
                      fontSize: 16,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 0),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: isTablet
                          ? 72
                          : isDesktop
                              ? 108
                              : 72,
                      backgroundColor: Colors.grey[200],
                      foregroundImage: NetworkImage(
                        'UserStore.instance.avatar',
                      ),
                    ),
                    /* Positioned(
                      bottom:  0,
                      right: 0,
                      child: Container(
                        width: 54,
                        height:  54,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: IconButton(
                          icon: const FaIcon(FontAwesomeIcons.pen, color: Color.fromRGBO(0, 0, 0, 1)),
                          onPressed: () => _showChangeProfilePhotoDialog(context),
                          iconSize:24,
                        ),
                      ),
                    ),*/
                  ],
                ),
                SizedBox(
                    height: isTablet
                        ? 60
                        : isDesktop
                            ? 60
                            : 30),
                ...[].map((e) => Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: isTablet
                                ? 24.0
                                : isDesktop
                                    ? 32.0
                                    : 16.0),
                        child: e,
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}

void _showChangeUsernameDialog(BuildContext context) {
  /*
  TextEditingController usernameController = TextEditingController();

  final screenSize = MediaQuery.of(context).size;

  

  final double? dialogWidth = screenSize.width >= 1366
      ? 400
      : (screenSize.width > 768 ? 400 : null);
  
 
  double containerWidth = screenSize.width >= 1366 ? 599 : (screenSize.width > 768 ? 254 : 254);
  
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0 ),
        ),
        contentPadding: const EdgeInsets.all(20.0 ),
        content: SizedBox(
          width: dialogWidth, 
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Cambiar nombre de usuario',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0 ,
                    ),
                  ),
                  IconButton(
                    icon: Image.network(
                      '$baseS3Url/Icons/close.png',
                      width: 24, 
                      height: 24,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 20.0 ),
              const Text(
                'Para poder cambiar tu nombre de usuario, es necesario pagar la siguiente cantidad de King Points:',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 16.0 ,
                ),
              ),
              const SizedBox(height: 20.0 ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    '$baseS3Url/Images/Currencies/currency_xp.png',
                    width: 20.0 ,
                    height: 20.0 ,
                  ),
                  const SizedBox(width: 10.0 ),
                  const Text(
                    '500',
                    style: TextStyle(
                      fontSize: 18.0 ,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0 ),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Nuevo nombre de usuario',
                  labelStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0 ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0 ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '*Máximo 1 mayúscula y carácter especial',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0 ,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Center(
            child: Container(
              width: containerWidth, // Usa el ancho calculado
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), 
                color: Colors.transparent,
              ),
              child: ElevatedButton.icon(
                onPressed: () {
                  if (usernameController.text.isEmpty) {
                    Navigator.of(context).pop();
                    _showErrorDialog(context);
                  } else {
                    Navigator.of(context).pop();
                    _showConfirmPaymentDialog(context);
                  }
                },
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      '$baseS3Url/Images/Currencies/currency_xp.png',
                      width: 12.0 ,
                      height: 10.5 ,
                    ),
                    const SizedBox(width: 5.0 ),
                    const Text(
                      'CONFIRMAR 500',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 14.0, 
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0 ,
                    vertical: 15.0 ,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0 ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );*/
}

void _showChangeEmailDialog(BuildContext context) {
  /*
  TextEditingController emailController = TextEditingController();

  final screenSize = MediaQuery.of(context).size;

  final double? dialogWidth = screenSize.width >= 1366
      ? 400
      : (screenSize.width > 768 ? 400 : null);
      double containerWidth = screenSize.width >= 1366 ? 599 : (screenSize.width > 768 ? 254 : 254);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20 )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Cambiar correo',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.bold,
                fontSize: 18 
              ),
            ),
            IconButton(
              icon: Image.network(
                '$baseS3Url/Icons/close.png',
                width: 24, // Ajusta el tamaño si es necesario
                height: 24,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        content: SizedBox(
          width: dialogWidth,
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '¿Seguro que quieres cambiar el correo electrónico actual de tu cuenta?',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 16 ,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Center(
            child: SizedBox(
              width: containerWidth, 
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showVerificationDialog(context, emailController);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
                  padding: const EdgeInsets.symmetric(horizontal: 40 , vertical: 15 ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0 ),
                  ),
                ),
                child: const Text(
                  'CONFIRMAR',
                  style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 14 ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );*/
}

void _showChangePasswordDialog(BuildContext context) {
  /*
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> controllers = List.generate(6, (_) => TextEditingController());

  final screenSize = MediaQuery.of(context).size;
  

  final double? dialogWidth = screenSize.width >= 1366
      ? 400
      : (screenSize.width > 768 ? 400 : null);

      double containerWidth = screenSize.width >= 1366 ? 599 : (screenSize.width > 768 ? 254 : 254);

  
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20 )),
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: dialogWidth,
          padding: const EdgeInsets.all(10 ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Cambiar contraseña',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 18 ,
                    ),
                  ),
                  IconButton(
                    icon: Image.network(
                      '$baseS3Url/Icons/close.png',
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 20 ),
              const Text(
                'Se ha enviado un código de verificación a tu correo electrónico, por favor introdúcelo.',
                style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontSize: 14 ),
              ),
              const SizedBox(height: 20 ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 35 ,
                    height: 45 ,
                    child: TextField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        counterText: "",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10 ),
                          borderSide: const BorderSide(color: Color.fromRGBO(0, 0, 0, 1)),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          if (index < 5) {
                            FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                          }
                        } else if (value.isEmpty && index > 0) {
                          FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                        }
                      },
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10 ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 8 ),
                  child: Text(
                    'Supporting text',
                    style: TextStyle(color: Color.fromARGB(253, 121, 115, 115), fontSize: 14 ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Center(
            child: SizedBox(
              width: containerWidth, 
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); 
                  _showUpdatePasswordDialog(context); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
                  padding: const EdgeInsets.symmetric(horizontal: 40 , vertical: 15 ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0 ),
                  ),
                ),
                child: const Text(
                  'CONFIRMAR',
                  style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );*/
}

void _showErrorDialog(BuildContext context) {
  TextEditingController usernameController = TextEditingController();

  final screenSize = MediaQuery.of(context).size;

  double containerWidth =
      screenSize.width >= 1366 ? 599 : (screenSize.width > 768 ? 254 : 254);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Cambiar nombre de usuario',
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
            IconButton(
              icon: Image.network(
                '$baseS3Url/Icons/close.png',
                width: 24,
                height: 24,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'El nombre de usuario ingresado no cumple con los requisitos.',
              style:
                  TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Nuevo nombre de usuario',
                labelStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
              ),
            ),
            const SizedBox(height: 10.0),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '*Nombre no cumple con los requerimientos, intenta con uno diferente',
                style: TextStyle(color: Colors.red, fontSize: 12.0),
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: SizedBox(
              width: containerWidth,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  if (usernameController.text.isNotEmpty &&
                      _isValidUsername(usernameController.text)) {
                    Navigator.of(context).pop();
                    _showConfirmPaymentDialog(context);
                  } else {
                    Navigator.of(context).pop();
                    _showErrorDialog(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'CONFIRMAR',
                  style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

bool _isValidUsername(String username) {
  return username.isNotEmpty;
}

void _showConfirmPaymentDialog(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;

  final double? dialogWidth =
      screenSize.width >= 1366 ? 400 : (screenSize.width > 768 ? 400 : null);

  double containerWidth =
      screenSize.width >= 1366 ? 599 : (screenSize.width > 768 ? 254 : 254);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        contentPadding: const EdgeInsets.all(20.0),
        content: SizedBox(
          width: dialogWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Cambiar nombre de usuario',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  IconButton(
                    icon: Image.network(
                      '$baseS3Url/Icons/close.png',
                      width: 24, // Ajusta el tamaño si es necesario
                      height: 24,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const Text(
                '¿Seguro que quieres pagar los siguientes King Points para cambiar tu nombre de usuario?',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    '$baseS3Url/Images/Currencies/currency_xp.png',
                    width: 24.0, // Ajusta el tamaño si es necesario
                    height: 24.0,
                  ),
                  const SizedBox(width: 10.0),
                  const Text(
                    '500',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Center(
            child: SizedBox(
              width: containerWidth,
              height: 40,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showSuccessDialog(context);
                },
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10.0),
                    Image.network(
                      '$baseS3Url/Images/Currencies/currency_xp.png',
                      width: 20.0, // Ajusta el tamaño si es necesario
                      height: 20.0,
                    ),
                    const SizedBox(width: 5.0),
                    const Text('CONFIRMAR 500',
                        style:
                            TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 15.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

void _showSuccessDialog(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;

  final double? dialogWidth =
      screenSize.width >= 1366 ? 400 : (screenSize.width > 768 ? 400 : null);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        contentPadding: EdgeInsets.zero,
        content: SizedBox(
          width: dialogWidth,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Reemplaza los íconos por la imagen proporcionada
                    Image.network(
                      '$baseS3Url/Icons/successfull.png',
                      width: 32.0,
                      height: 32.0,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      '¡Nombre cambiado correctamente!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ],
                ),
              ),
              // Ícono de cerrar
              Positioned(
                top: 10.0,
                right: 10.0,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.network(
                      '$baseS3Url/Icons/close.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _showVerificationDialog(
    BuildContext context, TextEditingController emailController) {
  List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  List<TextEditingController> controllers =
      List.generate(6, (_) => TextEditingController());
  String verificationCode = '';

  final screenSize = MediaQuery.of(context).size;

  final double? dialogWidth =
      screenSize.width >= 1366 ? 400 : (screenSize.width > 768 ? 400 : null);

  double containerWidth =
      screenSize.width >= 1366 ? 599 : (screenSize.width > 768 ? 254 : 254);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Cambiar correo',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            IconButton(
              icon: Image.network(
                '$baseS3Url/Icons/close.png',
                width: 24, // Ajusta el tamaño si es necesario
                height: 24,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        content: SizedBox(
          width: dialogWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Se ha enviado un código de verificación a tu correo electrónico, por favor introdúcelo a continuación.',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 30,
                    height: 45,
                    child: TextField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        counterText: "",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 1)),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          verificationCode += value;
                          if (index < 5) {
                            FocusScope.of(context)
                                .requestFocus(focusNodes[index + 1]);
                          } else {
                            FocusScope.of(context).unfocus();
                          }
                        } else if (value.isEmpty && index > 0) {
                          verificationCode = verificationCode.substring(
                              0, verificationCode.length - 1);
                          FocusScope.of(context)
                              .requestFocus(focusNodes[index - 1]);
                        }
                      },
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    'Supporting text',
                    style: TextStyle(
                      color: Color.fromARGB(253, 121, 115, 115),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10, bottom: 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '¿No te ha llegado ningun correo? Mandar de nuevo.',
                    style: TextStyle(
                      color: Color.fromARGB(255, 32, 45, 231),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: containerWidth,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    if (verificationCode.isNotEmpty) {
                      Navigator.of(context).pop();
                      _showNewEmailDialog(context, emailController);
                    } else {}
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  child: const Text(
                    'CONFIRMAR',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1), fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

void _showNewEmailDialog(
    BuildContext context, TextEditingController emailController) {
  TextEditingController newVerificationCodeController = TextEditingController();

  final screenSize = MediaQuery.of(context).size;

  final double? dialogWidth =
      screenSize.width >= 1366 ? 400 : (screenSize.width > 768 ? 400 : null);

  double containerWidth =
      screenSize.width >= 1366 ? 599 : (screenSize.width > 768 ? 254 : 254);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Cambiar correo',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            IconButton(
              icon: Image.network(
                '$baseS3Url/Icons/close.png',
                width: 24, // Ajusta el tamaño si es necesario
                height: 24,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        content: SizedBox(
          width: dialogWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Introduce el nuevo correo electrónico que deseas usar en esta cuenta.',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color.fromRGBO(0, 0, 0, 1)),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Nuevo correo electrónico',
                    labelStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Center(
            child: SizedBox(
              width: containerWidth,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  if (emailController.text.isEmpty) {
                    Navigator.of(context).pop();
                    _showEmailUnavailableDialog(context);
                  } else {
                    Navigator.of(context).pop();
                    _showVerificationDialogForNewEmail(
                        context, newVerificationCodeController);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                child: const Text(
                  'CONFIRMAR',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1), fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

void _showVerificationDialogForNewEmail(
    BuildContext context, TextEditingController newVerificationCodeController) {
  List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  List<TextEditingController> controllers =
      List.generate(6, (_) => TextEditingController());
  String verificationCode = '';

  final screenSize = MediaQuery.of(context).size;

  final double? dialogWidth =
      screenSize.width >= 1366 ? 400 : (screenSize.width > 768 ? 400 : null);

  double containerWidth =
      screenSize.width >= 1366 ? 599 : (screenSize.width > 768 ? 254 : 254);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.all(20),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Cambiar correo',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            IconButton(
              icon: Image.network(
                '$baseS3Url/Icons/close.png',
                width: 24,
                height: 24,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        content: SizedBox(
          width: dialogWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Se ha enviado un código de verificación a tu nuevo correo electrónico, por favor introdúcelo a continuación.',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 30,
                    height: 45,
                    child: TextField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        counterText: "",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 1)),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          verificationCode += value;
                          if (index < 5) {
                            FocusScope.of(context)
                                .requestFocus(focusNodes[index + 1]);
                          } else {
                            FocusScope.of(context).unfocus();
                          }
                        } else if (value.isEmpty && index > 0) {
                          verificationCode = verificationCode.substring(
                              0, verificationCode.length - 1);
                          FocusScope.of(context)
                              .requestFocus(focusNodes[index - 1]);
                        }
                      },
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    'Supporting text',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1), fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Center(
            child: SizedBox(
              width: containerWidth,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  if (verificationCode.isNotEmpty) {
                    Navigator.of(context).pop();
                    _showEmailUpdatedDialog(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                child: const Text(
                  'CONFIRMAR',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1), fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

void _showEmailUpdatedDialog(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;

  final double? dialogWidth =
      screenSize.width >= 1366 ? 400 : (screenSize.width > 768 ? 400 : null);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        contentPadding: EdgeInsets.zero,
        content: SizedBox(
          width: dialogWidth,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      '$baseS3Url/Icons/successfull.png',
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      '¡Correo cambiado correctamente!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10.0,
                right: 10.0,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.network(
                      '$baseS3Url/Icons/close.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _showEmailUnavailableDialog(BuildContext context) {
  TextEditingController newVerificationCodeController = TextEditingController();
  bool isEmailUnavailable = true;

  final screenSize = MediaQuery.of(context).size;

  final double? dialogWidth =
      screenSize.width >= 1366 ? 400 : (screenSize.width > 768 ? 400 : null);

  double containerWidth =
      screenSize.width >= 1366 ? 599 : (screenSize.width > 768 ? 254 : 254);

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.all(20),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Cambiar correo',
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          IconButton(
            icon: Image.network(
              '$baseS3Url/Icons/close.png',
              width: 24,
              height: 24,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      content: SizedBox(
        width: dialogWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Correo no disponible. Introduce un nuevo correo que deseas usar.',
              style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color.fromRGBO(0, 0, 0, 1)),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Nuevo correo electrónico',
                  labelStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 16),
              ),
            ),
            if (isEmailUnavailable)
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    '*Correo proporcionado ya está en uso',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              ),
          ],
        ),
      ),
      actions: [
        Center(
          child: SizedBox(
            width: containerWidth,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showVerificationDialogForNewEmail(
                    context, newVerificationCodeController);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              child: const Text(
                'CONFIRMAR',
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1), fontSize: 14),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

void _showUpdatePasswordDialog(BuildContext context) {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  final screenSize = MediaQuery.of(context).size;

  final double? dialogWidth =
      screenSize.width >= 1366 ? 400 : (screenSize.width > 768 ? 400 : null);

  double containerWidth =
      screenSize.width >= 1366 ? 599 : (screenSize.width > 768 ? 254 : 254);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Cambiar contraseña',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            IconButton(
              icon: Image.network(
                '$baseS3Url/Icons/close.png',
                width: 24, // Ajusta el tamaño si es necesario
                height: 24,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        content: SizedBox(
          width: dialogWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Introduce tu contraseña actual y la nueva que deseas usar en esta cuenta.',
                style:
                    TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontSize: 16),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: currentPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña actual',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '*Contraseña correcta',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña nueva',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Supporting text',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Center(
            child: SizedBox(
              width: containerWidth,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showConfirmationDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                child: const Text('CONFIRMAR',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1), fontSize: 14)),
              ),
            ),
          ),
        ],
      );
    },
  );
}

void _showConfirmationDialog(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;

  final double? dialogWidth =
      screenSize.width >= 1366 ? 400 : (screenSize.width > 768 ? 400 : null);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.zero,
        content: SizedBox(
          width: dialogWidth,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      '$baseS3Url/Icons/successfull.png',
                      width: 80, // Ajusta el tamaño si es necesario
                      height: 80,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '¡Contraseña actualizada correctamente!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: Image.network(
                    '$baseS3Url/Icons/close.png',
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
