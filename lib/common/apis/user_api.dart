import 'package:learning_shop_bloc/common/entities/entities.dart';
import 'package:learning_shop_bloc/common/utils/http_util.dart';

class UserAPI {
  static logIn(LoginRequestEntity? params) async {
    var response = await HttpUtil().postApi(
      'api/login',
      queryParameters: params?.toJson(),
    );
  }
}