import 'package:dartz/dartz.dart';
import 'package:flutter_steps_tracker/common/error/failures/application_failure.dart';
import 'package:flutter_steps_tracker/driven/models/exchange_history_model.dart';
import 'package:flutter_steps_tracker/driven/models/reward_model.dart';
import 'package:flutter_steps_tracker/driven/models/user_model.dart';

abstract class BottomNavbarRepository {
  Stream<List<RewardModel>> rewardsStream();

  Future<Either<Failure, Stream<List<UserModel>>>> usersStream();

  Future<Either<Failure, Stream<List<ExchangeHistoryModel>>>>
      exchangesHistoryStream();

  Future<Either<Failure, bool>> setExchangeHistory(
      ExchangeHistoryModel exchangeHistory);

  Future<Either<Failure, bool>> setStepsAndPoints(int stepsParams);

  Future<Either<Failure, UserModel>> getUserData();

  Future<Either<Failure, Stream<UserModel>>> getRealTimeUserData();

  Future<Either<Failure, bool>> earnAReward(RewardModel reward);
}
