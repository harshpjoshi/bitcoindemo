enum APIStatus {success, error}

class APIResponse{
  Map<String, dynamic>? response;
  Map<String, dynamic>? summary;
  APIStatus status;

  APIResponse.success(this.response):status = APIStatus.success;
  APIResponse.error(this.response):status = APIStatus.error;
}

class APIHttpResult<T>{
  T? data;
  APIStatus status;

  APIHttpResult.success(this.data):status = APIStatus.success;
  APIHttpResult.error(this.data):status = APIStatus.error;
}