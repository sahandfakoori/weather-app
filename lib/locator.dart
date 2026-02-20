import 'package:get_it/get_it.dart';
import 'package:weather_app/features/home/data/datasource/api_service.dart';
import 'package:weather_app/features/home/data/datasource/datasource_remote_impl.dart';
import 'package:weather_app/features/home/data/datasource/datasource.dart';
import 'package:weather_app/features/home/data/repository/home_repository_impl.dart';
import 'package:weather_app/features/home/domain/repository/home_repository.dart';
import 'package:weather_app/features/home/presentation/bloc/home_bloc.dart';

GetIt locator = GetIt.instance;

Future<void> getitInitial() async {
  locator.registerSingleton<ApiService>(ApiService());

  //datasource
  locator.registerSingleton<Datasource>(DatasourceRemoteImpl(locator()));

  //repository
  locator.registerSingleton<HomeRepository>(HomeRepositoryImpl(locator()));

  //bloc
  locator.registerFactory<HomeBloc>(() => HomeBloc(locator<HomeRepository>()));
}
