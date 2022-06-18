import 'package:clean_arc_imp/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class QuoteContent extends StatelessWidget {
  // final String text;
  const QuoteContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
              "i'm Ipsum has been the industry's standard"
              " dummy text ever since the 1500s, when an unk"
              "nown printer took a galley of type and scrambled "
              "it to make a type specimen book. It has survived"
              " not only five centuries",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "Bill Gates",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          )
        ],
      ),
    );
  }
}
