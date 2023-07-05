import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mono_kit/utils/logger.dart';
import 'package:mono_kit/utils/utils.dart';

Future<List<XFile>> showMultiPhotoSelectionSheet({
  required BuildContext context,
  PhotoSelectionL10n l10n = const PhotoSelectionL10n(),
  VoidCallback? onSettingAppOpenRequested,
  bool requestFullMetadata = false,
}) async {
  final source = await showModalActionSheet<ImageSource>(
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
      )
    ],
  );

  if (source == null) {
    return [];
  }

  final picker = ImagePicker();
  try {
    switch (source) {
      case ImageSource.camera:
        final file = await picker.pickImage(
          source: source,
          requestFullMetadata: requestFullMetadata,
        );
        return file == null ? [] : [file];
      case ImageSource.gallery:
        return await picker.pickMultiImage(
          requestFullMetadata: requestFullMetadata,
        );
    }
  } on PlatformException catch (e) {
    logger.warning(e);
    if (![
      ImagePickerErrorCodes.cameraAccessRestricted,
      ImagePickerErrorCodes.cameraAccessDenied,
      ImagePickerErrorCodes.photoAccessRestricted,
      ImagePickerErrorCodes.photoAccessDenied,
    ].contains(e.code)) {
      // ignore: use_build_context_synchronously
      showErrorDialog(context: context, error: e);
      return [];
    }

    if (onSettingAppOpenRequested == null) {
      return [];
    }

    const okKey = 'ok';
    // ignore: use_build_context_synchronously
    final result = await showModalActionSheet<String>(
      context: context,
      title: l10n.accessRestrictedTitle,
      message: l10n.accessRestrictedMessage,
      actions: [
        SheetAction(
          label: l10n.accessRestrictedOk,
          key: okKey,
        ),
      ],
    );
    if (result == okKey) {
      onSettingAppOpenRequested();
    }
  }
  return [];
}

@Deprecated('Use showMultiPhotoSelectionSheet')
Future<XFile?> showPhotoSelectionSheet({
  required BuildContext context,
  PhotoSelectionL10n l10n = const PhotoSelectionL10n(),
  VoidCallback? onSettingAppOpenRequested,
  bool requestFullMetadata = false,
}) async {
  final files = await showMultiPhotoSelectionSheet(
    context: context,
    l10n: l10n,
    onSettingAppOpenRequested: onSettingAppOpenRequested,
    requestFullMetadata: requestFullMetadata,
  );
  return files.firstOrNull;
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
