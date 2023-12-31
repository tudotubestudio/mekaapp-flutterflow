import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '../../auth/base_auth_user_provider.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : SignInWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : SignInWidget(),
        ),
        FFRoute(
          name: 'SignUp',
          path: '/signUp',
          builder: (context, params) => SignUpWidget(),
        ),
        FFRoute(
          name: 'SignIn',
          path: '/signIn',
          builder: (context, params) => SignInWidget(),
        ),
        FFRoute(
          name: 'Boot',
          path: '/boot',
          requireAuth: true,
          builder: (context, params) => BootWidget(),
        ),
        FFRoute(
          name: 'List_date_proches_this_week',
          path: '/listDateProchesThisWeek',
          requireAuth: true,
          builder: (context, params) => ListDateProchesThisWeekWidget(),
        ),
        FFRoute(
          name: 'Log_products_date_proches_this_week',
          path: '/logProductsDateProchesThisWeek',
          requireAuth: true,
          builder: (context, params) => LogProductsDateProchesThisWeekWidget(),
        ),
        FFRoute(
          name: 'GpsBcd',
          path: '/gpsBcd',
          requireAuth: true,
          builder: (context, params) => GpsBcdWidget(),
        ),
        FFRoute(
          name: 'TrackRealOps',
          path: '/trackRealOps',
          requireAuth: true,
          builder: (context, params) => TrackRealOpsWidget(),
        ),
        FFRoute(
          name: 'Clients',
          path: '/clients',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Clients')
              : ClientsWidget(),
        ),
        FFRoute(
          name: 'Client',
          path: '/client',
          requireAuth: true,
          builder: (context, params) => ClientWidget(
            client: params.getParam('client', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'Selles',
          path: '/selles',
          requireAuth: true,
          builder: (context, params) => SellesWidget(),
        ),
        FFRoute(
          name: 'Offers',
          path: '/offers',
          requireAuth: true,
          builder: (context, params) => OffersWidget(),
        ),
        FFRoute(
          name: 'Lists',
          path: '/lists',
          requireAuth: true,
          builder: (context, params) => ListsWidget(),
        ),
        FFRoute(
          name: 'AddOffre',
          path: '/addOffre',
          requireAuth: true,
          builder: (context, params) => AddOffreWidget(),
        ),
        FFRoute(
          name: 'AddListOffre',
          path: '/addListOffre',
          requireAuth: true,
          builder: (context, params) => AddListOffreWidget(),
        ),
        FFRoute(
          name: 'OrdersOffer',
          path: '/ordersOffer',
          requireAuth: true,
          builder: (context, params) => OrdersOfferWidget(),
        ),
        FFRoute(
          name: 'Main',
          path: '/main',
          requireAuth: true,
          builder: (context, params) =>
              params.isEmpty ? NavBarPage(initialPage: 'Main') : MainWidget(),
        ),
        FFRoute(
          name: 'CompareOrderAndOffre',
          path: '/compareOrderAndOffre',
          requireAuth: true,
          builder: (context, params) => CompareOrderAndOffreWidget(),
        ),
        FFRoute(
          name: 'Tasks',
          path: '/tasks',
          requireAuth: true,
          builder: (context, params) => TasksWidget(),
        ),
        FFRoute(
          name: 'addTask',
          path: '/addTask',
          requireAuth: true,
          builder: (context, params) => AddTaskWidget(),
        ),
        FFRoute(
          name: 'ShowPack',
          path: '/showPack',
          requireAuth: true,
          builder: (context, params) => ShowPackWidget(
            pack: params.getParam('pack', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'addTaskCopy',
          path: '/addTaskCopy',
          requireAuth: true,
          builder: (context, params) => AddTaskCopyWidget(),
        ),
        FFRoute(
          name: 'GetGiftTask',
          path: '/getGiftTask',
          requireAuth: true,
          builder: (context, params) => GetGiftTaskWidget(
            task: params.getParam('task', ParamType.JSON),
            order: params.getParam('order', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'MekaApp',
          path: '/mekaApp',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'MekaApp')
              : MekaAppWidget(),
        ),
        FFRoute(
          name: 'ClientsAdmin',
          path: '/clientsAdmin',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ClientsAdmin')
              : ClientsAdminWidget(),
        ),
        FFRoute(
          name: 'ClientsAdminToday',
          path: '/clientsAdminToday',
          requireAuth: true,
          builder: (context, params) => ClientsAdminTodayWidget(),
        ),
        FFRoute(
          name: 'ClientsAdminNoPay',
          path: '/clientsAdminNoPay',
          requireAuth: true,
          builder: (context, params) => ClientsAdminNoPayWidget(),
        ),
        FFRoute(
          name: 'GenerateOrdersMissions',
          path: '/generateOrdersMissions',
          requireAuth: true,
          builder: (context, params) => GenerateOrdersMissionsWidget(),
        ),
        FFRoute(
          name: 'PDFOrdreMission',
          path: '/pDFOrdreMission',
          requireAuth: true,
          builder: (context, params) => PDFOrdreMissionWidget(),
        ),
        FFRoute(
          name: 'LogsOrdreMissions',
          path: '/logsOrdreMissions',
          requireAuth: true,
          builder: (context, params) => LogsOrdreMissionsWidget(),
        ),
        FFRoute(
          name: 'PDFEtatRegionLivreurOrdreMission',
          path: '/pDFEtatRegionLivreurOrdreMission',
          requireAuth: true,
          builder: (context, params) => PDFEtatRegionLivreurOrdreMissionWidget(
            region: params.getParam('region', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'PDFEtatRegionLivreurOrdreMissionCopy',
          path: '/pDFEtatRegionLivreurOrdreMissionCopy',
          requireAuth: true,
          builder: (context, params) =>
              PDFEtatRegionLivreurOrdreMissionCopyWidget(
            region: params.getParam('region', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'PDFEtatRegionLivreurOrdreMissionCopyCopy',
          path: '/pDFEtatRegionLivreurOrdreMissionCopyCopy',
          requireAuth: true,
          builder: (context, params) =>
              PDFEtatRegionLivreurOrdreMissionCopyCopyWidget(
            region: params.getParam('region', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'ClientsAdminEnCours',
          path: '/clientsAdminEnCours',
          requireAuth: true,
          builder: (context, params) => ClientsAdminEnCoursWidget(),
        ),
        FFRoute(
          name: 'ScanBonPour',
          path: '/scanBonPour',
          requireAuth: true,
          builder: (context, params) => ScanBonPourWidget(),
        ),
        FFRoute(
          name: 'ListPaymentBookLinesRest',
          path: '/listPaymentBookLinesRest',
          requireAuth: true,
          builder: (context, params) => ListPaymentBookLinesRestWidget(
            xxPaymentbookId:
                params.getParam('xxPaymentbookId', ParamType.String),
            documentNo: params.getParam('documentNo', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'CreatePaymentBonPour',
          path: '/createPaymentBonPour',
          requireAuth: true,
          builder: (context, params) => CreatePaymentBonPourWidget(
            documentno: params.getParam('documentno', ParamType.int),
            xxPaymentBookLineId:
                params.getParam('xxPaymentBookLineId', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'CarnetsBonPour',
          path: '/carnetsBonPour',
          requireAuth: true,
          builder: (context, params) => CarnetsBonPourWidget(),
        ),
        FFRoute(
          name: 'PDFQrCodeCarnet',
          path: '/pDFQrCodeCarnet',
          requireAuth: true,
          builder: (context, params) => PDFQrCodeCarnetWidget(
            carnet: params.getParam('carnet', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'pdfDechargeCarnet',
          path: '/pdfDechargeCarnet',
          requireAuth: true,
          builder: (context, params) => PdfDechargeCarnetWidget(),
        ),
        FFRoute(
          name: 'addqora',
          path: '/addqora',
          requireAuth: true,
          builder: (context, params) => AddqoraWidget(),
        ),
        FFRoute(
          name: 'ArchivedInvoice',
          path: '/archivedInvoice',
          requireAuth: true,
          builder: (context, params) => ArchivedInvoiceWidget(),
        ),
        FFRoute(
          name: 'MekaAI',
          path: '/mekaAI',
          requireAuth: true,
          asyncParams: {
            'user': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => MekaAIWidget(
            chat: params.getParam('chat', ParamType.JSON),
            user: params.getParam('user', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'AllChatsPage',
          path: '/allChatsPage',
          requireAuth: true,
          builder: (context, params) => AllChatsPageWidget(),
        ),
        FFRoute(
          name: 'CreateGroupChatPage',
          path: '/createGroupChatPage',
          requireAuth: true,
          builder: (context, params) => CreateGroupChatPageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/signIn';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/292556890_418134813698790_5263401774487634117_n.jpg',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
