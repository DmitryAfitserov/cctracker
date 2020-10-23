import 'package:cctracker/models/CCData.dart';
import 'package:cctracker/resource/APIProvider.dart';

class Repository {
  final apiProvider = APIProvider();

  Future<List<CCData>> fetch() => apiProvider.loadCC();

}