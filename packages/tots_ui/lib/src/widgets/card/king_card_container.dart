import 'package:flutter/material.dart';
import 'package:tots_ui/tots_ui.dart';

class KingCardContainer extends StatelessWidget {
  final String cardType;
  final String cardId;
  final String cardName;

  const KingCardContainer({
    super.key,
    required this.cardType,
    required this.cardId,
    required this.cardName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 167,
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 8),
      decoration: const BoxDecoration(
          color: AppColors.secondaryHumo,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: cardId.isEmpty && cardName.isEmpty
          ? Image.network(
              'https://kla-resources.s3.us-west-1.amazonaws.com/Images/Rarities/KingCards/SP/$cardType.png')
          : Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(cardId,
                        style: const TextStyle(
                            color: AppColors.white,
                            fontFamily: 'Archivo-Regular',
                            fontSize: 14))),
                Image.network(
                    'https://kla-resources.s3.us-west-1.amazonaws.com/Images/Rarities/KingCards/SP/$cardType.png'),
                const SizedBox(height: 7),
                Text(cardName,
                    style: const TextStyle(
                        color: AppColors.white,
                        fontFamily: 'Archivo-Regular',
                        fontSize: 14)),
                const SizedBox(height: 7),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                      color: AppColors.rascaYGanaGris,
                      borderRadius: BorderRadius.circular(60)),
                  child: const Center(
                    child: Text(
                      'Consumible',
                      style: TextStyle(
                          color: AppColors.white,
                          fontFamily: 'Archivo-Regular',
                          fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
