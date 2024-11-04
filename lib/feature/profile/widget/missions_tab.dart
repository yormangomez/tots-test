import 'package:flutter/material.dart';
import 'package:tots_ui/tots_ui.dart';

class MissionsTab extends StatelessWidget {
  const MissionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    double scaleFactor = 1.0;
    if (screenSize.width <= 390) {
      scaleFactor = 1.0;
    } else if (screenSize.width <= 768) {
      scaleFactor = 1.0;
    } else {
      scaleFactor = 1.0;
    }

    // Ajuste del progreso a 0
    double progress = 0.0;

    return Padding(
      padding: const EdgeInsets.all(14),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8 * scaleFactor),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'MISIONES',
                    style: UITextStyle.captions.captionMedium.copyWith(
                      fontSize: 16,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 200 * scaleFactor,
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Image.network(
                        'https://kla-resources.s3.us-west-1.amazonaws.com/Images/Missions/mission_1_200px.png',
                        width: 200 * scaleFactor,
                        height: 200 * scaleFactor,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32 * scaleFactor),
                Text(
                  'Escudero',
                  style: UITextStyle.captions.captionMedium.copyWith(
                    fontSize: 24,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24 * scaleFactor),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: screenSize.width > 768 ? 600 : double.infinity,
                  ),
                  height: 30 * scaleFactor,
                  width: screenSize.width * 0.8 * scaleFactor,
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(10 * scaleFactor),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: screenSize.width * 0.8 * scaleFactor,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(210, 210, 210, 1),
                          borderRadius: BorderRadius.circular(10 * scaleFactor),
                        ),
                      ),
                      Container(
                        width: screenSize.width * 0.4 * scaleFactor * progress,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(227, 82, 5, 1),
                          borderRadius: BorderRadius.circular(10 * scaleFactor),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8 * scaleFactor),
                Text(
                  '0/10 misiones canjeadas',
                  style: UITextStyle.captions.captionMedium.copyWith(
                    fontSize: 20,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
