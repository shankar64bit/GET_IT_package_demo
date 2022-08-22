import 'package:get_it/get_it.dart';
import 'package:get_it_package_demo/domain/meme_controller.dart';
import 'package:get_it_package_demo/repository/meme_repo.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<MemeRepo>(
    () => MemeRepo(),
  );
  getIt.registerLazySingleton<MemeDomainController>(
    () => MemeDomainController(),
  );
}
