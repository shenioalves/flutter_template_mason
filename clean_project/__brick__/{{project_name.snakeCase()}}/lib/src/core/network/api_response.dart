/*
 * ARQUIVO: lib/src/core/network/api_response.dart
 * RESPONSABILIDADE: Camada de rede e comunicação externa
 * COMO USAR: Wrapper para respostas padronizadas da API.
 */
class ApiResponse {
  ApiResponse({required this.data, required this.statusCode});

  final dynamic data;
  final int statusCode;
}

