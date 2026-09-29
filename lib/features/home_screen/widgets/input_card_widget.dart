import 'dart:io';

import 'package:contactapp/core/theme/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../../../core/theme/app_colors.dart';

class InputCardWidget extends StatefulWidget {
  const InputCardWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.onImagePicked,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final ValueChanged<XFile?> onImagePicked;

  @override
  State<InputCardWidget> createState() => _InputCardWidgetState();
}

class _InputCardWidgetState extends State<InputCardWidget> {
  XFile? _pickedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickedImage = image;
      });
    }
    widget.onImagePicked(image);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: _pickImage,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: AppColors.gold),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: _pickedImage == null
                  ? Lottie.asset(
                      AppAnimations.imagePickerAnimation,
                      fit: BoxFit.contain,
                    )
                  : Image.file(File(_pickedImage!.path), fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder(
                valueListenable: widget.nameController,
                builder: (context, value, child) => Text(
                  value.text.isEmpty ? "User Name" : value.text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gold,
                  ),
                ),
              ),
              const Divider(color: AppColors.gold),
              ValueListenableBuilder(
                valueListenable: widget.emailController,
                builder: (context, value, child) => Text(
                  value.text.isEmpty ? "example@email.com" : value.text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gold,
                  ),
                ),
              ),
              const Divider(color: AppColors.gold),
              ValueListenableBuilder(
                valueListenable: widget.phoneController,
                builder: (context, value, child) => Text(
                  value.text.isEmpty ? "+200000000000" : value.text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gold,
                  ),
                ),
              ),
              const Divider(color: AppColors.gold),
            ],
          ),
        ),
      ],
    );
  }
}
