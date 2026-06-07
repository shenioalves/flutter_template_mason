/*
 * ARQUIVO: lib/src/core/platform/url_launcher/url_launcher_impl.dart
 * RESPONSABILIDADE: Indefinida
 * COMO USAR: Consultar documentação
 */
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:{{project_name.snakeCase()}}/src/core/platform/url_launcher/url_launcher.dart';

class UrlLauncherImpl implements UrlLauncher {
  @override
  Future<void> launchExternalAppUrl(String url) async {
    final uri = Uri.parse(url);

    try {
      await url_launcher.launchUrl(
        uri,
        mode: url_launcher.LaunchMode.externalApplication,
      );
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> sendWhatsAppMessage(String number, {String? message}) async {
    final Uri link;

    if (Platform.isAndroid) {
      link = Uri(
        scheme: 'https',
        host: 'wa.me',
        path: number,
        queryParameters: message != null ? {'text': message} : null,
      );
    } else {
      link = Uri(
        scheme: 'https',
        host: 'api.whatsapp.com',
        path: 'send',
        queryParameters: {'phone': number, 'text': ?message},
      );
    }

    try {
      await url_launcher.launchUrl(
        link,
        mode: url_launcher.LaunchMode.externalApplication,
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
