import 'package:clean_arc_imp/core/error/exceptions.dart';
import 'package:clean_arc_imp/core/error/failures.dart';
import 'package:clean_arc_imp/core/network/network_info.dart';
import 'package:clean_arc_imp/features/random_quote/data/datasources/random_quote_remote_datasource.dart';
import 'package:clean_arc_imp/features/random_quote/data/datasources/random_quote_local_datasource.dart';
import 'package:clean_arc_imp/features/random_quote/domain/entities/quote.dart';
import 'package:clean_arc_imp/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:dartz/dartz.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  QuoteRepositoryImpl({
    required this.networkInfo,
    required this.randomQuoteRemoteDataSource,
    required this.randomQuoteLocalDataSource,
  });

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected()) {
      try {
        //get the data response.
        final remoteRandomQuoteResponse =
            await randomQuoteRemoteDataSource.getRandomQuote();
        //cash the response.
        randomQuoteLocalDataSource.cashQuote(remoteRandomQuoteResponse);
        //return the Response.
        return Right(remoteRandomQuoteResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      try {
        final cashRandomQuoteResponse =
            await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(cashRandomQuoteResponse);
      } on CashException {
        return Left(CashFailure());
      }
    }
  }
}
