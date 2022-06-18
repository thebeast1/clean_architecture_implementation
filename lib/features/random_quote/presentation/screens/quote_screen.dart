import 'package:clean_arc_imp/core/utils/app_colors.dart';
import 'package:clean_arc_imp/core/utils/app_strings.dart';
import 'package:clean_arc_imp/features/random_quote/presentation/widgets/quote_content.dart';
import 'package:flutter/material.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  Widget _buildBodyContent() => Column(
        children: [
          const QuoteContent(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            padding: const EdgeInsets.all(10),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
            child: const Icon(Icons.refresh, size: 28, color: Colors.white),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appName),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: _buildBodyContent(),
        ),
      ),
    );
  }
}
