import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Clients Group Code

class ClientsGroup {
  static String baseUrl = 'https://mekaapp.com/bcd/backend/api';
  static Map<String, String> headers = {};
  static ListClientsByOpCall listClientsByOpCall = ListClientsByOpCall();
  static DebloqeClientCall debloqeClientCall = DebloqeClientCall();
  static TasksDebloqeClientsCall tasksDebloqeClientsCall =
      TasksDebloqeClientsCall();
  static TasksDebloqeClientsEnCoursCall tasksDebloqeClientsEnCoursCall =
      TasksDebloqeClientsEnCoursCall();
  static UpdateTaskClientCall updateTaskClientCall = UpdateTaskClientCall();
  static RefuserBlockCall refuserBlockCall = RefuserBlockCall();
  static TasksNoValidTodayCall tasksNoValidTodayCall = TasksNoValidTodayCall();
  static TasksNoValidCall tasksNoValidCall = TasksNoValidCall();
  static RapportRouteByMonthsCall rapportRouteByMonthsCall =
      RapportRouteByMonthsCall();
  static LogCallCall logCallCall = LogCallCall();
  static PaymentsClientAfterTaskCall paymentsClientAfterTaskCall =
      PaymentsClientAfterTaskCall();
  static PaymentCheckCall paymentCheckCall = PaymentCheckCall();
  static ListTasksNoPayCall listTasksNoPayCall = ListTasksNoPayCall();
}

class ListClientsByOpCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? page,
    int? sizePage,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'list clients by op',
      apiUrl: '${ClientsGroup.baseUrl}/clients',
      callType: ApiCallType.GET,
      headers: {
        ...ClientsGroup.headers,
      },
      params: {
        'token': token,
        'page': page,
        'sizePage': sizePage,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic rateAPlus(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.mm_rate=='A+')]''',
        true,
      );
  dynamic rateA(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.mm_rate=='A')]''',
        true,
      );
  dynamic rateB(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.mm_rate=='B')]''',
        true,
      );
  dynamic rateC(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.mm_rate=='C')]''',
        true,
      );
  dynamic rateD(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.mm_rate=='D')]''',
        true,
      );
  dynamic rateE(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.mm_rate=='E')]''',
        true,
      );
  dynamic rateF(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.mm_rate=='F')]''',
        true,
      );
}

class DebloqeClientCall {
  Future<ApiCallResponse> call({
    String? cBpartnerId = '',
    int? type,
    String? disc = '',
    String? token = '',
    String? datePay = '',
    double? montant,
    String? typePay = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Debloqe client',
      apiUrl: '${ClientsGroup.baseUrl}/addTaskClientBlock',
      callType: ApiCallType.POST,
      headers: {
        ...ClientsGroup.headers,
      },
      params: {
        'c_bpartner_id': cBpartnerId,
        'type': type,
        'disc': disc,
        'token': token,
        'date_pay': datePay,
        'montant': montant,
        'type_pay': typePay,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TasksDebloqeClientsCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? page,
    int? sizePage = 30,
    int? cBpartnerId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Tasks Debloqe clients',
      apiUrl: '${ClientsGroup.baseUrl}/tasks',
      callType: ApiCallType.GET,
      headers: {
        ...ClientsGroup.headers,
      },
      params: {
        'token': token,
        'order': "desc",
        'col': "created_at",
        'sizePage': sizePage,
        'page': page,
        'c_bpartner_id': cBpartnerId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic tasksEncoure(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.status=='0')]''',
        true,
      );
  dynamic tasksTerminer(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.status=='1')]''',
        true,
      );
  dynamic tasksRefus(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.status=='2')]''',
        true,
      );
}

class TasksDebloqeClientsEnCoursCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? page,
    int? sizePage,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Tasks Debloqe clients En cours',
      apiUrl: '${ClientsGroup.baseUrl}/tasks/list_en_cours',
      callType: ApiCallType.GET,
      headers: {
        ...ClientsGroup.headers,
      },
      params: {
        'token': token,
        'order': "desc",
        'col': "created_at",
        'sizePage': sizePage,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic tasksEncoure(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.status=='0')]''',
        true,
      );
  dynamic tasksTerminer(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.status=='1')]''',
        true,
      );
  dynamic tasksRefus(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.status=='2')]''',
        true,
      );
}

class UpdateTaskClientCall {
  Future<ApiCallResponse> call({
    int? type,
    int? cBpartnerId,
    String? xxDate = '',
    double? soCreditlimit,
    int? charkTasksId,
    String? token = '',
    String? replySuper = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Update Task Client',
      apiUrl: '${ClientsGroup.baseUrl}/updateTaskClientBlock',
      callType: ApiCallType.PUT,
      headers: {
        ...ClientsGroup.headers,
      },
      params: {
        'type': type,
        'c_bpartner_id': cBpartnerId,
        'xx_date': xxDate,
        'so_creditlimit': soCreditlimit,
        'chark_tasks_id': charkTasksId,
        'token': token,
        'reply_super': replySuper,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RefuserBlockCall {
  Future<ApiCallResponse> call({
    int? taskId,
    String? token = '',
    String? replySuper = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Refuser Block',
      apiUrl: '${ClientsGroup.baseUrl}/tasks/client/block/refuser_order',
      callType: ApiCallType.GET,
      headers: {
        ...ClientsGroup.headers,
      },
      params: {
        'taskId': taskId,
        'token': token,
        'reply_super': replySuper,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TasksNoValidTodayCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? page,
    int? sizePage,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Tasks no valid today',
      apiUrl: '${ClientsGroup.baseUrl}/tasks/tasks_no_valid_today',
      callType: ApiCallType.GET,
      headers: {
        ...ClientsGroup.headers,
      },
      params: {
        'token': token,
        'page': page,
        'sizePage': sizePage,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class TasksNoValidCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? page,
    int? sizePage,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Tasks no valid',
      apiUrl: '${ClientsGroup.baseUrl}/tasks/tasks_no_valid',
      callType: ApiCallType.GET,
      headers: {
        ...ClientsGroup.headers,
      },
      params: {
        'token': token,
        'page': page,
        'sizePage': sizePage,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class RapportRouteByMonthsCall {
  Future<ApiCallResponse> call({
    int? cBpartnerId,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'rapport route by months',
      apiUrl: '${ClientsGroup.baseUrl}/tasks/rapport_route_month',
      callType: ApiCallType.GET,
      headers: {
        ...ClientsGroup.headers,
      },
      params: {
        'c_bpartner_id': cBpartnerId,
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class LogCallCall {
  Future<ApiCallResponse> call({
    String? data = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Log Call',
      apiUrl: '${ClientsGroup.baseUrl}/syncs/log_call',
      callType: ApiCallType.POST,
      headers: {
        ...ClientsGroup.headers,
      },
      params: {
        'data': data,
        'token': token,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PaymentsClientAfterTaskCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? cBpartnerId,
    String? createdAt = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'paymentsClientAfterTask',
      apiUrl: '${ClientsGroup.baseUrl}/tasks/payments_client_after_task',
      callType: ApiCallType.GET,
      headers: {
        ...ClientsGroup.headers,
      },
      params: {
        'token': token,
        'c_bpartner_id': cBpartnerId,
        'created_at': createdAt,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PaymentCheckCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? charkTasksId,
    int? payment,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'paymentCheck',
      apiUrl: '${ClientsGroup.baseUrl}/tasks/payment_check',
      callType: ApiCallType.POST,
      headers: {
        ...ClientsGroup.headers,
      },
      params: {
        'token': token,
        'chark_tasks_id': charkTasksId,
        'payment': payment,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListTasksNoPayCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? cBpartnerId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ListTasksNoPay',
      apiUrl: '${ClientsGroup.baseUrl}/tasks/list_tasks_no_pay',
      callType: ApiCallType.GET,
      headers: {
        ...ClientsGroup.headers,
      },
      params: {
        'token': token,
        'c_bpartner_id': cBpartnerId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Clients Group Code

/// Start Order Mission Group Code

class OrderMissionGroup {
  static String baseUrl = 'https://mekaapp.com/bcd/backend/api';
  static Map<String, String> headers = {};
  static ListRegionCall listRegionCall = ListRegionCall();
  static AddOrdreMissionCall addOrdreMissionCall = AddOrdreMissionCall();
  static OrdreMissionsCall ordreMissionsCall = OrdreMissionsCall();
  static ClientsHoreEchoOrdreMissionCall clientsHoreEchoOrdreMissionCall =
      ClientsHoreEchoOrdreMissionCall();
  static AddPaymentCall addPaymentCall = AddPaymentCall();
}

class ListRegionCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'List Region',
      apiUrl: '${OrderMissionGroup.baseUrl}/payments/regions',
      callType: ApiCallType.GET,
      headers: {
        ...OrderMissionGroup.headers,
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class AddOrdreMissionCall {
  Future<ApiCallResponse> call({
    int? cBpartnerId,
    int? cSalesregionId,
    String? destination = '',
    int? ddVehicleId,
    String? dateStart = '',
    String? dateEnd = '',
    String? barecode = '',
    String? token = '',
    int? withCBpartnerId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'addOrdreMission',
      apiUrl: '${OrderMissionGroup.baseUrl}/payments/add_ordre_mission',
      callType: ApiCallType.POST,
      headers: {
        ...OrderMissionGroup.headers,
      },
      params: {
        'c_bpartner_id': cBpartnerId,
        'c_salesregion_id': cSalesregionId,
        'destination': destination,
        'dd_vehicle_id': ddVehicleId,
        'date_start': dateStart,
        'date_end': dateEnd,
        'barecode': barecode,
        'token': token,
        'with_c_bpartner_id': withCBpartnerId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class OrdreMissionsCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? searchKey = '',
    int? sizePage,
    int? page,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Ordre Missions',
      apiUrl: '${OrderMissionGroup.baseUrl}/payments/ordre_missions',
      callType: ApiCallType.GET,
      headers: {
        ...OrderMissionGroup.headers,
      },
      params: {
        'token': token,
        'search_key': searchKey,
        'sizePage': sizePage,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class ClientsHoreEchoOrdreMissionCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? cSalesregionId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Clients Hore Echo Ordre Mission',
      apiUrl: '${OrderMissionGroup.baseUrl}/payments/clients_ordre_mission',
      callType: ApiCallType.GET,
      headers: {
        ...OrderMissionGroup.headers,
      },
      params: {
        'token': token,
        'c_salesregion_id': cSalesregionId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class AddPaymentCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? barecode = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Add Payment',
      apiUrl: '${OrderMissionGroup.baseUrl}/payments/add_payment',
      callType: ApiCallType.GET,
      headers: {
        ...OrderMissionGroup.headers,
      },
      params: {
        'token': token,
        'barecode': barecode,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Order Mission Group Code

/// Start Auth Group Code

class AuthGroup {
  static String baseUrl = 'https://mekaapp.com/bcd/backend/api';
  static Map<String, String> headers = {};
  static LoginCall loginCall = LoginCall();
  static MeCall meCall = MeCall();
  static UsersCall usersCall = UsersCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '${AuthGroup.baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {
        ...AuthGroup.headers,
      },
      params: {
        'email': email,
        'password': password,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class MeCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'me',
      apiUrl: '${AuthGroup.baseUrl}/me',
      callType: ApiCallType.GET,
      headers: {
        ...AuthGroup.headers,
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UsersCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Users',
      apiUrl: '${AuthGroup.baseUrl}/users',
      callType: ApiCallType.GET,
      headers: {
        ...AuthGroup.headers,
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Auth Group Code

/// Start Payments Group Code

class PaymentsGroup {
  static String baseUrl = 'https://mekaapp.com/bcd/backend/api';
  static Map<String, String> headers = {};
  static PaymentBookLinesByIdCall paymentBookLinesByIdCall =
      PaymentBookLinesByIdCall();
  static PaymentBooksCall paymentBooksCall = PaymentBooksCall();
  static ListLivreursCall listLivreursCall = ListLivreursCall();
  static ListVehiclesCall listVehiclesCall = ListVehiclesCall();
  static ListClientsCall listClientsCall = ListClientsCall();
  static UpdateBookLineLivreurCall updateBookLineLivreurCall =
      UpdateBookLineLivreurCall();
}

class PaymentBookLinesByIdCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? xxPaymentbookId = '',
    int? documentno,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'paymentBookLinesById',
      apiUrl: '${PaymentsGroup.baseUrl}/payments/payment_book_lines',
      callType: ApiCallType.GET,
      headers: {
        ...PaymentsGroup.headers,
      },
      params: {
        'token': token,
        'xx_paymentbook_id': xxPaymentbookId,
        'documentno': documentno,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PaymentBooksCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? pageSize,
    int? page,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'paymentBooks',
      apiUrl: '${PaymentsGroup.baseUrl}/payments/payment_books',
      callType: ApiCallType.GET,
      headers: {
        ...PaymentsGroup.headers,
      },
      params: {
        'token': token,
        'pageSize': pageSize,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class ListLivreursCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ListLivreurs',
      apiUrl: '${PaymentsGroup.baseUrl}/payments/list_livreurs',
      callType: ApiCallType.GET,
      headers: {
        ...PaymentsGroup.headers,
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic names(dynamic response) => getJsonField(
        response,
        r'''$..name''',
        true,
      );
}

class ListVehiclesCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ListVehicles',
      apiUrl: '${PaymentsGroup.baseUrl}/payments/list_vehicles',
      callType: ApiCallType.GET,
      headers: {
        ...PaymentsGroup.headers,
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic names(dynamic response) => getJsonField(
        response,
        r'''$..name''',
        true,
      );
}

class ListClientsCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ListClients',
      apiUrl: '${PaymentsGroup.baseUrl}/payments/list_clients',
      callType: ApiCallType.GET,
      headers: {
        ...PaymentsGroup.headers,
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic names(dynamic response) => getJsonField(
        response,
        r'''$..name''',
        true,
      );
}

class UpdateBookLineLivreurCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? xxPaymentbooklineId,
    int? cBpartnerId,
    double? payamt,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'updateBookLineLivreur',
      apiUrl: '${PaymentsGroup.baseUrl}/payments/update_book_line_livreur',
      callType: ApiCallType.POST,
      headers: {
        ...PaymentsGroup.headers,
      },
      params: {
        'token': token,
        'xx_paymentbookline_id': xxPaymentbooklineId,
        'c_bpartner_id': cBpartnerId,
        'payamt': payamt,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Payments Group Code

/// Start Invoices Group Code

class InvoicesGroup {
  static String baseUrl = 'https://mekaapp.com/bcd/backend/api/invoices';
  static Map<String, String> headers = {};
  static ListInvoicesNoArchivedCall listInvoicesNoArchivedCall =
      ListInvoicesNoArchivedCall();
  static ListInvoicesNoArchivedMonthsCall listInvoicesNoArchivedMonthsCall =
      ListInvoicesNoArchivedMonthsCall();
  static UpdateArchivedInvoiceCall updateArchivedInvoiceCall =
      UpdateArchivedInvoiceCall();
}

class ListInvoicesNoArchivedCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? page,
    int? sizePage,
    String? month = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'listInvoicesNoArchived',
      apiUrl: '${InvoicesGroup.baseUrl}/list_invoices_no_archived',
      callType: ApiCallType.GET,
      headers: {
        ...InvoicesGroup.headers,
      },
      params: {
        'token': token,
        'page': page,
        'sizePage': sizePage,
        'month': month,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$..data''',
        true,
      );
}

class ListInvoicesNoArchivedMonthsCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'listInvoicesNoArchivedMonths',
      apiUrl: '${InvoicesGroup.baseUrl}/list_invoices_no_archived_months',
      callType: ApiCallType.GET,
      headers: {
        ...InvoicesGroup.headers,
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$..data''',
        true,
      );
}

class UpdateArchivedInvoiceCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? documentno = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'updateArchivedInvoice',
      apiUrl: '${InvoicesGroup.baseUrl}/update_archived_invoice',
      callType: ApiCallType.POST,
      headers: {
        ...InvoicesGroup.headers,
      },
      params: {
        'token': token,
        'documentno': documentno,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Invoices Group Code

/// Start MekaAi Group Code

class MekaAiGroup {
  static String baseUrl = 'https://mekaapp.com/bcd/backend/api';
  static Map<String, String> headers = {};
  static ChatUsersCall chatUsersCall = ChatUsersCall();
  static AddMessageCall addMessageCall = AddMessageCall();
  static AddChatCall addChatCall = AddChatCall();
  static ChatMessagesSyncCall chatMessagesSyncCall = ChatMessagesSyncCall();
  static ChatMessagesCall chatMessagesCall = ChatMessagesCall();
  static ChatsCall chatsCall = ChatsCall();
  static MekaAiCodesCall mekaAiCodesCall = MekaAiCodesCall();
}

class ChatUsersCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? pageSize,
    int? page,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Chat Users',
      apiUrl: '${MekaAiGroup.baseUrl}/mekaai/chat_users',
      callType: ApiCallType.GET,
      headers: {
        ...MekaAiGroup.headers,
      },
      params: {
        'token': token,
        'pageSize': pageSize,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic cbpgroupid(dynamic response) => getJsonField(
        response,
        r'''$.data[:].c_bp_group_id''',
        true,
      );
  dynamic namegroup(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name_group''',
        true,
      );
  dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.data[:].email''',
        true,
      );
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      );
}

class AddMessageCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? chat,
    String? text = '',
    int? type,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Add Message',
      apiUrl: '${MekaAiGroup.baseUrl}/mekaai/add_message',
      callType: ApiCallType.POST,
      headers: {
        ...MekaAiGroup.headers,
      },
      params: {
        'token': token,
        'chat': chat,
        'text': text,
        'type': type,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddChatCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? userB,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Add Chat',
      apiUrl: '${MekaAiGroup.baseUrl}/mekaai/add_chat',
      callType: ApiCallType.POST,
      headers: {
        ...MekaAiGroup.headers,
      },
      params: {
        'token': token,
        'user_b': userB,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChatMessagesSyncCall {
  Future<ApiCallResponse> call({
    int? chat,
    String? token = '',
    int? lastId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Chat Messages Sync',
      apiUrl: '${MekaAiGroup.baseUrl}/mekaai/chat_messages_sync',
      callType: ApiCallType.POST,
      headers: {
        ...MekaAiGroup.headers,
      },
      params: {
        'chat': chat,
        'token': token,
        'lastId': lastId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class ChatMessagesCall {
  Future<ApiCallResponse> call({
    int? chat,
    String? token = '',
    int? pageSize,
    int? page,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Chat Messages',
      apiUrl: '${MekaAiGroup.baseUrl}/mekaai/chat_messages',
      callType: ApiCallType.POST,
      headers: {
        ...MekaAiGroup.headers,
      },
      params: {
        'chat': chat,
        'token': token,
        'pageSize': pageSize,
        'page': page,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class ChatsCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? pageSize,
    int? page,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Chats',
      apiUrl: '${MekaAiGroup.baseUrl}/mekaai/chats',
      callType: ApiCallType.POST,
      headers: {
        ...MekaAiGroup.headers,
      },
      params: {
        'token': token,
        'pageSize': pageSize,
        'page': page,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class MekaAiCodesCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? code = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'MekaAi Codes',
      apiUrl: '${MekaAiGroup.baseUrl}/mekaai/codes',
      callType: ApiCallType.GET,
      headers: {
        ...MekaAiGroup.headers,
      },
      params: {
        'token': token,
        'code': code,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End MekaAi Group Code

class ProductsQuotasCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'products quotas',
      apiUrl: 'https://mekaapp.com/bcd/backend/api/products_quotas',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PercOpCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'perc op',
      apiUrl: 'https://mekaapp.com/bcd/backend/api/statis/obj_day_char_op',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PercChiffreCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'perc chiffre',
      apiUrl: 'https://mekaapp.com/bcd/backend/api/obj_day_char',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DateProchesThisWeekCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'dateProchesThisWeek',
      apiUrl:
          'https://www.mekaapp.com/bcd/backend/api/products/date_proches_this_week',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class AddScoreDateProcheCall {
  static Future<ApiCallResponse> call({
    double? total,
    int? targetId,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'addScoreDateProche',
      apiUrl:
          'https://www.mekaapp.com/bcd/backend/api/products/add_score_date_proche',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'total': total,
        'target_id': targetId,
        'token': token,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class StatusScoreDateProcheCall {
  static Future<ApiCallResponse> call({
    int? targetId,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'statusScoreDateProche',
      apiUrl:
          'https://www.mekaapp.com/bcd/backend/api/products/status_score_date_proche',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'target_id': targetId,
        'token': token,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic count(dynamic response) => getJsonField(
        response,
        r'''$.count''',
      );
}

class ObjectsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'OBJECTS',
      apiUrl:
          'https://gsh27.net/id30/api/api.php?api=user&ver=1.0&key=11FFAC0DF1A3FDDA888AE0160E923D9A&cmd=USER_GET_OBJECTS',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RealisationOpTodayCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'realisation op today',
      apiUrl: 'https://www.mekaapp.com/bcd/backend/api/statis/obj_day_by_op',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RealisationOpMonthCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'realisation op month',
      apiUrl: 'https://www.mekaapp.com/bcd/backend/api/statis/obj_month_by_op',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RealisationLabosOpTodayCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'realisation labos op today',
      apiUrl:
          'https://www.mekaapp.com/bcd/backend/api/statis/obj_day_labo_by_op',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RealisationLabosOpMonthCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'realisation labos op month',
      apiUrl:
          'https://www.mekaapp.com/bcd/backend/api/statis/obj_month_labo_by_op',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAllProductsActivePharmaCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllProductsActivePharma',
      apiUrl:
          'https://www.mekaapp.com/bcd/backend/api/products/getAllProductsActive',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic listName(dynamic response) => getJsonField(
        response,
        r'''$..name''',
      );
}

class GetSearchProductsActivePharmaCall {
  static Future<ApiCallResponse> call({
    String? search = '',
    String? labo = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getSearchProductsActivePharma',
      apiUrl:
          'https://www.mekaapp.com/bcd/backend/api/products/getSearchProductsActive',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'search': search,
        'labo': labo,
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic listName(dynamic response) => getJsonField(
        response,
        r'''$..name''',
      );
}

class GetAllLabosActiveCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllLabosActive',
      apiUrl:
          'https://www.mekaapp.com/bcd/backend/api/products/getAllLabosActive',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic listNames(dynamic response) => getJsonField(
        response,
        r'''$..name''',
      );
}

class TaskAddListCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? products = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'task add list',
      apiUrl: 'https://www.mekaapp.com/bcd/backend/api/sell/add_list',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'name': name,
        'products': products,
        'token': token,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TaskGetListsCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'task get lists',
      apiUrl: 'https://www.mekaapp.com/bcd/backend/api/sell/search_name_lists',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic names(dynamic response) => getJsonField(
        response,
        r'''$..name''',
      );
}

class TasksCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'tasks',
      apiUrl: 'https://www.mekaapp.com/bcd/backend/api/tasks/list',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic listNames(dynamic response) => getJsonField(
        response,
        r'''$..name''',
      );
}

class TaskOrdersPackByUserCall {
  static Future<ApiCallResponse> call({
    int? packId,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'task orders pack by user',
      apiUrl:
          'https://www.mekaapp.com/bcd/backend/api/tasks/orders_task_pack_by_user',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'packId': packId,
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TaskCheckOrderPackCall {
  static Future<ApiCallResponse> call({
    String? orderId = '',
    String? packId = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'task check order pack',
      apiUrl: 'https://www.mekaapp.com/bcd/backend/api/tasks/check_order_pack',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'orderId': orderId,
        'packId': packId,
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TaskGetChiffreQuotaCall {
  static Future<ApiCallResponse> call({
    int? taskId,
    bool? perc,
    String? orderId = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'task get chiffre quota',
      apiUrl: 'https://www.mekaapp.com/bcd/backend/api/tasks/get_chiffre_quota',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'taskId': taskId,
        'perc': perc,
        'orderId': orderId,
        'token': token,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TaskGetProdsQuotaCall {
  static Future<ApiCallResponse> call({
    String? packId = '',
    String? orderId = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'task get prods quota ',
      apiUrl: 'https://www.mekaapp.com/bcd/backend/api/tasks/get_prods_quota',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'packId': packId,
        'orderId': orderId,
        'token': token,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TaskAddCall {
  static Future<ApiCallResponse> call({
    int? type,
    String? title = '',
    String? description = '',
    String? dateStart = '',
    String? dateEnd = '',
    int? listId,
    int? prodsOblg = 0,
    double? obj1 = 0,
    double? percReal1 = 0,
    double? giftMoney1 = 0,
    double? percGiftMoney1 = 0,
    double? giftChiffre1 = 0,
    double? percGiftChiffre1 = 0,
    int? giftProds1 = 0,
    String? listProdOblgs = '',
    String? listProdGifts = '',
    int? status = 0,
    int? forUser,
    int? repeat,
    String? daysWeek = '',
    int? dayMonth,
    String? dayYear = '',
    int? numPack,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'task add',
      apiUrl: 'https://www.mekaapp.com/bcd/backend/api/sell/add_task',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'type': type,
        'title': title,
        'description': description,
        'date_start': dateStart,
        'date_end': dateEnd,
        'list_id': listId,
        'prods_oblg': prodsOblg,
        'obj1': obj1,
        'perc_real1': percReal1,
        'gift_money1': giftMoney1,
        'perc_gift_money1': percGiftMoney1,
        'gift_chiffre1': giftChiffre1,
        'perc_gift_chiffre1': percGiftChiffre1,
        'gift_prods1': giftProds1,
        'list_prod_oblgs': listProdOblgs,
        'list_prod_gifts': listProdGifts,
        'status': status,
        'for_user': forUser,
        'repeat': repeat,
        'days_week': daysWeek,
        'day_month': dayMonth,
        'day_year': dayYear,
        'num_pack': numPack,
        'token': token,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TaskReservedPackCall {
  static Future<ApiCallResponse> call({
    String? taskId = '',
    int? countReserve,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'task reserved pack',
      apiUrl:
          'https://www.mekaapp.com/bcd/backend/api/tasks/reserve_pack?packId=61',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'taskId': taskId,
        'countReserve': countReserve,
        'token': token,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
