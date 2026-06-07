/*
 * ARQUIVO: lib/src/core/platform/share/share.dart
 * RESPONSABILIDADE: Indefinida
 * COMO USAR: Consultar documentação
 */
import 'dart:io';
import 'dart:typed_data';

abstract class Share {
  Future<void> shareText(String text);
  Future<void> shareFile(File file, {String? text});
  Future<void> shareBytes(
    Uint8List bytes, {
    required String fileName,
    String? text,
  });
}
