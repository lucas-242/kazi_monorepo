import 'dart:convert';

import 'package:kazi_core/shared/l10n/generated/l10n.dart';
import 'package:kazi_core/shared/models/errors.dart';

class ApiResponse {
  ApiResponse({
    required this.status,
    this.message,
    required this.body,
  });

  final int status;
  final String? message;
  final String body;

  dynamic get json => jsonDecode(body);

  void handleStatus({
    Function? status408,
    Function? status404,
    Function? status403,
    Function? status401,
    Function? status400,
    Function? status500,
  }) {
    switch (status) {
      case 404:
        {
          if (status404 != null) {
            status404();
          }
          throw ClientError(message ?? KaziLocalizations.current.errorNotFound);
        }
      case 403:
        {
          if (status403 != null) {
            status403();
          }
          throw ClientError(
            message ?? KaziLocalizations.current.errorAccessDenied,
          );
        }
      case 401:
        {
          if (status401 != null) {
            status401();
          }
          throw ClientError(
            message ?? KaziLocalizations.current.errorTokenExpired,
          );
        }
      case 400:
        {
          if (status400 != null) {
            status400();
          }
          throw ClientError(
            message ?? KaziLocalizations.current.errorUnknowError,
          );
        }
      case 408:
        {
          if (status408 != null) {
            status408();
          }
          throw TimeoutError(message ?? KaziLocalizations.current.errorTimeout);
        }
      case 500:
        {
          if (status500 != null) {
            status500();
          }
          throw ExternalError(
            message ?? KaziLocalizations.current.errorUnknowError,
          );
        }
    }
  }
}
