import 'package:bmi/features/bmi_scores/cubit/bmi_scores_cubit.dart';
import 'package:bmi/features/bmi_scores/repo/bmi_scores_repo.dart';
import 'package:bmi/features/home/cubit/home_cubit.dart';
import 'package:bmi/features/home/repo/home_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
//=====home===========
  //homerepo
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo());

  ///homeCubit
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));
  //=====bmi scores===========
  //bmiScoresrepo
  getIt.registerLazySingleton<BmiScoresRepo>(() => BmiScoresRepo());

  ///bmiScoresCubit
  getIt.registerFactory<BmiScoresCubit>(
      () => BmiScoresCubit(getIt<BmiScoresRepo>()));
}
