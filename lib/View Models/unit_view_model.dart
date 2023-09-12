import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:unit_reflections/Models/units_data.dart';

class UnitViewModel with ChangeNotifier {
  //for our error handling
  bool _error = false;
  bool get error => _error;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  //a map to store our JSON after downloading
  Map _unitsMap = {};
  Map get unitsMap => _unitsMap;
  //Will store the Units list in here after retrieving

  final List<Units> _units = [];
  List<Units> get units => _units;

//we will use this to look for the searched unit in the list of units
  int _unitSelected = -1;
  int get unitSelected => _unitSelected;

  set setUnitSearched(int unit) {
    _unitSelected = unit;
    notifyListeners();
  }

  bool _noSpecFound = false;
  bool get noSpecs => _noSpecFound;
  bool _downloading = false;
  bool get downloading => _downloading;

//fetching the information from the server
  Future<void> get getSpecs async {
    try {
      _downloading = true; //we update the UI to load
      final response = await get(
        Uri.parse(
            'https://dl.dropboxusercontent.com/s/bqop1r0plejx1ez/Units%201-3.json?dl=0'),
      );
      if (response.statusCode == 200) {
        _unitsMap = jsonDecode(response.body);
        _downloading = false;
        notifyListeners();
        if (_unitsMap.isNotEmpty) {
          try {
            for (int i = 0; i < _unitsMap['Specs'].length; i++) {
              //updating the units list to have the downloaded Specs

              updateUnitList(i, _unitsMap['Specs'][i]);
            }
            _units.length = _unitsMap['Specs'].length;
          } catch (e) {
            _error = true;
            _errorMessage = e.toString();
          }
        }
      } else {
        _noSpecFound = true;
        _error = true;
        _errorMessage = 'No Data Found!';
      }
    } catch (error) {
      _noSpecFound = true;
      _error = true;
      _errorMessage = 'Connection failed!!';
    }
    notifyListeners();
  }

  //inserting into the Unit list,we will use this on the UI
  List<Units> updateUnitList(int index, Map map) {
    Units unit = Units();
    unit.concept = map['concepts'];
    unit.definition = map['definition'];
    unit.image = map['image'];
    unit.unit = map['unit'];
    _units.insert(index, unit);
    return _units;
  }
}
