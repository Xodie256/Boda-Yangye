import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContactRecord extends FirestoreRecord {
  ContactRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "PhoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "BodaStage" field.
  String? _bodaStage;
  String get bodaStage => _bodaStage ?? '';
  bool hasBodaStage() => _bodaStage != null;

  // "LicensePlate" field.
  String? _licensePlate;
  String get licensePlate => _licensePlate ?? '';
  bool hasLicensePlate() => _licensePlate != null;

  // "HomeAddress" field.
  String? _homeAddress;
  String get homeAddress => _homeAddress ?? '';
  bool hasHomeAddress() => _homeAddress != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "Createdby" field.
  DocumentReference? _createdby;
  DocumentReference? get createdby => _createdby;
  bool hasCreatedby() => _createdby != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _phoneNumber = snapshotData['PhoneNumber'] as String?;
    _bodaStage = snapshotData['BodaStage'] as String?;
    _licensePlate = snapshotData['LicensePlate'] as String?;
    _homeAddress = snapshotData['HomeAddress'] as String?;
    _email = snapshotData['Email'] as String?;
    _createdby = snapshotData['Createdby'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('contact')
          : FirebaseFirestore.instance.collectionGroup('contact');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('contact').doc();

  static Stream<ContactRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContactRecord.fromSnapshot(s));

  static Future<ContactRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContactRecord.fromSnapshot(s));

  static ContactRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContactRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContactRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContactRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContactRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContactRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContactRecordData({
  String? name,
  String? phoneNumber,
  String? bodaStage,
  String? licensePlate,
  String? homeAddress,
  String? email,
  DocumentReference? createdby,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'PhoneNumber': phoneNumber,
      'BodaStage': bodaStage,
      'LicensePlate': licensePlate,
      'HomeAddress': homeAddress,
      'Email': email,
      'Createdby': createdby,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContactRecordDocumentEquality implements Equality<ContactRecord> {
  const ContactRecordDocumentEquality();

  @override
  bool equals(ContactRecord? e1, ContactRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.bodaStage == e2?.bodaStage &&
        e1?.licensePlate == e2?.licensePlate &&
        e1?.homeAddress == e2?.homeAddress &&
        e1?.email == e2?.email &&
        e1?.createdby == e2?.createdby;
  }

  @override
  int hash(ContactRecord? e) => const ListEquality().hash([
        e?.name,
        e?.phoneNumber,
        e?.bodaStage,
        e?.licensePlate,
        e?.homeAddress,
        e?.email,
        e?.createdby
      ]);

  @override
  bool isValidKey(Object? o) => o is ContactRecord;
}
