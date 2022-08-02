import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();
  Future signin({required String email, required String senha}) async {
    final result = await _httpManager.restRequest(
      url: EndPoint.signin,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': senha,
      },
    );

    if (result!['result'] == null) {
      print("Deu ruim...");
      print(result['error']);
    } else {
      print('Deu bom...');
      final user = UserModel.fromMap(result['result']);
      print(user);
    }
  }
}
