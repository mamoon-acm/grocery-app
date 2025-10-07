import 'package:dio/dio.dart';
import 'package:grocery_app/core/constant/api_constants.dart';
import 'package:grocery_app/core/exception/app_exceptions.dart';

class DioClient {
  final Dio _dio;

  DioClient() : _dio = Dio() {
    _dio
      ..options.baseUrl = ApiConstants.baseUrl
      ..options.connectTimeout = const Duration(
        milliseconds: ApiConstants.connectTimeout,
      )
      ..options.receiveTimeout = const Duration(
        milliseconds: ApiConstants.receiveTimeout,
      )
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'}
      ..interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
        ),
      );
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw UnknownException('Unexpected error occurred: $e');
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw UnknownException('Unexpected error occurred: $e');
    }
  }

  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw UnknownException('Unexpected error occurred: $e');
    }
  }

  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw UnknownException('Unexpected error occurred: $e');
    }
  }

  AppException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return RequestTimeoutException(
          'Connection timeout',
          error.requestOptions.uri.toString(),
        );
      case DioExceptionType.badResponse:
        return _handleHttpError(error);
      case DioExceptionType.cancel:
        return UnknownException('Request was cancelled');
      case DioExceptionType.unknown:
        return UnknownException('Unknown error occurred');
      case DioExceptionType.badCertificate:
        return UnknownException('Bad certificate');
      case DioExceptionType.connectionError:
        return NoInternetException('Failed to connect to the server');
    }
  }

  AppException _handleHttpError(DioException error) {
    final response = error.response;
    if (response != null) {
      switch (response.statusCode) {
        case 400:
          return BadRequestException(
            'Bad request',
            response.requestOptions.uri.toString(),
          );
        case 401:
          return UnauthorizedException(
            'Unauthorized',
            response.requestOptions.uri.toString(),
          );
        case 403:
          return ForbiddenException(
            'Forbidden',
            response.requestOptions.uri.toString(),
          );
        case 404:
          return NotFoundException(
            'Not found',
            response.requestOptions.uri.toString(),
          );
        case 405:
          return MethodNotAllowedException(
            'Method not allowed',
            response.requestOptions.uri.toString(),
          );
        case 409:
          return ConflictException(
            'Conflict',
            response.requestOptions.uri.toString(),
          );
        case 500:
          return InternalServerErrorException(
            'Internal server error',
            response.requestOptions.uri.toString(),
          );
        case 503:
          return ServiceUnavailableException(
            'Service unavailable',
            response.requestOptions.uri.toString(),
          );
        default:
          return UnknownException(
            'Received invalid status code: ${response.statusCode}',
            response.requestOptions.uri.toString(),
          );
      }
    } else {
      return UnknownException('Unknown error occurred');
    }
  }
}
