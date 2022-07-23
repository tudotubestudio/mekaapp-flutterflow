import '../compare_order_and_offre/compare_order_and_offre_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersOfferWidget extends StatefulWidget {
  const OrdersOfferWidget({Key? key}) : super(key: key);

  @override
  _OrdersOfferWidgetState createState() => _OrdersOfferWidgetState();
}

class _OrdersOfferWidgetState extends State<OrdersOfferWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Lists Orders',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompareOrderAndOffreWidget(),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                    'Lorem ipsum dolor...',
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                  subtitle: Text(
                    'Lorem ipsum dolor...',
                    style: FlutterFlowTheme.of(context).subtitle2,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF303030),
                    size: 20,
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
