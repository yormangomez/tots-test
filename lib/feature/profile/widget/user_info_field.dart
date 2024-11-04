import 'package:flutter/material.dart';

class UserInfoField extends StatelessWidget {
  const UserInfoField({
    required this.label,
    required this.initialValue,
    required this.onTap,
    super.key,
  });

  final String label;
  final String initialValue;
  final void Function(BuildContext) onTap;

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width >= 768 &&
        MediaQuery.of(context).size.width < 1366;
    final bool isDesktop = MediaQuery.of(context).size.width >= 1366;

    // Ancho fijo para el contenedor
    final double containerWidth = isDesktop
        ? 749
        : isTablet
            ? 498
            : 342;

    return SizedBox(
      width: containerWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Archivo',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: containerWidth,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.arrow_right),
                  onPressed: () => onTap(context),
                ),
                border: InputBorder.none,
                filled: true,
              ),
              controller: TextEditingController(text: initialValue),
              readOnly: true,
              style: const TextStyle(
                fontFamily: 'Archivo',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color.fromRGBO(52, 52, 52, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
