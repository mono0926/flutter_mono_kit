import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mono_kit/utils/logger.dart';
import 'package:mono_kit/utils/utils.dart';

Future<List<XFile>> showPhotoSelectionSheet<T extends Object>({
  required BuildContext context,
  PhotoSelectionL10n l10n = const PhotoSelectionL10n(),
  VoidCallback? onSettingAppOpenRequested,
  bool requestFullMetadata = false,
  bool allowMultiple = false,
  (List<SheetAction<T>>, ValueSetter<T>)? additionalActions,
}) async {
  final source = await showModalActionSheet<Object>(
    context: context,
    title: l10n.title,
    actions: [
      SheetAction(
        icon: Icons.perm_media,
        label: l10n.chooseFromLibrary,
        key: ImageSource.gallery,
      ),
      SheetAction(
        icon: Icons.camera_alt,
        label: l10n.takePicture,
        key: ImageSource.camera,
      ),
      if (additionalActions != null) ...additionalActions.$1,
    ],
  );

  if (source == null) {
    return [];
  }

  final picker = ImagePicker();
  try {
    if (source == ImageSource.gallery && allowMultiple) {
      return await picker.pickMultiImage(
        requestFullMetadata: requestFullMetadata,
      );
    } else if (source is ImageSource) {
      final file = await picker.pickImage(
        source: source,
        requestFullMetadata: requestFullMetadata,
      );
      return file == null ? [] : [file];
    } else if (source is T) {
      additionalActions!.$2(source);
    } else {
      logger.warning('Invalid source type: $source');
    }
  } on PlatformException catch (e) {
    logger.warning(e);
    if (![
      ImagePickerErrorCodes.cameraAccessRestricted,
      ImagePickerErrorCodes.cameraAccessDenied,
      ImagePickerErrorCodes.photoAccessRestricted,
      ImagePickerErrorCodes.photoAccessDenied,
    ].contains(e.code)) {
      showErrorDialog(context: context, error: e);
      return [];
    }

    if (onSettingAppOpenRequested == null) {
      return [];
    }

    const okKey = 'ok';
    final result = await showModalActionSheet<String>(
      context: context,
      title: l10n.accessRestrictedTitle,
      message: l10n.accessRestrictedMessage,
      actions: [SheetAction(label: l10n.accessRestrictedOk, key: okKey)],
    );
    if (result == okKey) {
      onSettingAppOpenRequested();
    }
  }
  return [];
}

@immutable
class PhotoSelectionL10n {
  const PhotoSelectionL10n();
  String get title => '画像の選択';
  String get chooseFromLibrary => 'ライブラリから選択';
  String get takePicture => '写真を撮る';
  String get accessRestrictedTitle => '設定画面での許可が必要です';
  String get accessRestrictedMessage => '設定アプリで写真アクセスの許可をお願いします。';
  String get accessRestrictedOk => '設定アプリで許可';
}

class ImagePickerErrorCodes {
  static const cameraAccessRestricted = 'camera_access_restricted';
  static const cameraAccessDenied = 'camera_access_denied';
  static const photoAccessRestricted = 'photo_access_restricted';
  static const photoAccessDenied = 'photo_access_denied';
}
