/*
 * ARQUIVO: lib/src/core/platform/share/share_impl.dart
 * RESPONSABILIDADE: Indefinida
 * COMO USAR: Consultar documentação
 */
import 'dart:io';
import 'dart:typed_data';

import 'package:share_plus/share_plus.dart' hide Share;
import 'package:{{project_name.snakeCase()}}/src/core/platform/app_directories.dart';
import 'package:{{project_name.snakeCase()}}/src/core/platform/share/share.dart';

class ShareImpl implements Share {
  ShareImpl(this._appDirectories);

  final AppDirectories _appDirectories;
  final SharePlus _sharePlus = SharePlus.instance;

  @override
  Future<void> shareText(String text) async {
    await _sharePlus.share(ShareParams(text: text));
  }

  @override
  Future<void> shareFile(File file, {String? text}) async {
    await _sharePlus.share(ShareParams(files: [XFile(file.path)], text: text));
  }

  @override
  Future<void> shareBytes(
    Uint8List bytes, {
    required String fileName,
    String? text,
  }) async {
    final tempDir = await _appDirectories.getTempDir();
    final tempFile = await File(
      '${tempDir.path}/$fileName',
    ).writeAsBytes(bytes);
    try {
      await _sharePlus.share(
        ShareParams(files: [XFile(tempFile.path)], text: text),
      );
    } finally {
      if (await tempFile.exists()) await tempFile.delete();
    }
  }
}
