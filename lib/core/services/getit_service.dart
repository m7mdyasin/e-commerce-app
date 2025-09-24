import 'package:fruits_market/core/services/data_service.dart';
import 'package:fruits_market/core/services/firebase_auth_service.dart';
import 'package:fruits_market/core/services/firestore_services.dart';
import 'package:fruits_market/features/auth/data/repos/auth_repo_imple.dart';
import 'package:fruits_market/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseServices>(FirestoreServices());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImple(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseServices: getIt<DatabaseServices>(),
    ),
  );
}
