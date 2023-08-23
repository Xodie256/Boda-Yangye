import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyContactsCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  String? _nameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Enter a name';
    }
    return null;
  }

  // State field(s) for Email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Invalid email';
    }
    return null;
  }

  // State field(s) for PhoneNumber widget.
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  String? _phoneNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^\\+256\\d{9}\$').hasMatch(val)) {
      return 'Invalid Number Format';
    }
    return null;
  }

  // State field(s) for HomeAddress widget.
  TextEditingController? homeAddressController;
  String? Function(BuildContext, String?)? homeAddressControllerValidator;
  // State field(s) for BodaStage widget.
  TextEditingController? bodaStageController;
  String? Function(BuildContext, String?)? bodaStageControllerValidator;
  // State field(s) for LicensePlate widget.
  TextEditingController? licensePlateController;
  String? Function(BuildContext, String?)? licensePlateControllerValidator;
  String? _licensePlateControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^U[A-Z]{2}\\s\\d{3}[A-Z]?\$|^\$').hasMatch(val)) {
      return 'Invalid number plate';
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nameControllerValidator = _nameControllerValidator;
    emailControllerValidator = _emailControllerValidator;
    phoneNumberControllerValidator = _phoneNumberControllerValidator;
    licensePlateControllerValidator = _licensePlateControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    nameController?.dispose();
    emailController?.dispose();
    phoneNumberController?.dispose();
    homeAddressController?.dispose();
    bodaStageController?.dispose();
    licensePlateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
