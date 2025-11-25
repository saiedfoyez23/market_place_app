import 'dart:io';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class VendorProfilePortfolioController extends GetxController {

  Rx<File> selectedFile = File("").obs;


  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'svg', 'tiff', 'bmp', 'heic'],
      withData: false,
    );

    if (result != null && result.files.single.path != null) {
      selectedFile.value = File(result.files.single.path!);
    }
  }


  RxList<String> imageString = <String>[
    ImageUtils.portfolioImage1,
    ImageUtils.portfolioImage2,
    ImageUtils.portfolioImage3,
    ImageUtils.portfolioImage4,
    ImageUtils.portfolioImage5,
    ImageUtils.portfolioImage1,
    ImageUtils.portfolioImage2,
    ImageUtils.portfolioImage3,
    ImageUtils.portfolioImage4,
    ImageUtils.portfolioImage5,
    ImageUtils.portfolioImage1,
    ImageUtils.portfolioImage5,
  ].obs;


}