// import 'dart:async' show Future;
// import 'dart:io' show File;
// import 'dart:typed_data';
// import 'dart:ui' as ui show instantiateImageCodec, Codec;
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
//
// typedef StatusListener = void Function(
//     BetterCachedNetworkImageProviderStatus status);
//
// enum BetterCachedNetworkImageProviderStatus { none, fetching, error, fetched }
//
// /// Original source: https://github.com/renefloor/flutter_cached_network_image/blob/9579401d835061be8b53bb7e78a5bcf667ddde68/lib/src/cached_network_image_provider.dart
// class BetterCachedNetworkImageProvider
//     extends ImageProvider<BetterCachedNetworkImageProvider> {
//   const BetterCachedNetworkImageProvider(
//     this.url, {
//     this.scale = 1.0,
//     this.statusNotifier,
//     this.headers,
//     this.cacheManager,
//   })  : assert(url != null),
//         assert(scale != null);
//
//   final BaseCacheManager cacheManager;
//   final String url;
//   final double scale;
//   final ValueNotifier<BetterCachedNetworkImageProviderStatus> statusNotifier;
//   final Map<String, String> headers;
//
//   @override
//   Future<BetterCachedNetworkImageProvider> obtainKey(
//           ImageConfiguration configuration) =>
//       SynchronousFuture<BetterCachedNetworkImageProvider>(this);
//
//   @override
//   ImageStreamCompleter load(
//     BetterCachedNetworkImageProvider key,
//     DecoderCallback decode,
//   ) {
//     return MultiFrameImageStreamCompleter(
//       codec: _loadAsync(key),
//       scale: key.scale,
// // TODO(xxx): enable information collector on next stable release of flutter
// //      informationCollector: () sync* {
// //        yield DiagnosticsProperty<ImageProvider>(
// //          'Image provider: $this \n Image key: $key',
// //          this,
// //          style: DiagnosticsTreeStyle.errorProperty,
// //        );
// //      },
//     );
//   }
//
//   Future<ui.Codec> _loadAsync(BetterCachedNetworkImageProvider key) async {
//     final manager = cacheManager ?? DefaultCacheManager();
//     // build内で使っている場合に即座に呼ばれて、この変更起点にsetState
//     // されるような処理を書いているとエラーが起こるのでその対処
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       statusNotifier?.value = BetterCachedNetworkImageProviderStatus.fetching;
//     });
//     final file = await manager.getSingleFile(url, headers: headers);
//     if (file == null) {
//       statusNotifier?.value = BetterCachedNetworkImageProviderStatus.error;
//       return Future<ui.Codec>.error('Couldn\'t download or retrieve file.');
//     }
//     return _loadAsyncFromFile(key, file);
//   }
//
//   Future<ui.Codec> _loadAsyncFromFile(
//       BetterCachedNetworkImageProvider key, File file) async {
//     assert(key == this);
//
//     final bytes = Uint8List.fromList(await file.readAsBytes());
//
//     if (bytes.lengthInBytes == 0) {
//       statusNotifier?.value = BetterCachedNetworkImageProviderStatus.error;
//       throw Exception('File was empty');
//     }
//
//     final result = await ui.instantiateImageCodec(bytes);
//     statusNotifier?.value = BetterCachedNetworkImageProviderStatus.fetched;
//     return result;
//   }
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is BetterCachedNetworkImageProvider &&
//           runtimeType == other.runtimeType &&
//           url == other.url &&
//           scale == other.scale;
//
//   @override
//   int get hashCode => url.hashCode ^ scale.hashCode;
//
//   @override
//   String toString() => '$runtimeType("$url", scale: $scale)';
// }
