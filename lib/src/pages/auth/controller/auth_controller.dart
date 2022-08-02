import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_repository.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final AuthRepository authRepository = AuthRepository();

  Future<void> signin({
    required String email,
    required String senha,
  }) async {
    isLoading.value = true;
    var result = await authRepository.signin(email: email, senha: senha);
    isLoading.value = false;
  }
}
