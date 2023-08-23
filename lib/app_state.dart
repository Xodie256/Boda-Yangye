import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _panic = false;
  bool get panic => _panic;
  set panic(bool _value) {
    _panic = _value;
  }

  int _loop = 0;
  int get loop => _loop;
  set loop(int _value) {
    _loop = _value;
  }

  int _loop1 = 0;
  int get loop1 => _loop1;
  set loop1(int _value) {
    _loop1 = _value;
  }

  DocumentReference? _contactRef;
  DocumentReference? get contactRef => _contactRef;
  set contactRef(DocumentReference? _value) {
    _contactRef = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
