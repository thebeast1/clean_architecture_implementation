import 'package:clean_arc_imp/core/error/failures.dart';
import 'package:clean_arc_imp/features/random_quote/domain/entities/quote.dart';
import 'package:dartz/dartz.dart';

abstract class QuoteRepository {
  Future<Either<Failure, Quote>> getRandomQuote();
}
