import 'package:flutter/widgets.dart';
import 'package:tots_ui/src/colors/app_colors.dart';
import 'package:tots_ui/tots_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

///Widget for under construction pages
class UnderConstruction extends StatelessWidget {
  ///Constructor
  const UnderConstruction({
    super.key,
    required this.title,
  });

  ///title
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 150,
            height: 150,
            child: Icon(
              PhosphorIconsThin.barricade,
              color: AppColors.primaryYello,
              size: 100,
            ),
          ),
          Text(
            '${Uri.decodeFull(title).replaceAll('/', '')}. \n En construcción.',
            textAlign: TextAlign.center,
            style: UITextStyle.titles.title3Medium.copyWith(
              color: AppColors.black4,
            ),
          ),
        ],
      ),
    );
  }
}
