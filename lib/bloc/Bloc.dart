import 'package:cctracker/resource/Repository.dart';
import 'package:rxdart/rxdart.dart';

import 'package:cctracker/models/CCData.dart';

class Bloc {
  final _repository = Repository();
  final _fetcher = PublishSubject<List<CCData>>();

  Observable<List<CCData>> get allMovies => _fetcher.stream;

  fetch() async {
    List<CCData> list = await _repository.fetch();
    print(" list in Bloc, list.length =================== " + list.length.toString());
    _fetcher.sink.add(list);
  }

  dispose() {
    _fetcher.close();
  }
}

final bloc = Bloc();