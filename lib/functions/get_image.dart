import 'dart:io';

import 'package:image_picker/image_picker.dart';

class GetImage{
  static Future<File?> getImage() async {
    File? image;
    final picker = ImagePicker();
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>1");
    final pickerFile = await picker.pickImage(source: ImageSource.camera);
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>2");
      if (pickerFile != null) {
        image = File(pickerFile.path);
      } else {
        print('No photo');
      }

      return image;
  }
}