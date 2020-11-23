import 'package:cctracker/models/PhotoData.dart';
import 'package:cctracker/resource/Repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:cctracker/models/CCData.dart';

class Bloc {
  final _repository = Repository();

  List<PhotoData> listPhotoOld;
  int savePage = 0;

  final _fetcherListData = PublishSubject<List<CCData>>();
  final _fetcherPhoto = PublishSubject<List<PhotoData>>();

  Observable<List<CCData>> get dataCC => _fetcherListData.stream;

  Observable<List<PhotoData>> get dataPhotos => _fetcherPhoto.stream;

  fetchListData() async {
    print(Text("fetchListData() async"));
    List<CCData> list = await _repository.fetchListData();
    _fetcherListData.sink.add(list);
  }

  upDateListData() async {
    print(Text("fetchPhoto() async"));
    _fetcherListData.sink.add(null);
    List<CCData> list = await _repository.upDateListData();
    _fetcherListData.sink.add(list);
  }

  fetchPhoto() async {
    print(Text("fetchPhoto() async"));
    List<PhotoData> listPhoto = await _repository.fetchPhoto();
    if (listPhotoOld != null) {
      if (listPhotoOld.length != listPhoto.length) {
        print(Text("listPhotoOld.length != listPhoto.length"));
        listPhotoOld = listPhoto;
        _fetcherPhoto.sink.add(listPhoto);
      } else {
        print("-------------------- error");
      }
    } else {
      print("-------------------- ok");
      listPhotoOld = listPhoto;
      _fetcherPhoto.sink.add(listPhoto);
    }
  }

  addPhoto(String jsonString) async {
    List<PhotoData> listPhoto = await _repository.addPhoto(jsonString);
    print("I get my list =====   ---  data.path =  " +
        listPhoto.length.toString());
    listPhotoOld = listPhoto;

    _fetcherPhoto.sink.add(listPhoto);
    await _repository.saveData();
  }


  dispose() {
    print("==== =---- - - dispose bloc  ");
  //  _repository.saveData();
    _fetcherListData.close();

    _fetcherPhoto.close();
  }

  disposePhotoStateBar(){
    listPhotoOld = null;
    print(Text("listPhotoOld == null"));
  }


}

final bloc = Bloc();
