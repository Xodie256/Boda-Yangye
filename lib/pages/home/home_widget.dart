import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Dashboard',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineLarge,
                  ),
                  AuthUserStreamWidget(
                    builder: (context) => Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            currentUserPhoto,
                          ).image,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello,   ',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).headlineMedium,
                      ),
                      AuthUserStreamWidget(
                        builder: (context) => Text(
                          currentUserDisplayName,
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Are you in danger right now?\nPress panic to ask for help',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (FFAppState().panic == false)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().update(() {
                                    FFAppState().panic = true;
                                  });
                                  _model.phone = await queryContactRecordOnce(
                                    queryBuilder: (contactRecord) =>
                                        contactRecord.orderBy('PhoneNumber',
                                            descending: true),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  _model.locationLink =
                                      await actions.getLocation();
                                  _model.alertMessage =
                                      await actions.alertMessage(
                                    _model.locationLink!,
                                    currentUserDisplayName,
                                  );
                                  if (isiOS) {
                                    await launchUrl(Uri.parse(
                                        "sms:${_model.phone!.phoneNumber}&body=${Uri.encodeComponent(_model.alertMessage)}"));
                                  } else {
                                    await launchUrl(Uri(
                                      scheme: 'sms',
                                      path: _model.phone!.phoneNumber,
                                      queryParameters: <String, String>{
                                        'body': _model.alertMessage,
                                      },
                                    ));
                                  }

                                  setState(() {});
                                },
                                text: 'Panic',
                                icon: Icon(
                                  Icons.help_outline_outlined,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 200.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFE50C0F),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                            ),
                          if (FFAppState().panic == true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  _model.pic = await actions.takePicture();
                                  _shouldSetState = true;

                                  await currentUserReference!.update({
                                    'photoRecords':
                                        FieldValue.arrayUnion([_model.pic]),
                                  });
                                  final _localAuth = LocalAuthentication();
                                  bool _isBiometricSupported =
                                      await _localAuth.isDeviceSupported();
                                  bool canCheckBiometrics =
                                      await _localAuth.canCheckBiometrics;
                                  if (_isBiometricSupported &&
                                      canCheckBiometrics) {
                                    _model.verification =
                                        await _localAuth.authenticate(
                                            localizedReason: 'Verify Identity',
                                            options:
                                                const AuthenticationOptions(
                                                    biometricOnly: true));
                                    setState(() {});
                                  }

                                  _shouldSetState = true;
                                  if (_model.verification!) {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Are you sure you are safe?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('No'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Yes'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    setState(() {
                                      FFAppState().panic = false;
                                    });

                                    await currentUserReference!.update({
                                      'photoRecords':
                                          FieldValue.arrayRemove([_model.pic]),
                                    });
                                    _model.safe = await actions.safeMessage();
                                    _shouldSetState = true;
                                    if (isiOS) {
                                      await launchUrl(Uri.parse(
                                          "sms:${_model.phone!.phoneNumber}&body=${Uri.encodeComponent(_model.safe)}"));
                                    } else {
                                      await launchUrl(Uri(
                                        scheme: 'sms',
                                        path: _model.phone!.phoneNumber,
                                        queryParameters: <String, String>{
                                          'body': _model.safe,
                                        },
                                      ));
                                    }
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Cannot Verify'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) setState(() {});
                                },
                                text: 'Cancel',
                                icon: Icon(
                                  Icons.cancel_sharp,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 200.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF0AE311),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 10.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
