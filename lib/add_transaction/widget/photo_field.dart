import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:personal_finance_app/add_transaction/bloc/add_transaction_bloc.dart';

/// Care! It means when we pick photo, it will save this photo to our
/// app's directory, probably need to fix it.
class PhotoField extends StatelessWidget {
  PhotoField({super.key});

  final ImagePicker _picker = ImagePicker();
  Future<String?> pickedPhoto() async {
    try {
      final pickPhoto = await _picker.pickImage(source: ImageSource.gallery);
      return pickPhoto!.path;
    } catch (e) {
      return null;
    }
  }

  // Future<void> savePhoto() async {
  //   final path = (await getExternalStorageDirectory())!.path;
  //   final savePath = '$path/${pickPhoto!.name}';
  //   await pickPhoto.saveTo(savePath);
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTransactionBloc, AddTransactionState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            final bloc = context.read<AddTransactionBloc>();
            final path = await pickedPhoto();
            if (path != null) {
              bloc.add(AddTransactionPhotoChanged(path));
            }
          },
          child: AspectRatio(
            aspectRatio: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Builder(
                builder: (context) {
                  if (context
                          .read<AddTransactionBloc>()
                          .state
                          .selectImagePath ==
                      null) {
                    return const Icon(
                      Icons.camera_alt,
                    );
                  }
                  return Image.file(
                    File(
                      state.selectImagePath!,
                    ),
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
