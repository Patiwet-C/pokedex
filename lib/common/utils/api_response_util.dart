import 'package:pokedex/common/utils/api_response.dart';

class ApiResponseUtil {
  ApiResponse<T>? mapTo<T>(ApiResponse? response) {
    if (response == null) {
      return null;
    }

    switch (response.status) {
      case ApiResponseStatus.LOADING:
        return ApiResponse<T>.loading(response.message);
      case ApiResponseStatus.COMPLETED:
        return ApiResponse<T>.completed(response.data);
      case ApiResponseStatus.ERROR:
        return ApiResponse<T>.error(response.message);
    }
  }
}
