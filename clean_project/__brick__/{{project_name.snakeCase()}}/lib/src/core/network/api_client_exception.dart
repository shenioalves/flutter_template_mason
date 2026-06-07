/*
 * ARQUIVO: lib/src/core/network/api_client_exception.dart
 * RESPONSABILIDADE: Camada de rede e comunicação externa
 * COMO USAR: Exceção customizada para erros de comunicação com a API.
 */
class ApiClientException implements Exception {
  ApiClientException({this.statusCode, this.message});

  final int? statusCode;
  final String? message;

  @override
  String toString() =>
      'ApiClientException(statusCode: $statusCode, message: $message)';
}

