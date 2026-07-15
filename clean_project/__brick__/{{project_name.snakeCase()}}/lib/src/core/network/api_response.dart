/// Wrapper padronizado para respostas da API.
///
/// Encapsula os dados brutos e o status code, abstraindo
/// a estrutura de Response do Dio ou qualquer outro client HTTP.
class ApiResponse {
  ApiResponse({required this.data, required this.statusCode});

  final dynamic data;
  final int statusCode;
}
