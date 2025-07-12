import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'image_provider.g.dart';


@riverpod
class ImageProvider extends _$ImageProvider {
  @override
 XFile?  build() {
    return null;
  }
  Future<void> pickAnImage () async {
    final ImagePicker picker = ImagePicker();
    state = await picker.pickImage(source: ImageSource.gallery);
  }

}


