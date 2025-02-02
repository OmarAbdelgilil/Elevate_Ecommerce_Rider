import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../../utils/assets_manager.dart';
import '../../../../../../../utils/color_manager.dart';
import '../../../../../../../utils/strings_manager.dart';
import '../../../../../../../utils/text_style.dart';
import '../../../../../../../utils/values_manager.dart';

class FilePickerField extends StatelessWidget {
  const FilePickerField({
    super.key,
    required this.controlledFile,
    required this.placeholder,
    required this.onFilePicked,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.borderColor,
    this.labelTextStyle,
  });

  final File? controlledFile;
  final String placeholder;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? borderRadius;
  final Color? borderColor;
  final TextStyle? labelTextStyle;
  final void Function(File?) onFilePicked;

  Future<void> _getFileFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      onFilePicked(File(pickedFile.path));
    } else {
      onFilePicked(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultBorderRadius = borderRadius ?? AppSize.s10;
    final defaultBorderColor = borderColor ?? ColorManager.black;
    final defaultBackgroundColor = backgroundColor ?? Colors.transparent;
    final defaultLabelTextStyle = labelTextStyle ??
        AppTextStyles.title(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: ColorManager.black,
        );

    return FormField(
      validator: (_) {
        if (controlledFile == null) {
          return StringsManager.validationsFieldRequired.tr();
        }
        return null;
      },
      builder: (formState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: AppPadding.p10,
                top: AppPadding.p4,
                bottom: AppPadding.p5,
              ),
              child: Text(
                placeholder,
                style: defaultLabelTextStyle,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(AppPadding.p10),
              decoration: BoxDecoration(
                color: defaultBackgroundColor,
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                border: Border.all(
                  color: formState.isValid
                      ? ColorManager.green
                      : formState.hasError
                      ? ColorManager.error
                      : defaultBorderColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  controlledFile != null  ? const Icon(Icons.check_circle_outline,color: ColorManager.green,):Text(
                    '0 ${StringsManager.imagesSelected.tr()}',
                    style: GoogleFonts.kreon(
                      color: ColorManager.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _getFileFromGallery(context),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: SvgPicture.asset(
                        SVGAssets.upload,
                        color: foregroundColor ?? ColorManager.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            if (controlledFile != null)
              Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      controlledFile!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            if (formState.hasError && !formState.isValid)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Icon(Icons.error_outline, color: ColorManager.error, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      formState.errorText!,
                      style: GoogleFonts.kreon(
                        color: ColorManager.error,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}