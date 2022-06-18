import 'dart:convert';

import 'package:clean_arc_imp/core/error/exceptions.dart';
import 'package:clean_arc_imp/core/utils/app_strings.dart';
import 'package:clean_arc_imp/features/random_quote/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();

  Future<void> cashQuote(QuoteModel quote);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<QuoteModel> getLastRandomQuote() async {
    final jsonString =
        sharedPreferences.getString(AppStrings.cashedRandomQuote);
    if (jsonString != null) {
      final cashRandomQuote = Future.value(
        QuoteModel.fromJson(
          json.decode(jsonString),
        ),
      );

      return cashRandomQuote;
    } else {
      throw CashException();
    }
  }

  @override
  Future<void> cashQuote(QuoteModel quote) {
    return sharedPreferences.setString(
        AppStrings.cashedRandomQuote, json.encode(quote));
  }
}
