import 'dart:convert';

import 'package:clean_arc_imp/core/error/exceptions.dart';
import 'package:clean_arc_imp/core/utils/app_strings.dart';
import 'package:clean_arc_imp/features/random_quote/data/models/quote_model.dart';
import 'package:http/http.dart' as http;
import 'package:clean_arc_imp/core/api/end_points.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  final http.Client client;

  RandomQuoteRemoteDataSourceImpl({required this.client});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final response =
        await client.get(Uri.parse(EndPoints.randomQuote), headers: {
      AppStrings.contentType: AppStrings.applicationJson,
    });
    if (response.statusCode == 200) {
      return QuoteModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
