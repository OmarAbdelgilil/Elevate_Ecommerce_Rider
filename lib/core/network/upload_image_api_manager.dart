import 'dart:io';

import 'package:dio/dio.dart' hide DioMediaType;
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/update_profile_image_response.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:elevate_ecommerce_driver/core/providers/user_provider.dart';

@singleton
@injectable
class UploadImageApiManager {
  final Dio _dio;

  UploadImageApiManager(Dio dio, UserProvider provider) : _dio = dio {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = provider.token;
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    ));
  }

  Future<UpdateProfileImageResponse?> uploadImage(File image) async {
    FormData data = FormData();
    data.files.add(
      MapEntry(
        'photo',
        await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('.').first,
          contentType: MediaType('image', image.path.split('.').last),
        ),
      ),
    );
    var response = await _dio.put(
      'https://flower.elevateegy.com/api/v1/drivers/upload-photo',
      data: data,
    );
    return UpdateProfileImageResponse.fromJson(response.data);
  }
}
