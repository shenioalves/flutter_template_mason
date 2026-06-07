/*
 * ARQUIVO: lib/src/core/utils/formatters.dart
 * RESPONSABILIDADE: Utilitários e extensões auxiliares
 * COMO USAR: Funções utilitárias para formatação de dados.
 */
// formatters.dart
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Formatters {
  static final cpf = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  static final phone = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );
  
  static final cep = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {'#': RegExp(r'[0-9]')},
  );
  
  static final date = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {'#': RegExp(r'[0-9]')},
  );
  
  static final cnpj = MaskTextInputFormatter(
    mask: '##.###.###/####-##',
    filter: {'#': RegExp(r'[0-9]')},
  );
}
