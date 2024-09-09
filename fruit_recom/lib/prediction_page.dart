import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

import 'predictionpage_model.dart';
export 'predictionpage_model.dart';

class PredictionpageWidget extends StatefulWidget {
  /// This is the page that will show the Model Recommendation Results
  const PredictionpageWidget({
    super.key,
    String? predface1label,
    String? predface2label,
    String? predface3label,
    double? predface1conf,
    double? predface2conf,
    double? predface3conf,
    String? predhair,
    required this.genAI,
    required this.fruitBenefitArray,
  })  : this.predface1label = predface1label ?? 'acne',
        this.predface2label = predface2label ?? 'acne',
        this.predface3label = predface3label ?? 'acne',
        this.predface1conf = predface1conf ?? 0.55,
        this.predface2conf = predface2conf ?? 0.55,
        this.predface3conf = predface3conf ?? 0.55,
        this.predhair = predhair ?? 'type3';

  final String predface1label;
  final String predface2label;
  final String predface3label;
  final double predface1conf;
  final double predface2conf;
  final double predface3conf;
  final String predhair;
  final dynamic genAI;
  final List<dynamic>? fruitBenefitArray;

  @override
  State<PredictionpageWidget> createState() => _PredictionpageWidgetState();
}

class _PredictionpageWidgetState extends State<PredictionpageWidget> {
  late PredictionpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PredictionpageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              expandedHeight: 70,
              pinned: false,
              floating: true,
              snap: true,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('HomePage');
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24,
                  ),
                ),
              ),
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/CD_logo.jpg',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      'Hello ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                    AuthUserStreamWidget(
                      builder: (context) => Text(
                        currentUserDisplayName,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Icon(
                    Icons.person_2_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 40,
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Face Scan Result',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Our Model has detected the following facial defects on your skin',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 12,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: Container(
                                    width: 100,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF1FBAA),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            0,
                                            2,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Text(
                                        widget!.predface1label,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 12,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 15)),
                            ),
                          ].divide(SizedBox(height: 10)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hair Loss Stage Prediction',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              widget!.predhair,
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 12,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].divide(SizedBox(height: 10)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Our Fruit Recommendation',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 10),
                                              child: Text(
                                                'Day ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Monday',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              'Tuesday',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              'Wednesday',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              'Thursday',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              'Friday',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              'Saturday',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              'Sunday',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(SizedBox(height: 30)),
                                        ),
                                      ]
                                          .divide(SizedBox(height: 5))
                                          .addToStart(SizedBox(height: 0)),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 5, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Fruits',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Monday.fruits.first.name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Monday.fruits.second.name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 5))
                                                .around(SizedBox(height: 5)),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Tuesday.fruits.first.name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Tuesday.fruits.second.name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 5))
                                                .around(SizedBox(height: 5)),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Wednesday.fruits.first.name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Wednesday.fruits.second.name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 5))
                                                .around(SizedBox(height: 5)),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Thursday.fruits.first.name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Thursday.fruits.second.name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 5))
                                                .around(SizedBox(height: 5)),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Friday.fruits.first.name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Friday.fruits.second.name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 5))
                                                .around(SizedBox(height: 5)),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Saturday.fruits.first.name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Saturday.fruits.second.name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 5))
                                                .around(SizedBox(height: 5)),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Sunday.fruits.first.name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Sunday.fruits.second.name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 5))
                                                .around(SizedBox(height: 5)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 5, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Quantity',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Monday.fruits.first.dosage''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Monday.fruits.second.dosage''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 5))
                                                .around(SizedBox(height: 5)),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Tuesday.fruits.first.dosage''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Tuesday.fruits.second.dosage''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 5))
                                                .around(SizedBox(height: 5)),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Wednesday.fruits.first.dosage''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Wednesday.fruits.second.dosage''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 5))
                                                .around(SizedBox(height: 5)),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Thursday.fruits.first.dosage''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Thursday.fruits.second.dosage''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 5))
                                                .around(SizedBox(height: 5)),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Friday.fruits.first.dosage''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Friday.fruits.second.dosage''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 5))
                                                .around(SizedBox(height: 5)),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Saturday.fruits.first.dosage''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Saturday.fruits.second.dosage''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 5))
                                                .around(SizedBox(height: 5)),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Sunday.fruits.first.dosage''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  widget!.genAI,
                                                  r'''$.Sunday.fruits.second.dosage''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 5))
                                                .around(SizedBox(height: 5)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 10)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'How the Fruit recommendation would help you achieve your goal',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Builder(
                              builder: (context) {
                                final fruitBenefitsArray1 =
                                    widget!.fruitBenefitArray!.toList();

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                        fruitBenefitsArray1.length,
                                        (fruitBenefitsArray1Index) {
                                      final fruitBenefitsArray1Item =
                                          fruitBenefitsArray1[
                                              fruitBenefitsArray1Index];
                                      return Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                              child: Image.network(
                                                getJsonField(
                                                  fruitBenefitsArray1Item,
                                                  r'''$.image''',
                                                ).toString(),
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Text(
                                              getJsonField(
                                                fruitBenefitsArray1Item,
                                                r'''$.fruit''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              getJsonField(
                                                fruitBenefitsArray1Item,
                                                r'''$.benefit''',
                                              ).toString(),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 10,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(SizedBox(height: 5)),
                                        ),
                                      );
                                    }).divide(SizedBox(width: 15)),
                                  ),
                                );
                              },
                            ),
                          ].divide(SizedBox(height: 10)),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 40))
                        .addToStart(SizedBox(height: 20))
                        .addToEnd(SizedBox(height: 20)),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
