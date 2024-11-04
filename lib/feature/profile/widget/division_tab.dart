import 'package:api_helper/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tots_ui/tots_ui.dart';

class DivisionTab extends StatelessWidget {
  const DivisionTab({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isTablet = width >= 768 && width < 1366;
    final bool isDesktop = width >= 1366;

    double containerWidth = isTablet
        ? 380
        : isDesktop
            ? 500
            : 380;
    double containerHeight = isTablet
        ? 150
        : isDesktop
            ? 166
            : 160;

    return Padding(
      padding: const EdgeInsets.all(14),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'DIVISION',
                style: UITextStyle.captions.captionMedium.copyWith(
                  fontSize: 16,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Archivo',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              'DIVISIÓN ROOKIE',
              style: UITextStyle.captions.captionMedium.copyWith(
                fontSize: 24,
                color: const Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Druk Text Wide',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 180,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Image.network(
                    '$baseS3Url/Images/Leaderboards/division_5_200px.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 0),
            Container(
              width: containerWidth,
              height: containerHeight,
              constraints: BoxConstraints(
                maxWidth: isDesktop
                    ? 600
                    : isTablet
                        ? 600
                        : double.infinity,
              ),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(60, 56, 52, 1.0),
                borderRadius: BorderRadius.circular(isTablet
                    ? 20.0
                    : isDesktop
                        ? 25.0
                        : 15.0),
              ),
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: isTablet
                        ? 364
                        : isDesktop
                            ? 483
                            : 364,
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(30, 30, 30, 1),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              '$baseS3Url/Images/Leaderboards/global_200px.png',
                              width: 24,
                              height: 24,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Ranking Global',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Archivo',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 117,
                          height: 24,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(247, 176, 34, 1),
                            borderRadius: BorderRadius.circular(isTablet
                                ? 20
                                : isDesktop
                                    ? 25
                                    : 16),
                          ),
                          child: Row(
                            children: [
                              Image.network(
                                '$baseS3Url/Icons/trophy_b.png',
                                width: 18,
                                height: 18,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                'RECOMPENSAS',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Archivo',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: isTablet
                          ? 12
                          : isDesktop
                              ? 16
                              : 10),
                  Container(
                    width: isTablet
                        ? 364
                        : isDesktop
                            ? 483.5
                            : 364,
                    height: 56,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(247, 176, 34, 1),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 32,
                              backgroundImage: NetworkImage(
                                'UserStore.instance.avatar',
                              ),
                            ),
                            const SizedBox(width: 0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      '$baseS3Url/Icons/Divisions/upgrade.png',
                                      width: 16,
                                      height: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "--",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Archivo Black',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'UserStore.instance.userName',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Archivo',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Text(
                          "-- pts",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Center(
                    child: Icon(
                      Icons.expand_more,
                      color: Color.fromRGBO(255, 255, 255, 1),
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
