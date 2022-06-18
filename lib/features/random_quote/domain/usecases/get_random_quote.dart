import 'package:clean_arc_imp/core/error/failures.dart';
import 'package:clean_arc_imp/core/usecases/usecase.dart';
import 'package:clean_arc_imp/features/random_quote/domain/entities/quote.dart';
import 'package:clean_arc_imp/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:dartz/dartz.dart';

class GetRandomQuote extends UseCase<Quote, NoParams> {
  final QuoteRepository quoteRepository;

  GetRandomQuote({required this.quoteRepository});

  @override
  Future<Either<Failure, Quote>> call(NoParams params) =>
      quoteRepository.getRandomQuote();
}
