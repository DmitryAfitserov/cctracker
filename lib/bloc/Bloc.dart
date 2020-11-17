import 'package:cctracker/models/PhotoData.dart';
import 'package:cctracker/resource/Repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:cctracker/models/CCData.dart';

class Bloc {
  final _repository = Repository();

  List<PhotoData> listPhotoOld;

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
    if (listPhotoOld != null) {
      if (listPhotoOld.length != listPhoto.length) {
        print(Text("listPhotoOld.length != listPhoto.length"));
        listPhotoOld = listPhoto;
        _fetcherPhoto.sink.add(listPhoto);
      } else {
        print("-------------------- error");
      }
    } else {
      _fetcherPhoto.sink.add(listPhoto);
    }
  }

  addPhoto(String jsonString) async {
    List<PhotoData> listPhoto = await _repository.addPhoto(jsonString);
    print("I get my list =====   ---  data.path =  " +
        listPhoto.length.toString());
    listPhotoOld = listPhoto;
    _repository.saveData();
    _fetcherPhoto.sink.add(listPhoto);
  }


  dispose() {
    print("==== =---- - - dispose bloc  ");
  //  _repository.saveData();
    _fetcherListData.close();

    _fetcherPhoto.close();
  }


}

final bloc = Bloc();
