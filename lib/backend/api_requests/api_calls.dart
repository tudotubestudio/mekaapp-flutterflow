import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class LoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: 'https://mekaapp.com/bcd/backend/api/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'email': email,
        'password': password,
      },
      bodyType: BodyType.NONE,
      returnBody: true,
    );
  }
}

class ProductsQuotasCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'products quotas',
      apiUrl: 'https://mekaapp.com/bcd/backend/api/products_quotas',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
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
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21la2FhcHAuY29tL2JjZC9iYWNrZW5kL2FwaS9sb2dpbiIsImlhdCI6MTY1NTY0NjMzMywiZXhwIjoxNjU4MjM4MzMzLCJuYmYiOjE2NTU2NDYzMzMsImp0aSI6ImZVejdONEpxY0VZZ2xzbjkiLCJzdWIiOjExMTE1ODcsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.a9ru1ktWwalfTSdSOUog7BoilusitXYxs84vWUm3Nqg',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class MeCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'me',
      apiUrl: 'https://www.mekaapp.com/bcd/backend/api/me',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21la2FhcHAuY29tL2JjZC9iYWNrZW5kL2FwaS9sb2dpbiIsImlhdCI6MTY1ODM2NTA3MywiZXhwIjoxNjYwOTU3MDczLCJuYmYiOjE2NTgzNjUwNzMsImp0aSI6ImZVMk5GTGZKTWFRcFdWV2kiLCJzdWIiOjEwODk4NzAsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.gP-Gyw2_H7rLNfFc0KXLuJVoqL_4ndhcDc0i2P0jl0o',
      },
      params: {},
      returnBody: true,
    );
  }
}

class AddScoreDateProcheCall {
  static Future<ApiCallResponse> call({
    double? total,
    int? targetId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'addScoreDateProche',
      apiUrl:
          'https://www.mekaapp.com/bcd/backend/api/products/add_score_date_proche',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21la2FhcHAuY29tL2JjZC9iYWNrZW5kL2FwaS9sb2dpbiIsImlhdCI6MTY1NTY0NjMzMywiZXhwIjoxNjU4MjM4MzMzLCJuYmYiOjE2NTU2NDYzMzMsImp0aSI6ImZVejdONEpxY0VZZ2xzbjkiLCJzdWIiOjExMTE1ODcsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.a9ru1ktWwalfTSdSOUog7BoilusitXYxs84vWUm3Nqg',
      },
      params: {
        'total': total,
        'target_id': targetId,
      },
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class StatusScoreDateProcheCall {
  static Future<ApiCallResponse> call({
    int? targetId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'statusScoreDateProche',
      apiUrl:
          'https://www.mekaapp.com/bcd/backend/api/products/status_score_date_proche',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21la2FhcHAuY29tL2JjZC9iYWNrZW5kL2FwaS9sb2dpbiIsImlhdCI6MTY1NTY0NjMzMywiZXhwIjoxNjU4MjM4MzMzLCJuYmYiOjE2NTU2NDYzMzMsImp0aSI6ImZVejdONEpxY0VZZ2xzbjkiLCJzdWIiOjExMTE1ODcsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.a9ru1ktWwalfTSdSOUog7BoilusitXYxs84vWUm3Nqg',
      },
      params: {
        'target_id': targetId,
      },
      bodyType: BodyType.NONE,
      returnBody: true,
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
          'http://164.68.108.117/api/api.php?api=user&ver=1.0&key=11FFAC0DF1A3FDDA888AE0160E923D9A&cmd=USER_GET_OBJECTS',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class RealisationOpTodayCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'realisation op today',
      apiUrl: 'https://www.mekaapp.com/bcd/backend/api/statis/obj_day_by_op',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21la2FhcHAuY29tL2JjZC9iYWNrZW5kL2FwaS9sb2dpbiIsImlhdCI6MTY1NjM1NDQzNSwiZXhwIjoxNjU4OTQ2NDM1LCJuYmYiOjE2NTYzNTQ0MzUsImp0aSI6IkpnTHlKMkxBaDZEM28zdnciLCJzdWIiOjEwODk4NzAsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.VIeB6OtuI-q59lvNntU7dMHtNBYM5lba31fJIbv868o',
      },
      params: {},
      returnBody: true,
    );
  }
}

class RealisationOpMonthCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'realisation op month',
      apiUrl: 'https://www.mekaapp.com/bcd/backend/api/statis/obj_month_by_op',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21la2FhcHAuY29tL2JjZC9iYWNrZW5kL2FwaS9sb2dpbiIsImlhdCI6MTY1NjM1NDQzNSwiZXhwIjoxNjU4OTQ2NDM1LCJuYmYiOjE2NTYzNTQ0MzUsImp0aSI6IkpnTHlKMkxBaDZEM28zdnciLCJzdWIiOjEwODk4NzAsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.VIeB6OtuI-q59lvNntU7dMHtNBYM5lba31fJIbv868o',
      },
      params: {},
      returnBody: true,
    );
  }
}

class RealisationLabosOpTodayCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'realisation labos op today',
      apiUrl:
          'https://www.mekaapp.com/bcd/backend/api/statis/obj_day_labo_by_op',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21la2FhcHAuY29tL2JjZC9iYWNrZW5kL2FwaS9sb2dpbiIsImlhdCI6MTY1NjM1NDQzNSwiZXhwIjoxNjU4OTQ2NDM1LCJuYmYiOjE2NTYzNTQ0MzUsImp0aSI6IkpnTHlKMkxBaDZEM28zdnciLCJzdWIiOjEwODk4NzAsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.VIeB6OtuI-q59lvNntU7dMHtNBYM5lba31fJIbv868o',
      },
      params: {},
      returnBody: true,
    );
  }
}

class RealisationLabosOpMonthCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'realisation labos op month',
      apiUrl:
          'https://www.mekaapp.com/bcd/backend/api/statis/obj_month_labo_by_op',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21la2FhcHAuY29tL2JjZC9iYWNrZW5kL2FwaS9sb2dpbiIsImlhdCI6MTY1NjM1NDQzNSwiZXhwIjoxNjU4OTQ2NDM1LCJuYmYiOjE2NTYzNTQ0MzUsImp0aSI6IkpnTHlKMkxBaDZEM28zdnciLCJzdWIiOjEwODk4NzAsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.VIeB6OtuI-q59lvNntU7dMHtNBYM5lba31fJIbv868o',
      },
      params: {},
      returnBody: true,
    );
  }
}

class GetAllProductsActivePharmaCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllProductsActivePharma',
      apiUrl:
          'https://www.mekaapp.com/bcd/backend/api/products/getAllProductsActive',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21la2FhcHAuY29tL2JjZC9iYWNrZW5kL2FwaS9sb2dpbiIsImlhdCI6MTY1ODM2NTA3MywiZXhwIjoxNjYwOTU3MDczLCJuYmYiOjE2NTgzNjUwNzMsImp0aSI6ImZVMk5GTGZKTWFRcFdWV2kiLCJzdWIiOjEwODk4NzAsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.gP-Gyw2_H7rLNfFc0KXLuJVoqL_4ndhcDc0i2P0jl0o',
      },
      params: {},
      returnBody: true,
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
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getSearchProductsActivePharma',
      apiUrl:
          'https://www.mekaapp.com/bcd/backend/api/products/getSearchProductsActive',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21la2FhcHAuY29tL2JjZC9iYWNrZW5kL2FwaS9sb2dpbiIsImlhdCI6MTY1ODM2NTA3MywiZXhwIjoxNjYwOTU3MDczLCJuYmYiOjE2NTgzNjUwNzMsImp0aSI6ImZVMk5GTGZKTWFRcFdWV2kiLCJzdWIiOjEwODk4NzAsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.gP-Gyw2_H7rLNfFc0KXLuJVoqL_4ndhcDc0i2P0jl0o',
      },
      params: {
        'search': search,
        'labo': labo,
      },
      returnBody: true,
    );
  }

  static dynamic listName(dynamic response) => getJsonField(
        response,
        r'''$..name''',
      );
}

class GetAllLabosActiveCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllLabosActive',
      apiUrl:
          'https://www.mekaapp.com/bcd/backend/api/products/getAllLabosActive',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21la2FhcHAuY29tL2JjZC9iYWNrZW5kL2FwaS9sb2dpbiIsImlhdCI6MTY1ODM2NTA3MywiZXhwIjoxNjYwOTU3MDczLCJuYmYiOjE2NTgzNjUwNzMsImp0aSI6ImZVMk5GTGZKTWFRcFdWV2kiLCJzdWIiOjEwODk4NzAsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.gP-Gyw2_H7rLNfFc0KXLuJVoqL_4ndhcDc0i2P0jl0o',
      },
      params: {},
      returnBody: true,
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
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'task add list',
      apiUrl: 'https://www.mekaapp.com/bcd/backend/api/sell/add_list',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21la2FhcHAuY29tL2JjZC9iYWNrZW5kL2FwaS9sb2dpbiIsImlhdCI6MTY1ODM2NTA3MywiZXhwIjoxNjYwOTU3MDczLCJuYmYiOjE2NTgzNjUwNzMsImp0aSI6ImZVMk5GTGZKTWFRcFdWV2kiLCJzdWIiOjEwODk4NzAsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.gP-Gyw2_H7rLNfFc0KXLuJVoqL_4ndhcDc0i2P0jl0o',
      },
      params: {
        'name': name,
        'products': products,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
    );
  }
}

class TaskGetListsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'task get lists',
      apiUrl: 'https://www.mekaapp.com/bcd/backend/api/sell/search_name_lists',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21la2FhcHAuY29tL2JjZC9iYWNrZW5kL2FwaS9sb2dpbiIsImlhdCI6MTY1ODM2NTA3MywiZXhwIjoxNjYwOTU3MDczLCJuYmYiOjE2NTgzNjUwNzMsImp0aSI6ImZVMk5GTGZKTWFRcFdWV2kiLCJzdWIiOjEwODk4NzAsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.gP-Gyw2_H7rLNfFc0KXLuJVoqL_4ndhcDc0i2P0jl0o',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic names(dynamic response) => getJsonField(
        response,
        r'''$..name''',
      );
}

class TaskAddPackCall {
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
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'task add pack',
      apiUrl: 'https://www.mekaapp.com/bcd/backend/api/sell/add_task',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21la2FhcHAuY29tL2JjZC9iYWNrZW5kL2FwaS9sb2dpbiIsImlhdCI6MTY1ODM2NTA3MywiZXhwIjoxNjYwOTU3MDczLCJuYmYiOjE2NTgzNjUwNzMsImp0aSI6ImZVMk5GTGZKTWFRcFdWV2kiLCJzdWIiOjEwODk4NzAsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.gP-Gyw2_H7rLNfFc0KXLuJVoqL_4ndhcDc0i2P0jl0o',
      },
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
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
    );
  }
}
