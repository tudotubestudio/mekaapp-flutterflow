import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'orders_offer_model.dart';
export 'orders_offer_model.dart';

class OrdersOfferWidget extends StatefulWidget {
  const OrdersOfferWidget({Key? key}) : super(key: key);

  @override
  _OrdersOfferWidgetState createState() => _OrdersOfferWidgetState();
}

class _OrdersOfferWidgetState extends State<OrdersOfferWidget> {
  late OrdersOfferModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrdersOfferModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'OrdersOffer'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            logFirebaseEvent('ORDERS_OFFER_arrow_back_rounded_ICN_ON_T');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          'Lists Orders',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22.0,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
              child: InkWell(
                onTap: () async {
                  logFirebaseEvent('ORDERS_OFFER_ListTile_k671s5ko_ON_TAP');
                  logFirebaseEvent('ListTile_navigate_to');

                  context.pushNamed('CompareOrderAndOffre');
                },
                child: ListTile(
                  title: Text(
                    'Lorem ipsum dolor...',
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                  subtitle: Text(
                    'Lorem ipsum dolor...',
                    style: FlutterFlowTheme.of(context).titleSmall,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF303030),
                    size: 20.0,
                  ),
                  tileColor: Color(0xFFF5F5F5),
                  dense: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
