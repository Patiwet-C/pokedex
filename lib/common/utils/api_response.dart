enum ApiResponseStatus { LOADING, COMPLETED, ERROR }

class ApiResponse<T> {
  ApiResponseStatus status;
  T? data;
  String? message;

  ApiResponse.loading(this.message) : status = ApiResponseStatus.LOADING;
  ApiResponse.completed(this.data) : status = ApiResponseStatus.COMPLETED;
  ApiResponse.error(this.message) : status = ApiResponseStatus.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

abstract class ResponseModel<T> {
  T fromJson(Map<String, dynamic> json);
}
