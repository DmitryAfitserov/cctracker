import 'package:cctracker/models/CCData.dart';
import 'package:cctracker/models/PhotoData.dart';
import 'package:cctracker/resource/APIProvider.dart';

import 'PreferencesUtil.dart';

class Repository {
  final apiProvider = APIProvider();
  final preferencesUtil = PreferencesUtil();

  Future<List<CCData>> fetchListData() => apiProvider.loadCC();

  Future<List<PhotoData>> fetchPhoto() => preferencesUtil.loadListPhoto();

  Future<List<PhotoData>> addPhoto(String jsonString) => preferencesUtil.addPhoto(jsonString);
  saveData() => preferencesUtil.saveData();
}
