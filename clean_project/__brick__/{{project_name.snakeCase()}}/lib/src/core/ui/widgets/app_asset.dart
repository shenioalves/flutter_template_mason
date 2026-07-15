/*
 * ARQUIVO: lib/src/core/ui/widgets/app_asset.dart
 * RESPONSABILIDADE: Componente unificado para exibição de imagens (SVG, PNG, Network).
 * COMO USAR: Substitui o antigo MemoireAsset e centraliza carregamento de imagens no app.
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:{{project_name.snakeCase()}}/src/core/ui/ui.dart';

enum _AssetType { svg, image, network }

class AppAsset extends StatelessWidget {
  final AppAssets? assetPath;
  final String? networkUrl;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final String? semanticsLabel;
  final _AssetType _assetType;
  final BorderRadiusGeometry borderRadius;
  final Map<String, String>? httpHeaders;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, dynamic)? errorWidget;

  const AppAsset.svg({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.semanticsLabel,
  }) : _assetType = _AssetType.svg,
       borderRadius = BorderRadius.zero,
       networkUrl = null,
       httpHeaders = null,
       placeholder = null,
       errorWidget = null;

  const AppAsset.image({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.semanticsLabel,
    this.borderRadius = BorderRadius.zero,
  }) : _assetType = _AssetType.image,
       networkUrl = null,
       httpHeaders = null,
       placeholder = null,
       errorWidget = null;

  const AppAsset.network({
    super.key,
    required this.networkUrl,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.semanticsLabel,
    this.borderRadius = BorderRadius.zero,
    this.httpHeaders,
    this.placeholder,
    this.errorWidget,
  }) : _assetType = _AssetType.network,
       assetPath = null,
       color = null;

  bool _isRemoteUrl(String url) {
    final Uri? uri = Uri.tryParse(url);
    if (uri == null) return false;

    return (uri.scheme == 'http' || uri.scheme == 'https') && uri.hasAuthority;
  }

  @override
  Widget build(BuildContext context) {
    switch (_assetType) {
      case _AssetType.svg:
        return SvgPicture.asset(
          assetPath!.path,
          width: width,
          height: height,
          colorFilter: color != null
              ? ColorFilter.mode(color!, BlendMode.srcIn)
              : null,
          fit: fit,
          alignment: alignment,
          semanticsLabel: semanticsLabel,
        );
      case _AssetType.image:
        return ClipRRect(
          borderRadius: borderRadius,
          child: Image.asset(
            assetPath!.path,
            width: width,
            height: height,
            fit: fit,
            alignment: alignment,
            semanticLabel: semanticsLabel,
            color: color,
          ),
        );
      case _AssetType.network:
        if (networkUrl == null || networkUrl!.isEmpty) {
          return ClipRRect(
            borderRadius: borderRadius,
            child:
                errorWidget?.call(context, "", null) ?? const SizedBox.shrink(),
          );
        }

        final bool isRemote = _isRemoteUrl(networkUrl!);

        return ClipRRect(
          borderRadius: borderRadius,
          child: isRemote
              ? CachedNetworkImage(
                  imageUrl: networkUrl!,
                  width: width,
                  height: height,
                  fit: fit,
                  httpHeaders: httpHeaders,
                  placeholder: placeholder,
                  errorWidget: errorWidget,
                )
              : Image.asset(
                  networkUrl!,
                  width: width,
                  height: height,
                  fit: fit,
                  alignment: alignment,
                  semanticLabel: semanticsLabel,
                ),
        );
    }
  }
}
