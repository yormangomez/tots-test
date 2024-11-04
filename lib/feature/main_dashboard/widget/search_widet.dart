import 'package:flutter/material.dart';
import 'package:tots_ui/tots_ui.dart';

class SearchWidet extends StatefulWidget {
  const SearchWidet({
    super.key,
    required this.controllerSearch,
  });
  final TextEditingController controllerSearch;

  @override
  _SearchWidetState createState() => _SearchWidetState();
}

class _SearchWidetState extends State<SearchWidet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: TextFormField(
        controller: widget.controllerSearch,
        autofillHints: const [AutofillHints.username],
        validator: (value) {
          if (value!.isEmpty) {
            return "Campo requerido";
          }
          return null;
        },
        onChanged: (value) {
          setState(() {});
        },
        decoration: InputDecoration(
          hintText: 'Search....',
          prefixIcon: const Icon(Icons.search),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(68),
            borderSide: const BorderSide(
              color: Color(0xff1F1D2B9C),
            ),
          ),
          hoverColor: AppColors.transparent,
          fillColor: AppColors.transparent,
          hintStyle: UITextStyle.paragraphs.paragraph1Regular.copyWith(
            color: AppColors.black,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(68),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(68),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(68),
            borderSide: const BorderSide(
              color: AppColors.error,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(68),
            borderSide: const BorderSide(
              color: AppColors.error,
            ),
          ),
        ),
      ),
    );
  }
}
