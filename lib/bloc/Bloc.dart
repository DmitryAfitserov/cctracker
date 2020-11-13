

import 'package:cctracker/models/PhotoData.dart';
import 'package:cctracker/resource/Repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import 'package:cctracker/models/CCData.dart';

class Bloc {
  final _repository = Repository();

  final _fetcherListData = PublishSubject<List<CCData>>();
  final _fetcherPhoto = PublishSubject<List<PhotoData>>();

  Observable<List<CCData>> get dataCC => _fetcherListData.stream;
  Observable<List<PhotoData>> get dataPhotos => _fetcherPhoto.stream;

  fetchListData() async {
    List<CCData> list = await _repository.fetchListData();
    _fetcherListData.sink.add(list);
  }

  fetchPhoto() async {
    List<PhotoData> listPhoto = await _repository.fetchPhoto();
    print(Text("List<PhotoData> listPhoto = await _repository.fetchPhoto(); ------ ok"));
    _fetcherPhoto.sink.add(listPhoto);
  }

  addPhoto(String jsonString) async {
    await _repository.addPhoto(jsonString);
  //  _fetcherPhoto.sink.add(listPhoto);
  }

  dispose() {
    _fetcherPhoto.close();
    _fetcherListData.close();
  }
}

final bloc = Bloc();