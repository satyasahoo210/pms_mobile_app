import '../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$GetProperties {
  Query$GetProperties({
    required this.properties,
    this.$__typename = 'Query',
  });

  factory Query$GetProperties.fromJson(Map<String, dynamic> json) {
    final l$properties = json['properties'];
    final l$$__typename = json['__typename'];
    return Query$GetProperties(
      properties: (l$properties as List<dynamic>)
          .map((e) => Query$GetProperties$properties.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetProperties$properties> properties;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$properties = properties;
    _resultData['properties'] = l$properties.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$properties = properties;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$properties.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetProperties) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$properties = properties;
    final lOther$properties = other.properties;
    if (l$properties.length != lOther$properties.length) {
      return false;
    }
    for (int i = 0; i < l$properties.length; i++) {
      final l$properties$entry = l$properties[i];
      final lOther$properties$entry = lOther$properties[i];
      if (l$properties$entry != lOther$properties$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetProperties on Query$GetProperties {
  CopyWith$Query$GetProperties<Query$GetProperties> get copyWith =>
      CopyWith$Query$GetProperties(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetProperties<TRes> {
  factory CopyWith$Query$GetProperties(
    Query$GetProperties instance,
    TRes Function(Query$GetProperties) then,
  ) = _CopyWithImpl$Query$GetProperties;

  factory CopyWith$Query$GetProperties.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProperties;

  TRes call({
    List<Query$GetProperties$properties>? properties,
    String? $__typename,
  });
  TRes properties(
      Iterable<Query$GetProperties$properties> Function(
              Iterable<
                  CopyWith$Query$GetProperties$properties<
                      Query$GetProperties$properties>>)
          _fn);
}

class _CopyWithImpl$Query$GetProperties<TRes>
    implements CopyWith$Query$GetProperties<TRes> {
  _CopyWithImpl$Query$GetProperties(
    this._instance,
    this._then,
  );

  final Query$GetProperties _instance;

  final TRes Function(Query$GetProperties) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? properties = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProperties(
        properties: properties == _undefined || properties == null
            ? _instance.properties
            : (properties as List<Query$GetProperties$properties>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes properties(
          Iterable<Query$GetProperties$properties> Function(
                  Iterable<
                      CopyWith$Query$GetProperties$properties<
                          Query$GetProperties$properties>>)
              _fn) =>
      call(
          properties: _fn(_instance.properties
              .map((e) => CopyWith$Query$GetProperties$properties(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetProperties<TRes>
    implements CopyWith$Query$GetProperties<TRes> {
  _CopyWithStubImpl$Query$GetProperties(this._res);

  TRes _res;

  call({
    List<Query$GetProperties$properties>? properties,
    String? $__typename,
  }) =>
      _res;

  properties(_fn) => _res;
}

const documentNodeQueryGetProperties = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetProperties'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'properties'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'timezone'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'tenantId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'taxPercentage'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'logoUrl'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'phone'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'email'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'checkInTime'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'checkOutTime'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'settings'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$GetProperties _parserFn$Query$GetProperties(Map<String, dynamic> data) =>
    Query$GetProperties.fromJson(data);
typedef OnQueryComplete$Query$GetProperties = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetProperties?,
);

class Options$Query$GetProperties
    extends graphql.QueryOptions<Query$GetProperties> {
  Options$Query$GetProperties({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetProperties? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetProperties? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$GetProperties(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetProperties,
          parserFn: _parserFn$Query$GetProperties,
        );

  final OnQueryComplete$Query$GetProperties? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetProperties
    extends graphql.WatchQueryOptions<Query$GetProperties> {
  WatchOptions$Query$GetProperties({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetProperties? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetProperties,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetProperties,
        );
}

class FetchMoreOptions$Query$GetProperties extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetProperties(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetProperties,
        );
}

extension ClientExtension$Query$GetProperties on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetProperties>> query$GetProperties(
          [Options$Query$GetProperties? options]) async =>
      await this.query(options ?? Options$Query$GetProperties());

  graphql.ObservableQuery<Query$GetProperties> watchQuery$GetProperties(
          [WatchOptions$Query$GetProperties? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetProperties());

  void writeQuery$GetProperties({
    required Query$GetProperties data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQueryGetProperties)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  Query$GetProperties? readQuery$GetProperties({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetProperties)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetProperties.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetProperties> useQuery$GetProperties(
        [Options$Query$GetProperties? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$GetProperties());
graphql.ObservableQuery<Query$GetProperties> useWatchQuery$GetProperties(
        [WatchOptions$Query$GetProperties? options]) =>
    graphql_flutter
        .useWatchQuery(options ?? WatchOptions$Query$GetProperties());

class Query$GetProperties$Widget
    extends graphql_flutter.Query<Query$GetProperties> {
  Query$GetProperties$Widget({
    widgets.Key? key,
    Options$Query$GetProperties? options,
    required graphql_flutter.QueryBuilder<Query$GetProperties> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetProperties(),
          builder: builder,
        );
}

class Query$GetProperties$properties {
  Query$GetProperties$properties({
    required this.id,
    required this.name,
    required this.address,
    required this.timezone,
    required this.tenantId,
    this.taxPercentage,
    this.logoUrl,
    this.phone,
    this.email,
    this.checkInTime,
    this.checkOutTime,
    this.settings,
    this.$__typename = 'Property',
  });

  factory Query$GetProperties$properties.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$address = json['address'];
    final l$timezone = json['timezone'];
    final l$tenantId = json['tenantId'];
    final l$taxPercentage = json['taxPercentage'];
    final l$logoUrl = json['logoUrl'];
    final l$phone = json['phone'];
    final l$email = json['email'];
    final l$checkInTime = json['checkInTime'];
    final l$checkOutTime = json['checkOutTime'];
    final l$settings = json['settings'];
    final l$$__typename = json['__typename'];
    return Query$GetProperties$properties(
      id: (l$id as String),
      name: (l$name as String),
      address: (l$address as String),
      timezone: (l$timezone as String),
      tenantId: (l$tenantId as String),
      taxPercentage: (l$taxPercentage as num?)?.toDouble(),
      logoUrl: (l$logoUrl as String?),
      phone: (l$phone as String?),
      email: (l$email as String?),
      checkInTime: (l$checkInTime as String?),
      checkOutTime: (l$checkOutTime as String?),
      settings: (l$settings as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String address;

  final String timezone;

  final String tenantId;

  final double? taxPercentage;

  final String? logoUrl;

  final String? phone;

  final String? email;

  final String? checkInTime;

  final String? checkOutTime;

  final String? settings;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$address = address;
    _resultData['address'] = l$address;
    final l$timezone = timezone;
    _resultData['timezone'] = l$timezone;
    final l$tenantId = tenantId;
    _resultData['tenantId'] = l$tenantId;
    final l$taxPercentage = taxPercentage;
    _resultData['taxPercentage'] = l$taxPercentage;
    final l$logoUrl = logoUrl;
    _resultData['logoUrl'] = l$logoUrl;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$checkInTime = checkInTime;
    _resultData['checkInTime'] = l$checkInTime;
    final l$checkOutTime = checkOutTime;
    _resultData['checkOutTime'] = l$checkOutTime;
    final l$settings = settings;
    _resultData['settings'] = l$settings;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$address = address;
    final l$timezone = timezone;
    final l$tenantId = tenantId;
    final l$taxPercentage = taxPercentage;
    final l$logoUrl = logoUrl;
    final l$phone = phone;
    final l$email = email;
    final l$checkInTime = checkInTime;
    final l$checkOutTime = checkOutTime;
    final l$settings = settings;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$address,
      l$timezone,
      l$tenantId,
      l$taxPercentage,
      l$logoUrl,
      l$phone,
      l$email,
      l$checkInTime,
      l$checkOutTime,
      l$settings,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetProperties$properties) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
      return false;
    }
    final l$timezone = timezone;
    final lOther$timezone = other.timezone;
    if (l$timezone != lOther$timezone) {
      return false;
    }
    final l$tenantId = tenantId;
    final lOther$tenantId = other.tenantId;
    if (l$tenantId != lOther$tenantId) {
      return false;
    }
    final l$taxPercentage = taxPercentage;
    final lOther$taxPercentage = other.taxPercentage;
    if (l$taxPercentage != lOther$taxPercentage) {
      return false;
    }
    final l$logoUrl = logoUrl;
    final lOther$logoUrl = other.logoUrl;
    if (l$logoUrl != lOther$logoUrl) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$checkInTime = checkInTime;
    final lOther$checkInTime = other.checkInTime;
    if (l$checkInTime != lOther$checkInTime) {
      return false;
    }
    final l$checkOutTime = checkOutTime;
    final lOther$checkOutTime = other.checkOutTime;
    if (l$checkOutTime != lOther$checkOutTime) {
      return false;
    }
    final l$settings = settings;
    final lOther$settings = other.settings;
    if (l$settings != lOther$settings) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetProperties$properties
    on Query$GetProperties$properties {
  CopyWith$Query$GetProperties$properties<Query$GetProperties$properties>
      get copyWith => CopyWith$Query$GetProperties$properties(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetProperties$properties<TRes> {
  factory CopyWith$Query$GetProperties$properties(
    Query$GetProperties$properties instance,
    TRes Function(Query$GetProperties$properties) then,
  ) = _CopyWithImpl$Query$GetProperties$properties;

  factory CopyWith$Query$GetProperties$properties.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProperties$properties;

  TRes call({
    String? id,
    String? name,
    String? address,
    String? timezone,
    String? tenantId,
    double? taxPercentage,
    String? logoUrl,
    String? phone,
    String? email,
    String? checkInTime,
    String? checkOutTime,
    String? settings,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetProperties$properties<TRes>
    implements CopyWith$Query$GetProperties$properties<TRes> {
  _CopyWithImpl$Query$GetProperties$properties(
    this._instance,
    this._then,
  );

  final Query$GetProperties$properties _instance;

  final TRes Function(Query$GetProperties$properties) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? address = _undefined,
    Object? timezone = _undefined,
    Object? tenantId = _undefined,
    Object? taxPercentage = _undefined,
    Object? logoUrl = _undefined,
    Object? phone = _undefined,
    Object? email = _undefined,
    Object? checkInTime = _undefined,
    Object? checkOutTime = _undefined,
    Object? settings = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProperties$properties(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        address: address == _undefined || address == null
            ? _instance.address
            : (address as String),
        timezone: timezone == _undefined || timezone == null
            ? _instance.timezone
            : (timezone as String),
        tenantId: tenantId == _undefined || tenantId == null
            ? _instance.tenantId
            : (tenantId as String),
        taxPercentage: taxPercentage == _undefined
            ? _instance.taxPercentage
            : (taxPercentage as double?),
        logoUrl:
            logoUrl == _undefined ? _instance.logoUrl : (logoUrl as String?),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        email: email == _undefined ? _instance.email : (email as String?),
        checkInTime: checkInTime == _undefined
            ? _instance.checkInTime
            : (checkInTime as String?),
        checkOutTime: checkOutTime == _undefined
            ? _instance.checkOutTime
            : (checkOutTime as String?),
        settings:
            settings == _undefined ? _instance.settings : (settings as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetProperties$properties<TRes>
    implements CopyWith$Query$GetProperties$properties<TRes> {
  _CopyWithStubImpl$Query$GetProperties$properties(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? address,
    String? timezone,
    String? tenantId,
    double? taxPercentage,
    String? logoUrl,
    String? phone,
    String? email,
    String? checkInTime,
    String? checkOutTime,
    String? settings,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetRooms {
  factory Variables$Query$GetRooms({required String propertyId}) =>
      Variables$Query$GetRooms._({
        r'propertyId': propertyId,
      });

  Variables$Query$GetRooms._(this._$data);

  factory Variables$Query$GetRooms.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$propertyId = data['propertyId'];
    result$data['propertyId'] = (l$propertyId as String);
    return Variables$Query$GetRooms._(result$data);
  }

  Map<String, dynamic> _$data;

  String get propertyId => (_$data['propertyId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$propertyId = propertyId;
    result$data['propertyId'] = l$propertyId;
    return result$data;
  }

  CopyWith$Variables$Query$GetRooms<Variables$Query$GetRooms> get copyWith =>
      CopyWith$Variables$Query$GetRooms(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetRooms) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$propertyId = propertyId;
    final lOther$propertyId = other.propertyId;
    if (l$propertyId != lOther$propertyId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$propertyId = propertyId;
    return Object.hashAll([l$propertyId]);
  }
}

abstract class CopyWith$Variables$Query$GetRooms<TRes> {
  factory CopyWith$Variables$Query$GetRooms(
    Variables$Query$GetRooms instance,
    TRes Function(Variables$Query$GetRooms) then,
  ) = _CopyWithImpl$Variables$Query$GetRooms;

  factory CopyWith$Variables$Query$GetRooms.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetRooms;

  TRes call({String? propertyId});
}

class _CopyWithImpl$Variables$Query$GetRooms<TRes>
    implements CopyWith$Variables$Query$GetRooms<TRes> {
  _CopyWithImpl$Variables$Query$GetRooms(
    this._instance,
    this._then,
  );

  final Variables$Query$GetRooms _instance;

  final TRes Function(Variables$Query$GetRooms) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? propertyId = _undefined}) =>
      _then(Variables$Query$GetRooms._({
        ..._instance._$data,
        if (propertyId != _undefined && propertyId != null)
          'propertyId': (propertyId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetRooms<TRes>
    implements CopyWith$Variables$Query$GetRooms<TRes> {
  _CopyWithStubImpl$Variables$Query$GetRooms(this._res);

  TRes _res;

  call({String? propertyId}) => _res;
}

class Query$GetRooms {
  Query$GetRooms({
    required this.rooms,
    this.$__typename = 'Query',
  });

  factory Query$GetRooms.fromJson(Map<String, dynamic> json) {
    final l$rooms = json['rooms'];
    final l$$__typename = json['__typename'];
    return Query$GetRooms(
      rooms: (l$rooms as List<dynamic>)
          .map(
              (e) => Query$GetRooms$rooms.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetRooms$rooms> rooms;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$rooms = rooms;
    _resultData['rooms'] = l$rooms.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$rooms = rooms;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$rooms.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetRooms) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$rooms = rooms;
    final lOther$rooms = other.rooms;
    if (l$rooms.length != lOther$rooms.length) {
      return false;
    }
    for (int i = 0; i < l$rooms.length; i++) {
      final l$rooms$entry = l$rooms[i];
      final lOther$rooms$entry = lOther$rooms[i];
      if (l$rooms$entry != lOther$rooms$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetRooms on Query$GetRooms {
  CopyWith$Query$GetRooms<Query$GetRooms> get copyWith =>
      CopyWith$Query$GetRooms(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetRooms<TRes> {
  factory CopyWith$Query$GetRooms(
    Query$GetRooms instance,
    TRes Function(Query$GetRooms) then,
  ) = _CopyWithImpl$Query$GetRooms;

  factory CopyWith$Query$GetRooms.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRooms;

  TRes call({
    List<Query$GetRooms$rooms>? rooms,
    String? $__typename,
  });
  TRes rooms(
      Iterable<Query$GetRooms$rooms> Function(
              Iterable<CopyWith$Query$GetRooms$rooms<Query$GetRooms$rooms>>)
          _fn);
}

class _CopyWithImpl$Query$GetRooms<TRes>
    implements CopyWith$Query$GetRooms<TRes> {
  _CopyWithImpl$Query$GetRooms(
    this._instance,
    this._then,
  );

  final Query$GetRooms _instance;

  final TRes Function(Query$GetRooms) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? rooms = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetRooms(
        rooms: rooms == _undefined || rooms == null
            ? _instance.rooms
            : (rooms as List<Query$GetRooms$rooms>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes rooms(
          Iterable<Query$GetRooms$rooms> Function(
                  Iterable<CopyWith$Query$GetRooms$rooms<Query$GetRooms$rooms>>)
              _fn) =>
      call(
          rooms: _fn(_instance.rooms.map((e) => CopyWith$Query$GetRooms$rooms(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetRooms<TRes>
    implements CopyWith$Query$GetRooms<TRes> {
  _CopyWithStubImpl$Query$GetRooms(this._res);

  TRes _res;

  call({
    List<Query$GetRooms$rooms>? rooms,
    String? $__typename,
  }) =>
      _res;

  rooms(_fn) => _res;
}

const documentNodeQueryGetRooms = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetRooms'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'propertyId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'rooms'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'propertyId'),
            value: VariableNode(name: NameNode(value: 'propertyId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'roomNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'housekeepingStatus'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'priorityCleaning'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'RoomType'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'capacity'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'defaultPrice'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$GetRooms _parserFn$Query$GetRooms(Map<String, dynamic> data) =>
    Query$GetRooms.fromJson(data);
typedef OnQueryComplete$Query$GetRooms = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetRooms?,
);

class Options$Query$GetRooms extends graphql.QueryOptions<Query$GetRooms> {
  Options$Query$GetRooms({
    String? operationName,
    required Variables$Query$GetRooms variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetRooms? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetRooms? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$GetRooms(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetRooms,
          parserFn: _parserFn$Query$GetRooms,
        );

  final OnQueryComplete$Query$GetRooms? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetRooms
    extends graphql.WatchQueryOptions<Query$GetRooms> {
  WatchOptions$Query$GetRooms({
    String? operationName,
    required Variables$Query$GetRooms variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetRooms? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetRooms,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetRooms,
        );
}

class FetchMoreOptions$Query$GetRooms extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetRooms({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetRooms variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetRooms,
        );
}

extension ClientExtension$Query$GetRooms on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetRooms>> query$GetRooms(
          Options$Query$GetRooms options) async =>
      await this.query(options);

  graphql.ObservableQuery<Query$GetRooms> watchQuery$GetRooms(
          WatchOptions$Query$GetRooms options) =>
      this.watchQuery(options);

  void writeQuery$GetRooms({
    required Query$GetRooms data,
    required Variables$Query$GetRooms variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetRooms),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );

  Query$GetRooms? readQuery$GetRooms({
    required Variables$Query$GetRooms variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetRooms),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetRooms.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetRooms> useQuery$GetRooms(
        Options$Query$GetRooms options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetRooms> useWatchQuery$GetRooms(
        WatchOptions$Query$GetRooms options) =>
    graphql_flutter.useWatchQuery(options);

class Query$GetRooms$Widget extends graphql_flutter.Query<Query$GetRooms> {
  Query$GetRooms$Widget({
    widgets.Key? key,
    required Options$Query$GetRooms options,
    required graphql_flutter.QueryBuilder<Query$GetRooms> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetRooms$rooms {
  Query$GetRooms$rooms({
    required this.id,
    required this.roomNumber,
    required this.status,
    required this.housekeepingStatus,
    required this.priorityCleaning,
    this.RoomType,
    this.$__typename = 'Room',
  });

  factory Query$GetRooms$rooms.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$roomNumber = json['roomNumber'];
    final l$status = json['status'];
    final l$housekeepingStatus = json['housekeepingStatus'];
    final l$priorityCleaning = json['priorityCleaning'];
    final l$RoomType = json['RoomType'];
    final l$$__typename = json['__typename'];
    return Query$GetRooms$rooms(
      id: (l$id as String),
      roomNumber: (l$roomNumber as String),
      status: fromJson$Enum$RoomStatus((l$status as String)),
      housekeepingStatus:
          fromJson$Enum$HousekeepingStatus((l$housekeepingStatus as String)),
      priorityCleaning: (l$priorityCleaning as bool),
      RoomType: l$RoomType == null
          ? null
          : Query$GetRooms$rooms$RoomType.fromJson(
              (l$RoomType as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String roomNumber;

  final Enum$RoomStatus status;

  final Enum$HousekeepingStatus housekeepingStatus;

  final bool priorityCleaning;

  final Query$GetRooms$rooms$RoomType? RoomType;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$roomNumber = roomNumber;
    _resultData['roomNumber'] = l$roomNumber;
    final l$status = status;
    _resultData['status'] = toJson$Enum$RoomStatus(l$status);
    final l$housekeepingStatus = housekeepingStatus;
    _resultData['housekeepingStatus'] =
        toJson$Enum$HousekeepingStatus(l$housekeepingStatus);
    final l$priorityCleaning = priorityCleaning;
    _resultData['priorityCleaning'] = l$priorityCleaning;
    final l$RoomType = RoomType;
    _resultData['RoomType'] = l$RoomType?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$roomNumber = roomNumber;
    final l$status = status;
    final l$housekeepingStatus = housekeepingStatus;
    final l$priorityCleaning = priorityCleaning;
    final l$RoomType = RoomType;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$roomNumber,
      l$status,
      l$housekeepingStatus,
      l$priorityCleaning,
      l$RoomType,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetRooms$rooms) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$roomNumber = roomNumber;
    final lOther$roomNumber = other.roomNumber;
    if (l$roomNumber != lOther$roomNumber) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$housekeepingStatus = housekeepingStatus;
    final lOther$housekeepingStatus = other.housekeepingStatus;
    if (l$housekeepingStatus != lOther$housekeepingStatus) {
      return false;
    }
    final l$priorityCleaning = priorityCleaning;
    final lOther$priorityCleaning = other.priorityCleaning;
    if (l$priorityCleaning != lOther$priorityCleaning) {
      return false;
    }
    final l$RoomType = RoomType;
    final lOther$RoomType = other.RoomType;
    if (l$RoomType != lOther$RoomType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetRooms$rooms on Query$GetRooms$rooms {
  CopyWith$Query$GetRooms$rooms<Query$GetRooms$rooms> get copyWith =>
      CopyWith$Query$GetRooms$rooms(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetRooms$rooms<TRes> {
  factory CopyWith$Query$GetRooms$rooms(
    Query$GetRooms$rooms instance,
    TRes Function(Query$GetRooms$rooms) then,
  ) = _CopyWithImpl$Query$GetRooms$rooms;

  factory CopyWith$Query$GetRooms$rooms.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRooms$rooms;

  TRes call({
    String? id,
    String? roomNumber,
    Enum$RoomStatus? status,
    Enum$HousekeepingStatus? housekeepingStatus,
    bool? priorityCleaning,
    Query$GetRooms$rooms$RoomType? RoomType,
    String? $__typename,
  });
  CopyWith$Query$GetRooms$rooms$RoomType<TRes> get RoomType;
}

class _CopyWithImpl$Query$GetRooms$rooms<TRes>
    implements CopyWith$Query$GetRooms$rooms<TRes> {
  _CopyWithImpl$Query$GetRooms$rooms(
    this._instance,
    this._then,
  );

  final Query$GetRooms$rooms _instance;

  final TRes Function(Query$GetRooms$rooms) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? roomNumber = _undefined,
    Object? status = _undefined,
    Object? housekeepingStatus = _undefined,
    Object? priorityCleaning = _undefined,
    Object? RoomType = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetRooms$rooms(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        roomNumber: roomNumber == _undefined || roomNumber == null
            ? _instance.roomNumber
            : (roomNumber as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$RoomStatus),
        housekeepingStatus:
            housekeepingStatus == _undefined || housekeepingStatus == null
                ? _instance.housekeepingStatus
                : (housekeepingStatus as Enum$HousekeepingStatus),
        priorityCleaning:
            priorityCleaning == _undefined || priorityCleaning == null
                ? _instance.priorityCleaning
                : (priorityCleaning as bool),
        RoomType: RoomType == _undefined
            ? _instance.RoomType
            : (RoomType as Query$GetRooms$rooms$RoomType?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetRooms$rooms$RoomType<TRes> get RoomType {
    final local$RoomType = _instance.RoomType;
    return local$RoomType == null
        ? CopyWith$Query$GetRooms$rooms$RoomType.stub(_then(_instance))
        : CopyWith$Query$GetRooms$rooms$RoomType(
            local$RoomType, (e) => call(RoomType: e));
  }
}

class _CopyWithStubImpl$Query$GetRooms$rooms<TRes>
    implements CopyWith$Query$GetRooms$rooms<TRes> {
  _CopyWithStubImpl$Query$GetRooms$rooms(this._res);

  TRes _res;

  call({
    String? id,
    String? roomNumber,
    Enum$RoomStatus? status,
    Enum$HousekeepingStatus? housekeepingStatus,
    bool? priorityCleaning,
    Query$GetRooms$rooms$RoomType? RoomType,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetRooms$rooms$RoomType<TRes> get RoomType =>
      CopyWith$Query$GetRooms$rooms$RoomType.stub(_res);
}

class Query$GetRooms$rooms$RoomType {
  Query$GetRooms$rooms$RoomType({
    required this.id,
    required this.name,
    required this.capacity,
    this.defaultPrice,
    this.$__typename = 'RoomType',
  });

  factory Query$GetRooms$rooms$RoomType.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$capacity = json['capacity'];
    final l$defaultPrice = json['defaultPrice'];
    final l$$__typename = json['__typename'];
    return Query$GetRooms$rooms$RoomType(
      id: (l$id as String),
      name: (l$name as String),
      capacity: (l$capacity as int),
      defaultPrice: (l$defaultPrice as num?)?.toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final int capacity;

  final double? defaultPrice;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$capacity = capacity;
    _resultData['capacity'] = l$capacity;
    final l$defaultPrice = defaultPrice;
    _resultData['defaultPrice'] = l$defaultPrice;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$capacity = capacity;
    final l$defaultPrice = defaultPrice;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$capacity,
      l$defaultPrice,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetRooms$rooms$RoomType) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$capacity = capacity;
    final lOther$capacity = other.capacity;
    if (l$capacity != lOther$capacity) {
      return false;
    }
    final l$defaultPrice = defaultPrice;
    final lOther$defaultPrice = other.defaultPrice;
    if (l$defaultPrice != lOther$defaultPrice) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetRooms$rooms$RoomType
    on Query$GetRooms$rooms$RoomType {
  CopyWith$Query$GetRooms$rooms$RoomType<Query$GetRooms$rooms$RoomType>
      get copyWith => CopyWith$Query$GetRooms$rooms$RoomType(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetRooms$rooms$RoomType<TRes> {
  factory CopyWith$Query$GetRooms$rooms$RoomType(
    Query$GetRooms$rooms$RoomType instance,
    TRes Function(Query$GetRooms$rooms$RoomType) then,
  ) = _CopyWithImpl$Query$GetRooms$rooms$RoomType;

  factory CopyWith$Query$GetRooms$rooms$RoomType.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRooms$rooms$RoomType;

  TRes call({
    String? id,
    String? name,
    int? capacity,
    double? defaultPrice,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetRooms$rooms$RoomType<TRes>
    implements CopyWith$Query$GetRooms$rooms$RoomType<TRes> {
  _CopyWithImpl$Query$GetRooms$rooms$RoomType(
    this._instance,
    this._then,
  );

  final Query$GetRooms$rooms$RoomType _instance;

  final TRes Function(Query$GetRooms$rooms$RoomType) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? capacity = _undefined,
    Object? defaultPrice = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetRooms$rooms$RoomType(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        capacity: capacity == _undefined || capacity == null
            ? _instance.capacity
            : (capacity as int),
        defaultPrice: defaultPrice == _undefined
            ? _instance.defaultPrice
            : (defaultPrice as double?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetRooms$rooms$RoomType<TRes>
    implements CopyWith$Query$GetRooms$rooms$RoomType<TRes> {
  _CopyWithStubImpl$Query$GetRooms$rooms$RoomType(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    int? capacity,
    double? defaultPrice,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetBookings {
  factory Variables$Query$GetBookings({
    String? propertyId,
    String? guestId,
  }) =>
      Variables$Query$GetBookings._({
        if (propertyId != null) r'propertyId': propertyId,
        if (guestId != null) r'guestId': guestId,
      });

  Variables$Query$GetBookings._(this._$data);

  factory Variables$Query$GetBookings.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('propertyId')) {
      final l$propertyId = data['propertyId'];
      result$data['propertyId'] = (l$propertyId as String?);
    }
    if (data.containsKey('guestId')) {
      final l$guestId = data['guestId'];
      result$data['guestId'] = (l$guestId as String?);
    }
    return Variables$Query$GetBookings._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get propertyId => (_$data['propertyId'] as String?);

  String? get guestId => (_$data['guestId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('propertyId')) {
      final l$propertyId = propertyId;
      result$data['propertyId'] = l$propertyId;
    }
    if (_$data.containsKey('guestId')) {
      final l$guestId = guestId;
      result$data['guestId'] = l$guestId;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetBookings<Variables$Query$GetBookings>
      get copyWith => CopyWith$Variables$Query$GetBookings(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetBookings) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$propertyId = propertyId;
    final lOther$propertyId = other.propertyId;
    if (_$data.containsKey('propertyId') !=
        other._$data.containsKey('propertyId')) {
      return false;
    }
    if (l$propertyId != lOther$propertyId) {
      return false;
    }
    final l$guestId = guestId;
    final lOther$guestId = other.guestId;
    if (_$data.containsKey('guestId') != other._$data.containsKey('guestId')) {
      return false;
    }
    if (l$guestId != lOther$guestId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$propertyId = propertyId;
    final l$guestId = guestId;
    return Object.hashAll([
      _$data.containsKey('propertyId') ? l$propertyId : const {},
      _$data.containsKey('guestId') ? l$guestId : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetBookings<TRes> {
  factory CopyWith$Variables$Query$GetBookings(
    Variables$Query$GetBookings instance,
    TRes Function(Variables$Query$GetBookings) then,
  ) = _CopyWithImpl$Variables$Query$GetBookings;

  factory CopyWith$Variables$Query$GetBookings.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetBookings;

  TRes call({
    String? propertyId,
    String? guestId,
  });
}

class _CopyWithImpl$Variables$Query$GetBookings<TRes>
    implements CopyWith$Variables$Query$GetBookings<TRes> {
  _CopyWithImpl$Variables$Query$GetBookings(
    this._instance,
    this._then,
  );

  final Variables$Query$GetBookings _instance;

  final TRes Function(Variables$Query$GetBookings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? propertyId = _undefined,
    Object? guestId = _undefined,
  }) =>
      _then(Variables$Query$GetBookings._({
        ..._instance._$data,
        if (propertyId != _undefined) 'propertyId': (propertyId as String?),
        if (guestId != _undefined) 'guestId': (guestId as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetBookings<TRes>
    implements CopyWith$Variables$Query$GetBookings<TRes> {
  _CopyWithStubImpl$Variables$Query$GetBookings(this._res);

  TRes _res;

  call({
    String? propertyId,
    String? guestId,
  }) =>
      _res;
}

class Query$GetBookings {
  Query$GetBookings({
    required this.bookings,
    this.$__typename = 'Query',
  });

  factory Query$GetBookings.fromJson(Map<String, dynamic> json) {
    final l$bookings = json['bookings'];
    final l$$__typename = json['__typename'];
    return Query$GetBookings(
      bookings: (l$bookings as List<dynamic>)
          .map((e) =>
              Query$GetBookings$bookings.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetBookings$bookings> bookings;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$bookings = bookings;
    _resultData['bookings'] = l$bookings.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$bookings = bookings;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$bookings.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetBookings) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$bookings = bookings;
    final lOther$bookings = other.bookings;
    if (l$bookings.length != lOther$bookings.length) {
      return false;
    }
    for (int i = 0; i < l$bookings.length; i++) {
      final l$bookings$entry = l$bookings[i];
      final lOther$bookings$entry = lOther$bookings[i];
      if (l$bookings$entry != lOther$bookings$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetBookings on Query$GetBookings {
  CopyWith$Query$GetBookings<Query$GetBookings> get copyWith =>
      CopyWith$Query$GetBookings(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetBookings<TRes> {
  factory CopyWith$Query$GetBookings(
    Query$GetBookings instance,
    TRes Function(Query$GetBookings) then,
  ) = _CopyWithImpl$Query$GetBookings;

  factory CopyWith$Query$GetBookings.stub(TRes res) =
      _CopyWithStubImpl$Query$GetBookings;

  TRes call({
    List<Query$GetBookings$bookings>? bookings,
    String? $__typename,
  });
  TRes bookings(
      Iterable<Query$GetBookings$bookings> Function(
              Iterable<
                  CopyWith$Query$GetBookings$bookings<
                      Query$GetBookings$bookings>>)
          _fn);
}

class _CopyWithImpl$Query$GetBookings<TRes>
    implements CopyWith$Query$GetBookings<TRes> {
  _CopyWithImpl$Query$GetBookings(
    this._instance,
    this._then,
  );

  final Query$GetBookings _instance;

  final TRes Function(Query$GetBookings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? bookings = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetBookings(
        bookings: bookings == _undefined || bookings == null
            ? _instance.bookings
            : (bookings as List<Query$GetBookings$bookings>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes bookings(
          Iterable<Query$GetBookings$bookings> Function(
                  Iterable<
                      CopyWith$Query$GetBookings$bookings<
                          Query$GetBookings$bookings>>)
              _fn) =>
      call(
          bookings: _fn(
              _instance.bookings.map((e) => CopyWith$Query$GetBookings$bookings(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetBookings<TRes>
    implements CopyWith$Query$GetBookings<TRes> {
  _CopyWithStubImpl$Query$GetBookings(this._res);

  TRes _res;

  call({
    List<Query$GetBookings$bookings>? bookings,
    String? $__typename,
  }) =>
      _res;

  bookings(_fn) => _res;
}

const documentNodeQueryGetBookings = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetBookings'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'propertyId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'guestId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'bookings'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'propertyId'),
            value: VariableNode(name: NameNode(value: 'propertyId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'guestId'),
            value: VariableNode(name: NameNode(value: 'guestId')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'guestId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'propertyId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'checkInDate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'checkOutDate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'adults'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'children'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'discountAmount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'discountType'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'totalAmount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'notes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'waiveLastDayCharge'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'Guest'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'phone'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'email'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'gstin'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'Payment'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'amount'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'method'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'status'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'createdAt'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'BookingRoom'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'roomId'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'roomTypeId'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'status'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'checkInDate'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'checkOutDate'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'priceOverride'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'Room'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'roomNumber'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'RoomType'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'defaultPrice'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'BookingService'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'bookingId'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'serviceId'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'quantity'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'totalPrice'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'Service'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'price'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$GetBookings _parserFn$Query$GetBookings(Map<String, dynamic> data) =>
    Query$GetBookings.fromJson(data);
typedef OnQueryComplete$Query$GetBookings = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetBookings?,
);

class Options$Query$GetBookings
    extends graphql.QueryOptions<Query$GetBookings> {
  Options$Query$GetBookings({
    String? operationName,
    Variables$Query$GetBookings? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetBookings? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetBookings? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$GetBookings(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetBookings,
          parserFn: _parserFn$Query$GetBookings,
        );

  final OnQueryComplete$Query$GetBookings? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetBookings
    extends graphql.WatchQueryOptions<Query$GetBookings> {
  WatchOptions$Query$GetBookings({
    String? operationName,
    Variables$Query$GetBookings? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetBookings? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetBookings,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetBookings,
        );
}

class FetchMoreOptions$Query$GetBookings extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetBookings({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$GetBookings? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryGetBookings,
        );
}

extension ClientExtension$Query$GetBookings on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetBookings>> query$GetBookings(
          [Options$Query$GetBookings? options]) async =>
      await this.query(options ?? Options$Query$GetBookings());

  graphql.ObservableQuery<Query$GetBookings> watchQuery$GetBookings(
          [WatchOptions$Query$GetBookings? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetBookings());

  void writeQuery$GetBookings({
    required Query$GetBookings data,
    Variables$Query$GetBookings? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetBookings),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );

  Query$GetBookings? readQuery$GetBookings({
    Variables$Query$GetBookings? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetBookings),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetBookings.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetBookings> useQuery$GetBookings(
        [Options$Query$GetBookings? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$GetBookings());
graphql.ObservableQuery<Query$GetBookings> useWatchQuery$GetBookings(
        [WatchOptions$Query$GetBookings? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$GetBookings());

class Query$GetBookings$Widget
    extends graphql_flutter.Query<Query$GetBookings> {
  Query$GetBookings$Widget({
    widgets.Key? key,
    Options$Query$GetBookings? options,
    required graphql_flutter.QueryBuilder<Query$GetBookings> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetBookings(),
          builder: builder,
        );
}

class Query$GetBookings$bookings {
  Query$GetBookings$bookings({
    required this.id,
    required this.guestId,
    required this.propertyId,
    this.status,
    required this.checkInDate,
    required this.checkOutDate,
    this.adults,
    this.children,
    this.discountAmount,
    this.discountType,
    this.totalAmount,
    this.notes,
    this.waiveLastDayCharge,
    this.Guest,
    this.Payment,
    this.BookingRoom,
    this.BookingService,
    this.$__typename = 'Booking',
  });

  factory Query$GetBookings$bookings.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$guestId = json['guestId'];
    final l$propertyId = json['propertyId'];
    final l$status = json['status'];
    final l$checkInDate = json['checkInDate'];
    final l$checkOutDate = json['checkOutDate'];
    final l$adults = json['adults'];
    final l$children = json['children'];
    final l$discountAmount = json['discountAmount'];
    final l$discountType = json['discountType'];
    final l$totalAmount = json['totalAmount'];
    final l$notes = json['notes'];
    final l$waiveLastDayCharge = json['waiveLastDayCharge'];
    final l$Guest = json['Guest'];
    final l$Payment = json['Payment'];
    final l$BookingRoom = json['BookingRoom'];
    final l$BookingService = json['BookingService'];
    final l$$__typename = json['__typename'];
    return Query$GetBookings$bookings(
      id: (l$id as String),
      guestId: (l$guestId as String),
      propertyId: (l$propertyId as String),
      status: l$status == null
          ? null
          : fromJson$Enum$BookingStatus((l$status as String)),
      checkInDate: (l$checkInDate as String),
      checkOutDate: (l$checkOutDate as String),
      adults: (l$adults as int?),
      children: (l$children as int?),
      discountAmount: (l$discountAmount as num?)?.toDouble(),
      discountType: (l$discountType as String?),
      totalAmount: (l$totalAmount as num?)?.toDouble(),
      notes: (l$notes as String?),
      waiveLastDayCharge: (l$waiveLastDayCharge as bool?),
      Guest: l$Guest == null
          ? null
          : Query$GetBookings$bookings$Guest.fromJson(
              (l$Guest as Map<String, dynamic>)),
      Payment: (l$Payment as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$GetBookings$bookings$Payment.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      BookingRoom: (l$BookingRoom as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$GetBookings$bookings$BookingRoom.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      BookingService: (l$BookingService as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$GetBookings$bookings$BookingService.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String guestId;

  final String propertyId;

  final Enum$BookingStatus? status;

  final String checkInDate;

  final String checkOutDate;

  final int? adults;

  final int? children;

  final double? discountAmount;

  final String? discountType;

  final double? totalAmount;

  final String? notes;

  final bool? waiveLastDayCharge;

  final Query$GetBookings$bookings$Guest? Guest;

  final List<Query$GetBookings$bookings$Payment?>? Payment;

  final List<Query$GetBookings$bookings$BookingRoom?>? BookingRoom;

  final List<Query$GetBookings$bookings$BookingService?>? BookingService;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$guestId = guestId;
    _resultData['guestId'] = l$guestId;
    final l$propertyId = propertyId;
    _resultData['propertyId'] = l$propertyId;
    final l$status = status;
    _resultData['status'] =
        l$status == null ? null : toJson$Enum$BookingStatus(l$status);
    final l$checkInDate = checkInDate;
    _resultData['checkInDate'] = l$checkInDate;
    final l$checkOutDate = checkOutDate;
    _resultData['checkOutDate'] = l$checkOutDate;
    final l$adults = adults;
    _resultData['adults'] = l$adults;
    final l$children = children;
    _resultData['children'] = l$children;
    final l$discountAmount = discountAmount;
    _resultData['discountAmount'] = l$discountAmount;
    final l$discountType = discountType;
    _resultData['discountType'] = l$discountType;
    final l$totalAmount = totalAmount;
    _resultData['totalAmount'] = l$totalAmount;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$waiveLastDayCharge = waiveLastDayCharge;
    _resultData['waiveLastDayCharge'] = l$waiveLastDayCharge;
    final l$Guest = Guest;
    _resultData['Guest'] = l$Guest?.toJson();
    final l$Payment = Payment;
    _resultData['Payment'] = l$Payment?.map((e) => e?.toJson()).toList();
    final l$BookingRoom = BookingRoom;
    _resultData['BookingRoom'] =
        l$BookingRoom?.map((e) => e?.toJson()).toList();
    final l$BookingService = BookingService;
    _resultData['BookingService'] =
        l$BookingService?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$guestId = guestId;
    final l$propertyId = propertyId;
    final l$status = status;
    final l$checkInDate = checkInDate;
    final l$checkOutDate = checkOutDate;
    final l$adults = adults;
    final l$children = children;
    final l$discountAmount = discountAmount;
    final l$discountType = discountType;
    final l$totalAmount = totalAmount;
    final l$notes = notes;
    final l$waiveLastDayCharge = waiveLastDayCharge;
    final l$Guest = Guest;
    final l$Payment = Payment;
    final l$BookingRoom = BookingRoom;
    final l$BookingService = BookingService;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$guestId,
      l$propertyId,
      l$status,
      l$checkInDate,
      l$checkOutDate,
      l$adults,
      l$children,
      l$discountAmount,
      l$discountType,
      l$totalAmount,
      l$notes,
      l$waiveLastDayCharge,
      l$Guest,
      l$Payment == null ? null : Object.hashAll(l$Payment.map((v) => v)),
      l$BookingRoom == null
          ? null
          : Object.hashAll(l$BookingRoom.map((v) => v)),
      l$BookingService == null
          ? null
          : Object.hashAll(l$BookingService.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetBookings$bookings) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$guestId = guestId;
    final lOther$guestId = other.guestId;
    if (l$guestId != lOther$guestId) {
      return false;
    }
    final l$propertyId = propertyId;
    final lOther$propertyId = other.propertyId;
    if (l$propertyId != lOther$propertyId) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$checkInDate = checkInDate;
    final lOther$checkInDate = other.checkInDate;
    if (l$checkInDate != lOther$checkInDate) {
      return false;
    }
    final l$checkOutDate = checkOutDate;
    final lOther$checkOutDate = other.checkOutDate;
    if (l$checkOutDate != lOther$checkOutDate) {
      return false;
    }
    final l$adults = adults;
    final lOther$adults = other.adults;
    if (l$adults != lOther$adults) {
      return false;
    }
    final l$children = children;
    final lOther$children = other.children;
    if (l$children != lOther$children) {
      return false;
    }
    final l$discountAmount = discountAmount;
    final lOther$discountAmount = other.discountAmount;
    if (l$discountAmount != lOther$discountAmount) {
      return false;
    }
    final l$discountType = discountType;
    final lOther$discountType = other.discountType;
    if (l$discountType != lOther$discountType) {
      return false;
    }
    final l$totalAmount = totalAmount;
    final lOther$totalAmount = other.totalAmount;
    if (l$totalAmount != lOther$totalAmount) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$waiveLastDayCharge = waiveLastDayCharge;
    final lOther$waiveLastDayCharge = other.waiveLastDayCharge;
    if (l$waiveLastDayCharge != lOther$waiveLastDayCharge) {
      return false;
    }
    final l$Guest = Guest;
    final lOther$Guest = other.Guest;
    if (l$Guest != lOther$Guest) {
      return false;
    }
    final l$Payment = Payment;
    final lOther$Payment = other.Payment;
    if (l$Payment != null && lOther$Payment != null) {
      if (l$Payment.length != lOther$Payment.length) {
        return false;
      }
      for (int i = 0; i < l$Payment.length; i++) {
        final l$Payment$entry = l$Payment[i];
        final lOther$Payment$entry = lOther$Payment[i];
        if (l$Payment$entry != lOther$Payment$entry) {
          return false;
        }
      }
    } else if (l$Payment != lOther$Payment) {
      return false;
    }
    final l$BookingRoom = BookingRoom;
    final lOther$BookingRoom = other.BookingRoom;
    if (l$BookingRoom != null && lOther$BookingRoom != null) {
      if (l$BookingRoom.length != lOther$BookingRoom.length) {
        return false;
      }
      for (int i = 0; i < l$BookingRoom.length; i++) {
        final l$BookingRoom$entry = l$BookingRoom[i];
        final lOther$BookingRoom$entry = lOther$BookingRoom[i];
        if (l$BookingRoom$entry != lOther$BookingRoom$entry) {
          return false;
        }
      }
    } else if (l$BookingRoom != lOther$BookingRoom) {
      return false;
    }
    final l$BookingService = BookingService;
    final lOther$BookingService = other.BookingService;
    if (l$BookingService != null && lOther$BookingService != null) {
      if (l$BookingService.length != lOther$BookingService.length) {
        return false;
      }
      for (int i = 0; i < l$BookingService.length; i++) {
        final l$BookingService$entry = l$BookingService[i];
        final lOther$BookingService$entry = lOther$BookingService[i];
        if (l$BookingService$entry != lOther$BookingService$entry) {
          return false;
        }
      }
    } else if (l$BookingService != lOther$BookingService) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetBookings$bookings
    on Query$GetBookings$bookings {
  CopyWith$Query$GetBookings$bookings<Query$GetBookings$bookings>
      get copyWith => CopyWith$Query$GetBookings$bookings(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetBookings$bookings<TRes> {
  factory CopyWith$Query$GetBookings$bookings(
    Query$GetBookings$bookings instance,
    TRes Function(Query$GetBookings$bookings) then,
  ) = _CopyWithImpl$Query$GetBookings$bookings;

  factory CopyWith$Query$GetBookings$bookings.stub(TRes res) =
      _CopyWithStubImpl$Query$GetBookings$bookings;

  TRes call({
    String? id,
    String? guestId,
    String? propertyId,
    Enum$BookingStatus? status,
    String? checkInDate,
    String? checkOutDate,
    int? adults,
    int? children,
    double? discountAmount,
    String? discountType,
    double? totalAmount,
    String? notes,
    bool? waiveLastDayCharge,
    Query$GetBookings$bookings$Guest? Guest,
    List<Query$GetBookings$bookings$Payment?>? Payment,
    List<Query$GetBookings$bookings$BookingRoom?>? BookingRoom,
    List<Query$GetBookings$bookings$BookingService?>? BookingService,
    String? $__typename,
  });
  CopyWith$Query$GetBookings$bookings$Guest<TRes> get Guest;
  TRes Payment(
      Iterable<Query$GetBookings$bookings$Payment?>? Function(
              Iterable<
                  CopyWith$Query$GetBookings$bookings$Payment<
                      Query$GetBookings$bookings$Payment>?>?)
          _fn);
  TRes BookingRoom(
      Iterable<Query$GetBookings$bookings$BookingRoom?>? Function(
              Iterable<
                  CopyWith$Query$GetBookings$bookings$BookingRoom<
                      Query$GetBookings$bookings$BookingRoom>?>?)
          _fn);
  TRes BookingService(
      Iterable<Query$GetBookings$bookings$BookingService?>? Function(
              Iterable<
                  CopyWith$Query$GetBookings$bookings$BookingService<
                      Query$GetBookings$bookings$BookingService>?>?)
          _fn);
}

class _CopyWithImpl$Query$GetBookings$bookings<TRes>
    implements CopyWith$Query$GetBookings$bookings<TRes> {
  _CopyWithImpl$Query$GetBookings$bookings(
    this._instance,
    this._then,
  );

  final Query$GetBookings$bookings _instance;

  final TRes Function(Query$GetBookings$bookings) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? guestId = _undefined,
    Object? propertyId = _undefined,
    Object? status = _undefined,
    Object? checkInDate = _undefined,
    Object? checkOutDate = _undefined,
    Object? adults = _undefined,
    Object? children = _undefined,
    Object? discountAmount = _undefined,
    Object? discountType = _undefined,
    Object? totalAmount = _undefined,
    Object? notes = _undefined,
    Object? waiveLastDayCharge = _undefined,
    Object? Guest = _undefined,
    Object? Payment = _undefined,
    Object? BookingRoom = _undefined,
    Object? BookingService = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetBookings$bookings(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        guestId: guestId == _undefined || guestId == null
            ? _instance.guestId
            : (guestId as String),
        propertyId: propertyId == _undefined || propertyId == null
            ? _instance.propertyId
            : (propertyId as String),
        status: status == _undefined
            ? _instance.status
            : (status as Enum$BookingStatus?),
        checkInDate: checkInDate == _undefined || checkInDate == null
            ? _instance.checkInDate
            : (checkInDate as String),
        checkOutDate: checkOutDate == _undefined || checkOutDate == null
            ? _instance.checkOutDate
            : (checkOutDate as String),
        adults: adults == _undefined ? _instance.adults : (adults as int?),
        children:
            children == _undefined ? _instance.children : (children as int?),
        discountAmount: discountAmount == _undefined
            ? _instance.discountAmount
            : (discountAmount as double?),
        discountType: discountType == _undefined
            ? _instance.discountType
            : (discountType as String?),
        totalAmount: totalAmount == _undefined
            ? _instance.totalAmount
            : (totalAmount as double?),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        waiveLastDayCharge: waiveLastDayCharge == _undefined
            ? _instance.waiveLastDayCharge
            : (waiveLastDayCharge as bool?),
        Guest: Guest == _undefined
            ? _instance.Guest
            : (Guest as Query$GetBookings$bookings$Guest?),
        Payment: Payment == _undefined
            ? _instance.Payment
            : (Payment as List<Query$GetBookings$bookings$Payment?>?),
        BookingRoom: BookingRoom == _undefined
            ? _instance.BookingRoom
            : (BookingRoom as List<Query$GetBookings$bookings$BookingRoom?>?),
        BookingService: BookingService == _undefined
            ? _instance.BookingService
            : (BookingService
                as List<Query$GetBookings$bookings$BookingService?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetBookings$bookings$Guest<TRes> get Guest {
    final local$Guest = _instance.Guest;
    return local$Guest == null
        ? CopyWith$Query$GetBookings$bookings$Guest.stub(_then(_instance))
        : CopyWith$Query$GetBookings$bookings$Guest(
            local$Guest, (e) => call(Guest: e));
  }

  TRes Payment(
          Iterable<Query$GetBookings$bookings$Payment?>? Function(
                  Iterable<
                      CopyWith$Query$GetBookings$bookings$Payment<
                          Query$GetBookings$bookings$Payment>?>?)
              _fn) =>
      call(
          Payment: _fn(_instance.Payment?.map((e) => e == null
              ? null
              : CopyWith$Query$GetBookings$bookings$Payment(
                  e,
                  (i) => i,
                )))?.toList());

  TRes BookingRoom(
          Iterable<Query$GetBookings$bookings$BookingRoom?>? Function(
                  Iterable<
                      CopyWith$Query$GetBookings$bookings$BookingRoom<
                          Query$GetBookings$bookings$BookingRoom>?>?)
              _fn) =>
      call(
          BookingRoom: _fn(_instance.BookingRoom?.map((e) => e == null
              ? null
              : CopyWith$Query$GetBookings$bookings$BookingRoom(
                  e,
                  (i) => i,
                )))?.toList());

  TRes BookingService(
          Iterable<Query$GetBookings$bookings$BookingService?>? Function(
                  Iterable<
                      CopyWith$Query$GetBookings$bookings$BookingService<
                          Query$GetBookings$bookings$BookingService>?>?)
              _fn) =>
      call(
          BookingService: _fn(_instance.BookingService?.map((e) => e == null
              ? null
              : CopyWith$Query$GetBookings$bookings$BookingService(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$GetBookings$bookings<TRes>
    implements CopyWith$Query$GetBookings$bookings<TRes> {
  _CopyWithStubImpl$Query$GetBookings$bookings(this._res);

  TRes _res;

  call({
    String? id,
    String? guestId,
    String? propertyId,
    Enum$BookingStatus? status,
    String? checkInDate,
    String? checkOutDate,
    int? adults,
    int? children,
    double? discountAmount,
    String? discountType,
    double? totalAmount,
    String? notes,
    bool? waiveLastDayCharge,
    Query$GetBookings$bookings$Guest? Guest,
    List<Query$GetBookings$bookings$Payment?>? Payment,
    List<Query$GetBookings$bookings$BookingRoom?>? BookingRoom,
    List<Query$GetBookings$bookings$BookingService?>? BookingService,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetBookings$bookings$Guest<TRes> get Guest =>
      CopyWith$Query$GetBookings$bookings$Guest.stub(_res);

  Payment(_fn) => _res;

  BookingRoom(_fn) => _res;

  BookingService(_fn) => _res;
}

class Query$GetBookings$bookings$Guest {
  Query$GetBookings$bookings$Guest({
    required this.id,
    required this.name,
    this.phone,
    this.email,
    this.address,
    this.gstin,
    this.$__typename = 'Guest',
  });

  factory Query$GetBookings$bookings$Guest.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$phone = json['phone'];
    final l$email = json['email'];
    final l$address = json['address'];
    final l$gstin = json['gstin'];
    final l$$__typename = json['__typename'];
    return Query$GetBookings$bookings$Guest(
      id: (l$id as String),
      name: (l$name as String),
      phone: (l$phone as String?),
      email: (l$email as String?),
      address: (l$address as String?),
      gstin: (l$gstin as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? phone;

  final String? email;

  final String? address;

  final String? gstin;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$address = address;
    _resultData['address'] = l$address;
    final l$gstin = gstin;
    _resultData['gstin'] = l$gstin;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$phone = phone;
    final l$email = email;
    final l$address = address;
    final l$gstin = gstin;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$phone,
      l$email,
      l$address,
      l$gstin,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetBookings$bookings$Guest) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
      return false;
    }
    final l$gstin = gstin;
    final lOther$gstin = other.gstin;
    if (l$gstin != lOther$gstin) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetBookings$bookings$Guest
    on Query$GetBookings$bookings$Guest {
  CopyWith$Query$GetBookings$bookings$Guest<Query$GetBookings$bookings$Guest>
      get copyWith => CopyWith$Query$GetBookings$bookings$Guest(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetBookings$bookings$Guest<TRes> {
  factory CopyWith$Query$GetBookings$bookings$Guest(
    Query$GetBookings$bookings$Guest instance,
    TRes Function(Query$GetBookings$bookings$Guest) then,
  ) = _CopyWithImpl$Query$GetBookings$bookings$Guest;

  factory CopyWith$Query$GetBookings$bookings$Guest.stub(TRes res) =
      _CopyWithStubImpl$Query$GetBookings$bookings$Guest;

  TRes call({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? address,
    String? gstin,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetBookings$bookings$Guest<TRes>
    implements CopyWith$Query$GetBookings$bookings$Guest<TRes> {
  _CopyWithImpl$Query$GetBookings$bookings$Guest(
    this._instance,
    this._then,
  );

  final Query$GetBookings$bookings$Guest _instance;

  final TRes Function(Query$GetBookings$bookings$Guest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? phone = _undefined,
    Object? email = _undefined,
    Object? address = _undefined,
    Object? gstin = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetBookings$bookings$Guest(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        email: email == _undefined ? _instance.email : (email as String?),
        address:
            address == _undefined ? _instance.address : (address as String?),
        gstin: gstin == _undefined ? _instance.gstin : (gstin as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetBookings$bookings$Guest<TRes>
    implements CopyWith$Query$GetBookings$bookings$Guest<TRes> {
  _CopyWithStubImpl$Query$GetBookings$bookings$Guest(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? address,
    String? gstin,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetBookings$bookings$Payment {
  Query$GetBookings$bookings$Payment({
    required this.id,
    required this.amount,
    required this.method,
    this.status,
    this.createdAt,
    this.$__typename = 'Payment',
  });

  factory Query$GetBookings$bookings$Payment.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$amount = json['amount'];
    final l$method = json['method'];
    final l$status = json['status'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$GetBookings$bookings$Payment(
      id: (l$id as String),
      amount: (l$amount as num).toDouble(),
      method: (l$method as String),
      status: l$status == null
          ? null
          : fromJson$Enum$PaymentStatus((l$status as String)),
      createdAt: (l$createdAt as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final double amount;

  final String method;

  final Enum$PaymentStatus? status;

  final String? createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$amount = amount;
    _resultData['amount'] = l$amount;
    final l$method = method;
    _resultData['method'] = l$method;
    final l$status = status;
    _resultData['status'] =
        l$status == null ? null : toJson$Enum$PaymentStatus(l$status);
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$amount = amount;
    final l$method = method;
    final l$status = status;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$amount,
      l$method,
      l$status,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetBookings$bookings$Payment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$amount = amount;
    final lOther$amount = other.amount;
    if (l$amount != lOther$amount) {
      return false;
    }
    final l$method = method;
    final lOther$method = other.method;
    if (l$method != lOther$method) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetBookings$bookings$Payment
    on Query$GetBookings$bookings$Payment {
  CopyWith$Query$GetBookings$bookings$Payment<
          Query$GetBookings$bookings$Payment>
      get copyWith => CopyWith$Query$GetBookings$bookings$Payment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetBookings$bookings$Payment<TRes> {
  factory CopyWith$Query$GetBookings$bookings$Payment(
    Query$GetBookings$bookings$Payment instance,
    TRes Function(Query$GetBookings$bookings$Payment) then,
  ) = _CopyWithImpl$Query$GetBookings$bookings$Payment;

  factory CopyWith$Query$GetBookings$bookings$Payment.stub(TRes res) =
      _CopyWithStubImpl$Query$GetBookings$bookings$Payment;

  TRes call({
    String? id,
    double? amount,
    String? method,
    Enum$PaymentStatus? status,
    String? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetBookings$bookings$Payment<TRes>
    implements CopyWith$Query$GetBookings$bookings$Payment<TRes> {
  _CopyWithImpl$Query$GetBookings$bookings$Payment(
    this._instance,
    this._then,
  );

  final Query$GetBookings$bookings$Payment _instance;

  final TRes Function(Query$GetBookings$bookings$Payment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? amount = _undefined,
    Object? method = _undefined,
    Object? status = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetBookings$bookings$Payment(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        amount: amount == _undefined || amount == null
            ? _instance.amount
            : (amount as double),
        method: method == _undefined || method == null
            ? _instance.method
            : (method as String),
        status: status == _undefined
            ? _instance.status
            : (status as Enum$PaymentStatus?),
        createdAt: createdAt == _undefined
            ? _instance.createdAt
            : (createdAt as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetBookings$bookings$Payment<TRes>
    implements CopyWith$Query$GetBookings$bookings$Payment<TRes> {
  _CopyWithStubImpl$Query$GetBookings$bookings$Payment(this._res);

  TRes _res;

  call({
    String? id,
    double? amount,
    String? method,
    Enum$PaymentStatus? status,
    String? createdAt,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetBookings$bookings$BookingRoom {
  Query$GetBookings$bookings$BookingRoom({
    required this.id,
    this.roomId,
    required this.roomTypeId,
    required this.status,
    this.checkInDate,
    this.checkOutDate,
    this.priceOverride,
    this.Room,
    this.RoomType,
    this.$__typename = 'BookingRoom',
  });

  factory Query$GetBookings$bookings$BookingRoom.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$roomId = json['roomId'];
    final l$roomTypeId = json['roomTypeId'];
    final l$status = json['status'];
    final l$checkInDate = json['checkInDate'];
    final l$checkOutDate = json['checkOutDate'];
    final l$priceOverride = json['priceOverride'];
    final l$Room = json['Room'];
    final l$RoomType = json['RoomType'];
    final l$$__typename = json['__typename'];
    return Query$GetBookings$bookings$BookingRoom(
      id: (l$id as String),
      roomId: (l$roomId as String?),
      roomTypeId: (l$roomTypeId as String),
      status: fromJson$Enum$BookingStatus((l$status as String)),
      checkInDate: (l$checkInDate as String?),
      checkOutDate: (l$checkOutDate as String?),
      priceOverride: (l$priceOverride as num?)?.toDouble(),
      Room: l$Room == null
          ? null
          : Query$GetBookings$bookings$BookingRoom$Room.fromJson(
              (l$Room as Map<String, dynamic>)),
      RoomType: l$RoomType == null
          ? null
          : Query$GetBookings$bookings$BookingRoom$RoomType.fromJson(
              (l$RoomType as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? roomId;

  final String roomTypeId;

  final Enum$BookingStatus status;

  final String? checkInDate;

  final String? checkOutDate;

  final double? priceOverride;

  final Query$GetBookings$bookings$BookingRoom$Room? Room;

  final Query$GetBookings$bookings$BookingRoom$RoomType? RoomType;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$roomId = roomId;
    _resultData['roomId'] = l$roomId;
    final l$roomTypeId = roomTypeId;
    _resultData['roomTypeId'] = l$roomTypeId;
    final l$status = status;
    _resultData['status'] = toJson$Enum$BookingStatus(l$status);
    final l$checkInDate = checkInDate;
    _resultData['checkInDate'] = l$checkInDate;
    final l$checkOutDate = checkOutDate;
    _resultData['checkOutDate'] = l$checkOutDate;
    final l$priceOverride = priceOverride;
    _resultData['priceOverride'] = l$priceOverride;
    final l$Room = Room;
    _resultData['Room'] = l$Room?.toJson();
    final l$RoomType = RoomType;
    _resultData['RoomType'] = l$RoomType?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$roomId = roomId;
    final l$roomTypeId = roomTypeId;
    final l$status = status;
    final l$checkInDate = checkInDate;
    final l$checkOutDate = checkOutDate;
    final l$priceOverride = priceOverride;
    final l$Room = Room;
    final l$RoomType = RoomType;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$roomId,
      l$roomTypeId,
      l$status,
      l$checkInDate,
      l$checkOutDate,
      l$priceOverride,
      l$Room,
      l$RoomType,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetBookings$bookings$BookingRoom) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$roomId = roomId;
    final lOther$roomId = other.roomId;
    if (l$roomId != lOther$roomId) {
      return false;
    }
    final l$roomTypeId = roomTypeId;
    final lOther$roomTypeId = other.roomTypeId;
    if (l$roomTypeId != lOther$roomTypeId) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$checkInDate = checkInDate;
    final lOther$checkInDate = other.checkInDate;
    if (l$checkInDate != lOther$checkInDate) {
      return false;
    }
    final l$checkOutDate = checkOutDate;
    final lOther$checkOutDate = other.checkOutDate;
    if (l$checkOutDate != lOther$checkOutDate) {
      return false;
    }
    final l$priceOverride = priceOverride;
    final lOther$priceOverride = other.priceOverride;
    if (l$priceOverride != lOther$priceOverride) {
      return false;
    }
    final l$Room = Room;
    final lOther$Room = other.Room;
    if (l$Room != lOther$Room) {
      return false;
    }
    final l$RoomType = RoomType;
    final lOther$RoomType = other.RoomType;
    if (l$RoomType != lOther$RoomType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetBookings$bookings$BookingRoom
    on Query$GetBookings$bookings$BookingRoom {
  CopyWith$Query$GetBookings$bookings$BookingRoom<
          Query$GetBookings$bookings$BookingRoom>
      get copyWith => CopyWith$Query$GetBookings$bookings$BookingRoom(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetBookings$bookings$BookingRoom<TRes> {
  factory CopyWith$Query$GetBookings$bookings$BookingRoom(
    Query$GetBookings$bookings$BookingRoom instance,
    TRes Function(Query$GetBookings$bookings$BookingRoom) then,
  ) = _CopyWithImpl$Query$GetBookings$bookings$BookingRoom;

  factory CopyWith$Query$GetBookings$bookings$BookingRoom.stub(TRes res) =
      _CopyWithStubImpl$Query$GetBookings$bookings$BookingRoom;

  TRes call({
    String? id,
    String? roomId,
    String? roomTypeId,
    Enum$BookingStatus? status,
    String? checkInDate,
    String? checkOutDate,
    double? priceOverride,
    Query$GetBookings$bookings$BookingRoom$Room? Room,
    Query$GetBookings$bookings$BookingRoom$RoomType? RoomType,
    String? $__typename,
  });
  CopyWith$Query$GetBookings$bookings$BookingRoom$Room<TRes> get Room;
  CopyWith$Query$GetBookings$bookings$BookingRoom$RoomType<TRes> get RoomType;
}

class _CopyWithImpl$Query$GetBookings$bookings$BookingRoom<TRes>
    implements CopyWith$Query$GetBookings$bookings$BookingRoom<TRes> {
  _CopyWithImpl$Query$GetBookings$bookings$BookingRoom(
    this._instance,
    this._then,
  );

  final Query$GetBookings$bookings$BookingRoom _instance;

  final TRes Function(Query$GetBookings$bookings$BookingRoom) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? roomId = _undefined,
    Object? roomTypeId = _undefined,
    Object? status = _undefined,
    Object? checkInDate = _undefined,
    Object? checkOutDate = _undefined,
    Object? priceOverride = _undefined,
    Object? Room = _undefined,
    Object? RoomType = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetBookings$bookings$BookingRoom(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        roomId: roomId == _undefined ? _instance.roomId : (roomId as String?),
        roomTypeId: roomTypeId == _undefined || roomTypeId == null
            ? _instance.roomTypeId
            : (roomTypeId as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$BookingStatus),
        checkInDate: checkInDate == _undefined
            ? _instance.checkInDate
            : (checkInDate as String?),
        checkOutDate: checkOutDate == _undefined
            ? _instance.checkOutDate
            : (checkOutDate as String?),
        priceOverride: priceOverride == _undefined
            ? _instance.priceOverride
            : (priceOverride as double?),
        Room: Room == _undefined
            ? _instance.Room
            : (Room as Query$GetBookings$bookings$BookingRoom$Room?),
        RoomType: RoomType == _undefined
            ? _instance.RoomType
            : (RoomType as Query$GetBookings$bookings$BookingRoom$RoomType?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetBookings$bookings$BookingRoom$Room<TRes> get Room {
    final local$Room = _instance.Room;
    return local$Room == null
        ? CopyWith$Query$GetBookings$bookings$BookingRoom$Room.stub(
            _then(_instance))
        : CopyWith$Query$GetBookings$bookings$BookingRoom$Room(
            local$Room, (e) => call(Room: e));
  }

  CopyWith$Query$GetBookings$bookings$BookingRoom$RoomType<TRes> get RoomType {
    final local$RoomType = _instance.RoomType;
    return local$RoomType == null
        ? CopyWith$Query$GetBookings$bookings$BookingRoom$RoomType.stub(
            _then(_instance))
        : CopyWith$Query$GetBookings$bookings$BookingRoom$RoomType(
            local$RoomType, (e) => call(RoomType: e));
  }
}

class _CopyWithStubImpl$Query$GetBookings$bookings$BookingRoom<TRes>
    implements CopyWith$Query$GetBookings$bookings$BookingRoom<TRes> {
  _CopyWithStubImpl$Query$GetBookings$bookings$BookingRoom(this._res);

  TRes _res;

  call({
    String? id,
    String? roomId,
    String? roomTypeId,
    Enum$BookingStatus? status,
    String? checkInDate,
    String? checkOutDate,
    double? priceOverride,
    Query$GetBookings$bookings$BookingRoom$Room? Room,
    Query$GetBookings$bookings$BookingRoom$RoomType? RoomType,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetBookings$bookings$BookingRoom$Room<TRes> get Room =>
      CopyWith$Query$GetBookings$bookings$BookingRoom$Room.stub(_res);

  CopyWith$Query$GetBookings$bookings$BookingRoom$RoomType<TRes> get RoomType =>
      CopyWith$Query$GetBookings$bookings$BookingRoom$RoomType.stub(_res);
}

class Query$GetBookings$bookings$BookingRoom$Room {
  Query$GetBookings$bookings$BookingRoom$Room({
    required this.id,
    required this.roomNumber,
    this.$__typename = 'Room',
  });

  factory Query$GetBookings$bookings$BookingRoom$Room.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$roomNumber = json['roomNumber'];
    final l$$__typename = json['__typename'];
    return Query$GetBookings$bookings$BookingRoom$Room(
      id: (l$id as String),
      roomNumber: (l$roomNumber as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String roomNumber;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$roomNumber = roomNumber;
    _resultData['roomNumber'] = l$roomNumber;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$roomNumber = roomNumber;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$roomNumber,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetBookings$bookings$BookingRoom$Room) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$roomNumber = roomNumber;
    final lOther$roomNumber = other.roomNumber;
    if (l$roomNumber != lOther$roomNumber) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetBookings$bookings$BookingRoom$Room
    on Query$GetBookings$bookings$BookingRoom$Room {
  CopyWith$Query$GetBookings$bookings$BookingRoom$Room<
          Query$GetBookings$bookings$BookingRoom$Room>
      get copyWith => CopyWith$Query$GetBookings$bookings$BookingRoom$Room(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetBookings$bookings$BookingRoom$Room<TRes> {
  factory CopyWith$Query$GetBookings$bookings$BookingRoom$Room(
    Query$GetBookings$bookings$BookingRoom$Room instance,
    TRes Function(Query$GetBookings$bookings$BookingRoom$Room) then,
  ) = _CopyWithImpl$Query$GetBookings$bookings$BookingRoom$Room;

  factory CopyWith$Query$GetBookings$bookings$BookingRoom$Room.stub(TRes res) =
      _CopyWithStubImpl$Query$GetBookings$bookings$BookingRoom$Room;

  TRes call({
    String? id,
    String? roomNumber,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetBookings$bookings$BookingRoom$Room<TRes>
    implements CopyWith$Query$GetBookings$bookings$BookingRoom$Room<TRes> {
  _CopyWithImpl$Query$GetBookings$bookings$BookingRoom$Room(
    this._instance,
    this._then,
  );

  final Query$GetBookings$bookings$BookingRoom$Room _instance;

  final TRes Function(Query$GetBookings$bookings$BookingRoom$Room) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? roomNumber = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetBookings$bookings$BookingRoom$Room(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        roomNumber: roomNumber == _undefined || roomNumber == null
            ? _instance.roomNumber
            : (roomNumber as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetBookings$bookings$BookingRoom$Room<TRes>
    implements CopyWith$Query$GetBookings$bookings$BookingRoom$Room<TRes> {
  _CopyWithStubImpl$Query$GetBookings$bookings$BookingRoom$Room(this._res);

  TRes _res;

  call({
    String? id,
    String? roomNumber,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetBookings$bookings$BookingRoom$RoomType {
  Query$GetBookings$bookings$BookingRoom$RoomType({
    required this.id,
    required this.name,
    this.defaultPrice,
    this.$__typename = 'RoomType',
  });

  factory Query$GetBookings$bookings$BookingRoom$RoomType.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$defaultPrice = json['defaultPrice'];
    final l$$__typename = json['__typename'];
    return Query$GetBookings$bookings$BookingRoom$RoomType(
      id: (l$id as String),
      name: (l$name as String),
      defaultPrice: (l$defaultPrice as num?)?.toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final double? defaultPrice;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$defaultPrice = defaultPrice;
    _resultData['defaultPrice'] = l$defaultPrice;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$defaultPrice = defaultPrice;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$defaultPrice,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetBookings$bookings$BookingRoom$RoomType) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$defaultPrice = defaultPrice;
    final lOther$defaultPrice = other.defaultPrice;
    if (l$defaultPrice != lOther$defaultPrice) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetBookings$bookings$BookingRoom$RoomType
    on Query$GetBookings$bookings$BookingRoom$RoomType {
  CopyWith$Query$GetBookings$bookings$BookingRoom$RoomType<
          Query$GetBookings$bookings$BookingRoom$RoomType>
      get copyWith => CopyWith$Query$GetBookings$bookings$BookingRoom$RoomType(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetBookings$bookings$BookingRoom$RoomType<TRes> {
  factory CopyWith$Query$GetBookings$bookings$BookingRoom$RoomType(
    Query$GetBookings$bookings$BookingRoom$RoomType instance,
    TRes Function(Query$GetBookings$bookings$BookingRoom$RoomType) then,
  ) = _CopyWithImpl$Query$GetBookings$bookings$BookingRoom$RoomType;

  factory CopyWith$Query$GetBookings$bookings$BookingRoom$RoomType.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetBookings$bookings$BookingRoom$RoomType;

  TRes call({
    String? id,
    String? name,
    double? defaultPrice,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetBookings$bookings$BookingRoom$RoomType<TRes>
    implements CopyWith$Query$GetBookings$bookings$BookingRoom$RoomType<TRes> {
  _CopyWithImpl$Query$GetBookings$bookings$BookingRoom$RoomType(
    this._instance,
    this._then,
  );

  final Query$GetBookings$bookings$BookingRoom$RoomType _instance;

  final TRes Function(Query$GetBookings$bookings$BookingRoom$RoomType) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? defaultPrice = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetBookings$bookings$BookingRoom$RoomType(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        defaultPrice: defaultPrice == _undefined
            ? _instance.defaultPrice
            : (defaultPrice as double?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetBookings$bookings$BookingRoom$RoomType<TRes>
    implements CopyWith$Query$GetBookings$bookings$BookingRoom$RoomType<TRes> {
  _CopyWithStubImpl$Query$GetBookings$bookings$BookingRoom$RoomType(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    double? defaultPrice,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetBookings$bookings$BookingService {
  Query$GetBookings$bookings$BookingService({
    required this.id,
    required this.bookingId,
    required this.serviceId,
    this.quantity,
    required this.totalPrice,
    this.Service,
    this.$__typename = 'BookingService',
  });

  factory Query$GetBookings$bookings$BookingService.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$bookingId = json['bookingId'];
    final l$serviceId = json['serviceId'];
    final l$quantity = json['quantity'];
    final l$totalPrice = json['totalPrice'];
    final l$Service = json['Service'];
    final l$$__typename = json['__typename'];
    return Query$GetBookings$bookings$BookingService(
      id: (l$id as String),
      bookingId: (l$bookingId as String),
      serviceId: (l$serviceId as String),
      quantity: (l$quantity as int?),
      totalPrice: (l$totalPrice as num).toDouble(),
      Service: l$Service == null
          ? null
          : Query$GetBookings$bookings$BookingService$Service.fromJson(
              (l$Service as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String bookingId;

  final String serviceId;

  final int? quantity;

  final double totalPrice;

  final Query$GetBookings$bookings$BookingService$Service? Service;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$bookingId = bookingId;
    _resultData['bookingId'] = l$bookingId;
    final l$serviceId = serviceId;
    _resultData['serviceId'] = l$serviceId;
    final l$quantity = quantity;
    _resultData['quantity'] = l$quantity;
    final l$totalPrice = totalPrice;
    _resultData['totalPrice'] = l$totalPrice;
    final l$Service = Service;
    _resultData['Service'] = l$Service?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$bookingId = bookingId;
    final l$serviceId = serviceId;
    final l$quantity = quantity;
    final l$totalPrice = totalPrice;
    final l$Service = Service;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$bookingId,
      l$serviceId,
      l$quantity,
      l$totalPrice,
      l$Service,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetBookings$bookings$BookingService) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$bookingId = bookingId;
    final lOther$bookingId = other.bookingId;
    if (l$bookingId != lOther$bookingId) {
      return false;
    }
    final l$serviceId = serviceId;
    final lOther$serviceId = other.serviceId;
    if (l$serviceId != lOther$serviceId) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) {
      return false;
    }
    final l$totalPrice = totalPrice;
    final lOther$totalPrice = other.totalPrice;
    if (l$totalPrice != lOther$totalPrice) {
      return false;
    }
    final l$Service = Service;
    final lOther$Service = other.Service;
    if (l$Service != lOther$Service) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetBookings$bookings$BookingService
    on Query$GetBookings$bookings$BookingService {
  CopyWith$Query$GetBookings$bookings$BookingService<
          Query$GetBookings$bookings$BookingService>
      get copyWith => CopyWith$Query$GetBookings$bookings$BookingService(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetBookings$bookings$BookingService<TRes> {
  factory CopyWith$Query$GetBookings$bookings$BookingService(
    Query$GetBookings$bookings$BookingService instance,
    TRes Function(Query$GetBookings$bookings$BookingService) then,
  ) = _CopyWithImpl$Query$GetBookings$bookings$BookingService;

  factory CopyWith$Query$GetBookings$bookings$BookingService.stub(TRes res) =
      _CopyWithStubImpl$Query$GetBookings$bookings$BookingService;

  TRes call({
    String? id,
    String? bookingId,
    String? serviceId,
    int? quantity,
    double? totalPrice,
    Query$GetBookings$bookings$BookingService$Service? Service,
    String? $__typename,
  });
  CopyWith$Query$GetBookings$bookings$BookingService$Service<TRes> get Service;
}

class _CopyWithImpl$Query$GetBookings$bookings$BookingService<TRes>
    implements CopyWith$Query$GetBookings$bookings$BookingService<TRes> {
  _CopyWithImpl$Query$GetBookings$bookings$BookingService(
    this._instance,
    this._then,
  );

  final Query$GetBookings$bookings$BookingService _instance;

  final TRes Function(Query$GetBookings$bookings$BookingService) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? bookingId = _undefined,
    Object? serviceId = _undefined,
    Object? quantity = _undefined,
    Object? totalPrice = _undefined,
    Object? Service = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetBookings$bookings$BookingService(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        bookingId: bookingId == _undefined || bookingId == null
            ? _instance.bookingId
            : (bookingId as String),
        serviceId: serviceId == _undefined || serviceId == null
            ? _instance.serviceId
            : (serviceId as String),
        quantity:
            quantity == _undefined ? _instance.quantity : (quantity as int?),
        totalPrice: totalPrice == _undefined || totalPrice == null
            ? _instance.totalPrice
            : (totalPrice as double),
        Service: Service == _undefined
            ? _instance.Service
            : (Service as Query$GetBookings$bookings$BookingService$Service?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetBookings$bookings$BookingService$Service<TRes> get Service {
    final local$Service = _instance.Service;
    return local$Service == null
        ? CopyWith$Query$GetBookings$bookings$BookingService$Service.stub(
            _then(_instance))
        : CopyWith$Query$GetBookings$bookings$BookingService$Service(
            local$Service, (e) => call(Service: e));
  }
}

class _CopyWithStubImpl$Query$GetBookings$bookings$BookingService<TRes>
    implements CopyWith$Query$GetBookings$bookings$BookingService<TRes> {
  _CopyWithStubImpl$Query$GetBookings$bookings$BookingService(this._res);

  TRes _res;

  call({
    String? id,
    String? bookingId,
    String? serviceId,
    int? quantity,
    double? totalPrice,
    Query$GetBookings$bookings$BookingService$Service? Service,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetBookings$bookings$BookingService$Service<TRes>
      get Service =>
          CopyWith$Query$GetBookings$bookings$BookingService$Service.stub(_res);
}

class Query$GetBookings$bookings$BookingService$Service {
  Query$GetBookings$bookings$BookingService$Service({
    required this.id,
    required this.name,
    required this.price,
    this.$__typename = 'Service',
  });

  factory Query$GetBookings$bookings$BookingService$Service.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$price = json['price'];
    final l$$__typename = json['__typename'];
    return Query$GetBookings$bookings$BookingService$Service(
      id: (l$id as String),
      name: (l$name as String),
      price: (l$price as num).toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final double price;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$price = price;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$price,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetBookings$bookings$BookingService$Service) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetBookings$bookings$BookingService$Service
    on Query$GetBookings$bookings$BookingService$Service {
  CopyWith$Query$GetBookings$bookings$BookingService$Service<
          Query$GetBookings$bookings$BookingService$Service>
      get copyWith =>
          CopyWith$Query$GetBookings$bookings$BookingService$Service(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetBookings$bookings$BookingService$Service<
    TRes> {
  factory CopyWith$Query$GetBookings$bookings$BookingService$Service(
    Query$GetBookings$bookings$BookingService$Service instance,
    TRes Function(Query$GetBookings$bookings$BookingService$Service) then,
  ) = _CopyWithImpl$Query$GetBookings$bookings$BookingService$Service;

  factory CopyWith$Query$GetBookings$bookings$BookingService$Service.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetBookings$bookings$BookingService$Service;

  TRes call({
    String? id,
    String? name,
    double? price,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetBookings$bookings$BookingService$Service<TRes>
    implements
        CopyWith$Query$GetBookings$bookings$BookingService$Service<TRes> {
  _CopyWithImpl$Query$GetBookings$bookings$BookingService$Service(
    this._instance,
    this._then,
  );

  final Query$GetBookings$bookings$BookingService$Service _instance;

  final TRes Function(Query$GetBookings$bookings$BookingService$Service) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? price = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetBookings$bookings$BookingService$Service(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        price: price == _undefined || price == null
            ? _instance.price
            : (price as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetBookings$bookings$BookingService$Service<TRes>
    implements
        CopyWith$Query$GetBookings$bookings$BookingService$Service<TRes> {
  _CopyWithStubImpl$Query$GetBookings$bookings$BookingService$Service(
      this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    double? price,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetUsers {
  Query$GetUsers({
    required this.users,
    this.$__typename = 'Query',
  });

  factory Query$GetUsers.fromJson(Map<String, dynamic> json) {
    final l$users = json['users'];
    final l$$__typename = json['__typename'];
    return Query$GetUsers(
      users: (l$users as List<dynamic>)
          .map(
              (e) => Query$GetUsers$users.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetUsers$users> users;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$users = users;
    _resultData['users'] = l$users.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$users = users;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$users.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetUsers) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$users = users;
    final lOther$users = other.users;
    if (l$users.length != lOther$users.length) {
      return false;
    }
    for (int i = 0; i < l$users.length; i++) {
      final l$users$entry = l$users[i];
      final lOther$users$entry = lOther$users[i];
      if (l$users$entry != lOther$users$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetUsers on Query$GetUsers {
  CopyWith$Query$GetUsers<Query$GetUsers> get copyWith =>
      CopyWith$Query$GetUsers(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetUsers<TRes> {
  factory CopyWith$Query$GetUsers(
    Query$GetUsers instance,
    TRes Function(Query$GetUsers) then,
  ) = _CopyWithImpl$Query$GetUsers;

  factory CopyWith$Query$GetUsers.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUsers;

  TRes call({
    List<Query$GetUsers$users>? users,
    String? $__typename,
  });
  TRes users(
      Iterable<Query$GetUsers$users> Function(
              Iterable<CopyWith$Query$GetUsers$users<Query$GetUsers$users>>)
          _fn);
}

class _CopyWithImpl$Query$GetUsers<TRes>
    implements CopyWith$Query$GetUsers<TRes> {
  _CopyWithImpl$Query$GetUsers(
    this._instance,
    this._then,
  );

  final Query$GetUsers _instance;

  final TRes Function(Query$GetUsers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? users = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetUsers(
        users: users == _undefined || users == null
            ? _instance.users
            : (users as List<Query$GetUsers$users>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes users(
          Iterable<Query$GetUsers$users> Function(
                  Iterable<CopyWith$Query$GetUsers$users<Query$GetUsers$users>>)
              _fn) =>
      call(
          users: _fn(_instance.users.map((e) => CopyWith$Query$GetUsers$users(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetUsers<TRes>
    implements CopyWith$Query$GetUsers<TRes> {
  _CopyWithStubImpl$Query$GetUsers(this._res);

  TRes _res;

  call({
    List<Query$GetUsers$users>? users,
    String? $__typename,
  }) =>
      _res;

  users(_fn) => _res;
}

const documentNodeQueryGetUsers = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetUsers'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'users'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'email'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'role'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$GetUsers _parserFn$Query$GetUsers(Map<String, dynamic> data) =>
    Query$GetUsers.fromJson(data);
typedef OnQueryComplete$Query$GetUsers = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetUsers?,
);

class Options$Query$GetUsers extends graphql.QueryOptions<Query$GetUsers> {
  Options$Query$GetUsers({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUsers? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetUsers? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$GetUsers(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetUsers,
          parserFn: _parserFn$Query$GetUsers,
        );

  final OnQueryComplete$Query$GetUsers? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetUsers
    extends graphql.WatchQueryOptions<Query$GetUsers> {
  WatchOptions$Query$GetUsers({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUsers? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetUsers,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetUsers,
        );
}

class FetchMoreOptions$Query$GetUsers extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetUsers({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetUsers,
        );
}

extension ClientExtension$Query$GetUsers on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetUsers>> query$GetUsers(
          [Options$Query$GetUsers? options]) async =>
      await this.query(options ?? Options$Query$GetUsers());

  graphql.ObservableQuery<Query$GetUsers> watchQuery$GetUsers(
          [WatchOptions$Query$GetUsers? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetUsers());

  void writeQuery$GetUsers({
    required Query$GetUsers data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryGetUsers)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  Query$GetUsers? readQuery$GetUsers({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetUsers)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetUsers.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetUsers> useQuery$GetUsers(
        [Options$Query$GetUsers? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$GetUsers());
graphql.ObservableQuery<Query$GetUsers> useWatchQuery$GetUsers(
        [WatchOptions$Query$GetUsers? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$GetUsers());

class Query$GetUsers$Widget extends graphql_flutter.Query<Query$GetUsers> {
  Query$GetUsers$Widget({
    widgets.Key? key,
    Options$Query$GetUsers? options,
    required graphql_flutter.QueryBuilder<Query$GetUsers> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetUsers(),
          builder: builder,
        );
}

class Query$GetUsers$users {
  Query$GetUsers$users({
    required this.id,
    this.name,
    required this.email,
    required this.role,
    this.$__typename = 'User',
  });

  factory Query$GetUsers$users.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$email = json['email'];
    final l$role = json['role'];
    final l$$__typename = json['__typename'];
    return Query$GetUsers$users(
      id: (l$id as String),
      name: (l$name as String?),
      email: (l$email as String),
      role: fromJson$Enum$UserRole((l$role as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? name;

  final String email;

  final Enum$UserRole role;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$role = role;
    _resultData['role'] = toJson$Enum$UserRole(l$role);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$email = email;
    final l$role = role;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$email,
      l$role,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetUsers$users) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$role = role;
    final lOther$role = other.role;
    if (l$role != lOther$role) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetUsers$users on Query$GetUsers$users {
  CopyWith$Query$GetUsers$users<Query$GetUsers$users> get copyWith =>
      CopyWith$Query$GetUsers$users(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetUsers$users<TRes> {
  factory CopyWith$Query$GetUsers$users(
    Query$GetUsers$users instance,
    TRes Function(Query$GetUsers$users) then,
  ) = _CopyWithImpl$Query$GetUsers$users;

  factory CopyWith$Query$GetUsers$users.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUsers$users;

  TRes call({
    String? id,
    String? name,
    String? email,
    Enum$UserRole? role,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetUsers$users<TRes>
    implements CopyWith$Query$GetUsers$users<TRes> {
  _CopyWithImpl$Query$GetUsers$users(
    this._instance,
    this._then,
  );

  final Query$GetUsers$users _instance;

  final TRes Function(Query$GetUsers$users) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? email = _undefined,
    Object? role = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetUsers$users(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined ? _instance.name : (name as String?),
        email: email == _undefined || email == null
            ? _instance.email
            : (email as String),
        role: role == _undefined || role == null
            ? _instance.role
            : (role as Enum$UserRole),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetUsers$users<TRes>
    implements CopyWith$Query$GetUsers$users<TRes> {
  _CopyWithStubImpl$Query$GetUsers$users(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? email,
    Enum$UserRole? role,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetRecentActivities {
  factory Variables$Query$GetRecentActivities({required String propertyId}) =>
      Variables$Query$GetRecentActivities._({
        r'propertyId': propertyId,
      });

  Variables$Query$GetRecentActivities._(this._$data);

  factory Variables$Query$GetRecentActivities.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$propertyId = data['propertyId'];
    result$data['propertyId'] = (l$propertyId as String);
    return Variables$Query$GetRecentActivities._(result$data);
  }

  Map<String, dynamic> _$data;

  String get propertyId => (_$data['propertyId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$propertyId = propertyId;
    result$data['propertyId'] = l$propertyId;
    return result$data;
  }

  CopyWith$Variables$Query$GetRecentActivities<
          Variables$Query$GetRecentActivities>
      get copyWith => CopyWith$Variables$Query$GetRecentActivities(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetRecentActivities) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$propertyId = propertyId;
    final lOther$propertyId = other.propertyId;
    if (l$propertyId != lOther$propertyId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$propertyId = propertyId;
    return Object.hashAll([l$propertyId]);
  }
}

abstract class CopyWith$Variables$Query$GetRecentActivities<TRes> {
  factory CopyWith$Variables$Query$GetRecentActivities(
    Variables$Query$GetRecentActivities instance,
    TRes Function(Variables$Query$GetRecentActivities) then,
  ) = _CopyWithImpl$Variables$Query$GetRecentActivities;

  factory CopyWith$Variables$Query$GetRecentActivities.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetRecentActivities;

  TRes call({String? propertyId});
}

class _CopyWithImpl$Variables$Query$GetRecentActivities<TRes>
    implements CopyWith$Variables$Query$GetRecentActivities<TRes> {
  _CopyWithImpl$Variables$Query$GetRecentActivities(
    this._instance,
    this._then,
  );

  final Variables$Query$GetRecentActivities _instance;

  final TRes Function(Variables$Query$GetRecentActivities) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? propertyId = _undefined}) =>
      _then(Variables$Query$GetRecentActivities._({
        ..._instance._$data,
        if (propertyId != _undefined && propertyId != null)
          'propertyId': (propertyId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetRecentActivities<TRes>
    implements CopyWith$Variables$Query$GetRecentActivities<TRes> {
  _CopyWithStubImpl$Variables$Query$GetRecentActivities(this._res);

  TRes _res;

  call({String? propertyId}) => _res;
}

class Query$GetRecentActivities {
  Query$GetRecentActivities({
    required this.recentActivities,
    this.$__typename = 'Query',
  });

  factory Query$GetRecentActivities.fromJson(Map<String, dynamic> json) {
    final l$recentActivities = json['recentActivities'];
    final l$$__typename = json['__typename'];
    return Query$GetRecentActivities(
      recentActivities: (l$recentActivities as List<dynamic>)
          .map((e) => Query$GetRecentActivities$recentActivities.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetRecentActivities$recentActivities> recentActivities;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$recentActivities = recentActivities;
    _resultData['recentActivities'] =
        l$recentActivities.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$recentActivities = recentActivities;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$recentActivities.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetRecentActivities) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$recentActivities = recentActivities;
    final lOther$recentActivities = other.recentActivities;
    if (l$recentActivities.length != lOther$recentActivities.length) {
      return false;
    }
    for (int i = 0; i < l$recentActivities.length; i++) {
      final l$recentActivities$entry = l$recentActivities[i];
      final lOther$recentActivities$entry = lOther$recentActivities[i];
      if (l$recentActivities$entry != lOther$recentActivities$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetRecentActivities
    on Query$GetRecentActivities {
  CopyWith$Query$GetRecentActivities<Query$GetRecentActivities> get copyWith =>
      CopyWith$Query$GetRecentActivities(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetRecentActivities<TRes> {
  factory CopyWith$Query$GetRecentActivities(
    Query$GetRecentActivities instance,
    TRes Function(Query$GetRecentActivities) then,
  ) = _CopyWithImpl$Query$GetRecentActivities;

  factory CopyWith$Query$GetRecentActivities.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRecentActivities;

  TRes call({
    List<Query$GetRecentActivities$recentActivities>? recentActivities,
    String? $__typename,
  });
  TRes recentActivities(
      Iterable<Query$GetRecentActivities$recentActivities> Function(
              Iterable<
                  CopyWith$Query$GetRecentActivities$recentActivities<
                      Query$GetRecentActivities$recentActivities>>)
          _fn);
}

class _CopyWithImpl$Query$GetRecentActivities<TRes>
    implements CopyWith$Query$GetRecentActivities<TRes> {
  _CopyWithImpl$Query$GetRecentActivities(
    this._instance,
    this._then,
  );

  final Query$GetRecentActivities _instance;

  final TRes Function(Query$GetRecentActivities) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? recentActivities = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetRecentActivities(
        recentActivities:
            recentActivities == _undefined || recentActivities == null
                ? _instance.recentActivities
                : (recentActivities
                    as List<Query$GetRecentActivities$recentActivities>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes recentActivities(
          Iterable<Query$GetRecentActivities$recentActivities> Function(
                  Iterable<
                      CopyWith$Query$GetRecentActivities$recentActivities<
                          Query$GetRecentActivities$recentActivities>>)
              _fn) =>
      call(
          recentActivities: _fn(_instance.recentActivities
              .map((e) => CopyWith$Query$GetRecentActivities$recentActivities(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetRecentActivities<TRes>
    implements CopyWith$Query$GetRecentActivities<TRes> {
  _CopyWithStubImpl$Query$GetRecentActivities(this._res);

  TRes _res;

  call({
    List<Query$GetRecentActivities$recentActivities>? recentActivities,
    String? $__typename,
  }) =>
      _res;

  recentActivities(_fn) => _res;
}

const documentNodeQueryGetRecentActivities = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetRecentActivities'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'propertyId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'recentActivities'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'propertyId'),
            value: VariableNode(name: NameNode(value: 'propertyId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'propertyId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'tenantId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'staffName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'updatedAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$GetRecentActivities _parserFn$Query$GetRecentActivities(
        Map<String, dynamic> data) =>
    Query$GetRecentActivities.fromJson(data);
typedef OnQueryComplete$Query$GetRecentActivities = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetRecentActivities?,
);

class Options$Query$GetRecentActivities
    extends graphql.QueryOptions<Query$GetRecentActivities> {
  Options$Query$GetRecentActivities({
    String? operationName,
    required Variables$Query$GetRecentActivities variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetRecentActivities? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetRecentActivities? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null
                        ? null
                        : _parserFn$Query$GetRecentActivities(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetRecentActivities,
          parserFn: _parserFn$Query$GetRecentActivities,
        );

  final OnQueryComplete$Query$GetRecentActivities? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetRecentActivities
    extends graphql.WatchQueryOptions<Query$GetRecentActivities> {
  WatchOptions$Query$GetRecentActivities({
    String? operationName,
    required Variables$Query$GetRecentActivities variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetRecentActivities? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetRecentActivities,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetRecentActivities,
        );
}

class FetchMoreOptions$Query$GetRecentActivities
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetRecentActivities({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetRecentActivities variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetRecentActivities,
        );
}

extension ClientExtension$Query$GetRecentActivities on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetRecentActivities>>
      query$GetRecentActivities(
              Options$Query$GetRecentActivities options) async =>
          await this.query(options);

  graphql.ObservableQuery<Query$GetRecentActivities>
      watchQuery$GetRecentActivities(
              WatchOptions$Query$GetRecentActivities options) =>
          this.watchQuery(options);

  void writeQuery$GetRecentActivities({
    required Query$GetRecentActivities data,
    required Variables$Query$GetRecentActivities variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetRecentActivities),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );

  Query$GetRecentActivities? readQuery$GetRecentActivities({
    required Variables$Query$GetRecentActivities variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetRecentActivities),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetRecentActivities.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetRecentActivities>
    useQuery$GetRecentActivities(Options$Query$GetRecentActivities options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetRecentActivities>
    useWatchQuery$GetRecentActivities(
            WatchOptions$Query$GetRecentActivities options) =>
        graphql_flutter.useWatchQuery(options);

class Query$GetRecentActivities$Widget
    extends graphql_flutter.Query<Query$GetRecentActivities> {
  Query$GetRecentActivities$Widget({
    widgets.Key? key,
    required Options$Query$GetRecentActivities options,
    required graphql_flutter.QueryBuilder<Query$GetRecentActivities> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetRecentActivities$recentActivities {
  Query$GetRecentActivities$recentActivities({
    required this.id,
    required this.propertyId,
    required this.tenantId,
    required this.title,
    required this.type,
    required this.staffName,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'RecentActivity',
  });

  factory Query$GetRecentActivities$recentActivities.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$propertyId = json['propertyId'];
    final l$tenantId = json['tenantId'];
    final l$title = json['title'];
    final l$type = json['type'];
    final l$staffName = json['staffName'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Query$GetRecentActivities$recentActivities(
      id: (l$id as String),
      propertyId: (l$propertyId as String),
      tenantId: (l$tenantId as String),
      title: (l$title as String),
      type: (l$type as String),
      staffName: (l$staffName as String),
      createdAt: (l$createdAt as String),
      updatedAt: (l$updatedAt as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String propertyId;

  final String tenantId;

  final String title;

  final String type;

  final String staffName;

  final String createdAt;

  final String updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$propertyId = propertyId;
    _resultData['propertyId'] = l$propertyId;
    final l$tenantId = tenantId;
    _resultData['tenantId'] = l$tenantId;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$type = type;
    _resultData['type'] = l$type;
    final l$staffName = staffName;
    _resultData['staffName'] = l$staffName;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$propertyId = propertyId;
    final l$tenantId = tenantId;
    final l$title = title;
    final l$type = type;
    final l$staffName = staffName;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$propertyId,
      l$tenantId,
      l$title,
      l$type,
      l$staffName,
      l$createdAt,
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetRecentActivities$recentActivities) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$propertyId = propertyId;
    final lOther$propertyId = other.propertyId;
    if (l$propertyId != lOther$propertyId) {
      return false;
    }
    final l$tenantId = tenantId;
    final lOther$tenantId = other.tenantId;
    if (l$tenantId != lOther$tenantId) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$staffName = staffName;
    final lOther$staffName = other.staffName;
    if (l$staffName != lOther$staffName) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetRecentActivities$recentActivities
    on Query$GetRecentActivities$recentActivities {
  CopyWith$Query$GetRecentActivities$recentActivities<
          Query$GetRecentActivities$recentActivities>
      get copyWith => CopyWith$Query$GetRecentActivities$recentActivities(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetRecentActivities$recentActivities<TRes> {
  factory CopyWith$Query$GetRecentActivities$recentActivities(
    Query$GetRecentActivities$recentActivities instance,
    TRes Function(Query$GetRecentActivities$recentActivities) then,
  ) = _CopyWithImpl$Query$GetRecentActivities$recentActivities;

  factory CopyWith$Query$GetRecentActivities$recentActivities.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRecentActivities$recentActivities;

  TRes call({
    String? id,
    String? propertyId,
    String? tenantId,
    String? title,
    String? type,
    String? staffName,
    String? createdAt,
    String? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetRecentActivities$recentActivities<TRes>
    implements CopyWith$Query$GetRecentActivities$recentActivities<TRes> {
  _CopyWithImpl$Query$GetRecentActivities$recentActivities(
    this._instance,
    this._then,
  );

  final Query$GetRecentActivities$recentActivities _instance;

  final TRes Function(Query$GetRecentActivities$recentActivities) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? propertyId = _undefined,
    Object? tenantId = _undefined,
    Object? title = _undefined,
    Object? type = _undefined,
    Object? staffName = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetRecentActivities$recentActivities(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        propertyId: propertyId == _undefined || propertyId == null
            ? _instance.propertyId
            : (propertyId as String),
        tenantId: tenantId == _undefined || tenantId == null
            ? _instance.tenantId
            : (tenantId as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        type: type == _undefined || type == null
            ? _instance.type
            : (type as String),
        staffName: staffName == _undefined || staffName == null
            ? _instance.staffName
            : (staffName as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetRecentActivities$recentActivities<TRes>
    implements CopyWith$Query$GetRecentActivities$recentActivities<TRes> {
  _CopyWithStubImpl$Query$GetRecentActivities$recentActivities(this._res);

  TRes _res;

  call({
    String? id,
    String? propertyId,
    String? tenantId,
    String? title,
    String? type,
    String? staffName,
    String? createdAt,
    String? updatedAt,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$UpdateRoomStatus {
  factory Variables$Mutation$UpdateRoomStatus({
    required String id,
    required Enum$HousekeepingStatus status,
  }) =>
      Variables$Mutation$UpdateRoomStatus._({
        r'id': id,
        r'status': status,
      });

  Variables$Mutation$UpdateRoomStatus._(this._$data);

  factory Variables$Mutation$UpdateRoomStatus.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$status = data['status'];
    result$data['status'] =
        fromJson$Enum$HousekeepingStatus((l$status as String));
    return Variables$Mutation$UpdateRoomStatus._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Enum$HousekeepingStatus get status =>
      (_$data['status'] as Enum$HousekeepingStatus);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$status = status;
    result$data['status'] = toJson$Enum$HousekeepingStatus(l$status);
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateRoomStatus<
          Variables$Mutation$UpdateRoomStatus>
      get copyWith => CopyWith$Variables$Mutation$UpdateRoomStatus(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$UpdateRoomStatus) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    return Object.hashAll([
      l$id,
      l$status,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateRoomStatus<TRes> {
  factory CopyWith$Variables$Mutation$UpdateRoomStatus(
    Variables$Mutation$UpdateRoomStatus instance,
    TRes Function(Variables$Mutation$UpdateRoomStatus) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateRoomStatus;

  factory CopyWith$Variables$Mutation$UpdateRoomStatus.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateRoomStatus;

  TRes call({
    String? id,
    Enum$HousekeepingStatus? status,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateRoomStatus<TRes>
    implements CopyWith$Variables$Mutation$UpdateRoomStatus<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateRoomStatus(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateRoomStatus _instance;

  final TRes Function(Variables$Mutation$UpdateRoomStatus) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
  }) =>
      _then(Variables$Mutation$UpdateRoomStatus._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (status != _undefined && status != null)
          'status': (status as Enum$HousekeepingStatus),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateRoomStatus<TRes>
    implements CopyWith$Variables$Mutation$UpdateRoomStatus<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateRoomStatus(this._res);

  TRes _res;

  call({
    String? id,
    Enum$HousekeepingStatus? status,
  }) =>
      _res;
}

class Mutation$UpdateRoomStatus {
  Mutation$UpdateRoomStatus({
    required this.updateRoomStatus,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateRoomStatus.fromJson(Map<String, dynamic> json) {
    final l$updateRoomStatus = json['updateRoomStatus'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateRoomStatus(
      updateRoomStatus: Mutation$UpdateRoomStatus$updateRoomStatus.fromJson(
          (l$updateRoomStatus as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateRoomStatus$updateRoomStatus updateRoomStatus;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateRoomStatus = updateRoomStatus;
    _resultData['updateRoomStatus'] = l$updateRoomStatus.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateRoomStatus = updateRoomStatus;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateRoomStatus,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateRoomStatus) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateRoomStatus = updateRoomStatus;
    final lOther$updateRoomStatus = other.updateRoomStatus;
    if (l$updateRoomStatus != lOther$updateRoomStatus) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateRoomStatus
    on Mutation$UpdateRoomStatus {
  CopyWith$Mutation$UpdateRoomStatus<Mutation$UpdateRoomStatus> get copyWith =>
      CopyWith$Mutation$UpdateRoomStatus(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateRoomStatus<TRes> {
  factory CopyWith$Mutation$UpdateRoomStatus(
    Mutation$UpdateRoomStatus instance,
    TRes Function(Mutation$UpdateRoomStatus) then,
  ) = _CopyWithImpl$Mutation$UpdateRoomStatus;

  factory CopyWith$Mutation$UpdateRoomStatus.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateRoomStatus;

  TRes call({
    Mutation$UpdateRoomStatus$updateRoomStatus? updateRoomStatus,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateRoomStatus$updateRoomStatus<TRes>
      get updateRoomStatus;
}

class _CopyWithImpl$Mutation$UpdateRoomStatus<TRes>
    implements CopyWith$Mutation$UpdateRoomStatus<TRes> {
  _CopyWithImpl$Mutation$UpdateRoomStatus(
    this._instance,
    this._then,
  );

  final Mutation$UpdateRoomStatus _instance;

  final TRes Function(Mutation$UpdateRoomStatus) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateRoomStatus = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateRoomStatus(
        updateRoomStatus: updateRoomStatus == _undefined ||
                updateRoomStatus == null
            ? _instance.updateRoomStatus
            : (updateRoomStatus as Mutation$UpdateRoomStatus$updateRoomStatus),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdateRoomStatus$updateRoomStatus<TRes>
      get updateRoomStatus {
    final local$updateRoomStatus = _instance.updateRoomStatus;
    return CopyWith$Mutation$UpdateRoomStatus$updateRoomStatus(
        local$updateRoomStatus, (e) => call(updateRoomStatus: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateRoomStatus<TRes>
    implements CopyWith$Mutation$UpdateRoomStatus<TRes> {
  _CopyWithStubImpl$Mutation$UpdateRoomStatus(this._res);

  TRes _res;

  call({
    Mutation$UpdateRoomStatus$updateRoomStatus? updateRoomStatus,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdateRoomStatus$updateRoomStatus<TRes>
      get updateRoomStatus =>
          CopyWith$Mutation$UpdateRoomStatus$updateRoomStatus.stub(_res);
}

const documentNodeMutationUpdateRoomStatus = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateRoomStatus'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'status')),
        type: NamedTypeNode(
          name: NameNode(value: 'HousekeepingStatus'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateRoomStatus'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'status'),
            value: VariableNode(name: NameNode(value: 'status')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'roomNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'housekeepingStatus'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$UpdateRoomStatus _parserFn$Mutation$UpdateRoomStatus(
        Map<String, dynamic> data) =>
    Mutation$UpdateRoomStatus.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateRoomStatus = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$UpdateRoomStatus?,
);

class Options$Mutation$UpdateRoomStatus
    extends graphql.MutationOptions<Mutation$UpdateRoomStatus> {
  Options$Mutation$UpdateRoomStatus({
    String? operationName,
    required Variables$Mutation$UpdateRoomStatus variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateRoomStatus? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateRoomStatus? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateRoomStatus>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$UpdateRoomStatus(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateRoomStatus,
          parserFn: _parserFn$Mutation$UpdateRoomStatus,
        );

  final OnMutationCompleted$Mutation$UpdateRoomStatus? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateRoomStatus
    extends graphql.WatchQueryOptions<Mutation$UpdateRoomStatus> {
  WatchOptions$Mutation$UpdateRoomStatus({
    String? operationName,
    required Variables$Mutation$UpdateRoomStatus variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateRoomStatus? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationUpdateRoomStatus,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateRoomStatus,
        );
}

extension ClientExtension$Mutation$UpdateRoomStatus on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateRoomStatus>>
      mutate$UpdateRoomStatus(
              Options$Mutation$UpdateRoomStatus options) async =>
          await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateRoomStatus>
      watchMutation$UpdateRoomStatus(
              WatchOptions$Mutation$UpdateRoomStatus options) =>
          this.watchMutation(options);
}

class Mutation$UpdateRoomStatus$HookResult {
  Mutation$UpdateRoomStatus$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateRoomStatus runMutation;

  final graphql.QueryResult<Mutation$UpdateRoomStatus> result;
}

Mutation$UpdateRoomStatus$HookResult useMutation$UpdateRoomStatus(
    [WidgetOptions$Mutation$UpdateRoomStatus? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateRoomStatus());
  return Mutation$UpdateRoomStatus$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateRoomStatus>
    useWatchMutation$UpdateRoomStatus(
            WatchOptions$Mutation$UpdateRoomStatus options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateRoomStatus
    extends graphql.MutationOptions<Mutation$UpdateRoomStatus> {
  WidgetOptions$Mutation$UpdateRoomStatus({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateRoomStatus? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateRoomStatus? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateRoomStatus>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$UpdateRoomStatus(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateRoomStatus,
          parserFn: _parserFn$Mutation$UpdateRoomStatus,
        );

  final OnMutationCompleted$Mutation$UpdateRoomStatus? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateRoomStatus
    = graphql.MultiSourceResult<Mutation$UpdateRoomStatus> Function(
  Variables$Mutation$UpdateRoomStatus, {
  Object? optimisticResult,
  Mutation$UpdateRoomStatus? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateRoomStatus = widgets.Widget Function(
  RunMutation$Mutation$UpdateRoomStatus,
  graphql.QueryResult<Mutation$UpdateRoomStatus>?,
);

class Mutation$UpdateRoomStatus$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateRoomStatus> {
  Mutation$UpdateRoomStatus$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateRoomStatus? options,
    required Builder$Mutation$UpdateRoomStatus builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdateRoomStatus(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$UpdateRoomStatus$updateRoomStatus {
  Mutation$UpdateRoomStatus$updateRoomStatus({
    required this.id,
    required this.roomNumber,
    required this.housekeepingStatus,
    required this.status,
    this.$__typename = 'Room',
  });

  factory Mutation$UpdateRoomStatus$updateRoomStatus.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$roomNumber = json['roomNumber'];
    final l$housekeepingStatus = json['housekeepingStatus'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateRoomStatus$updateRoomStatus(
      id: (l$id as String),
      roomNumber: (l$roomNumber as String),
      housekeepingStatus:
          fromJson$Enum$HousekeepingStatus((l$housekeepingStatus as String)),
      status: fromJson$Enum$RoomStatus((l$status as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String roomNumber;

  final Enum$HousekeepingStatus housekeepingStatus;

  final Enum$RoomStatus status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$roomNumber = roomNumber;
    _resultData['roomNumber'] = l$roomNumber;
    final l$housekeepingStatus = housekeepingStatus;
    _resultData['housekeepingStatus'] =
        toJson$Enum$HousekeepingStatus(l$housekeepingStatus);
    final l$status = status;
    _resultData['status'] = toJson$Enum$RoomStatus(l$status);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$roomNumber = roomNumber;
    final l$housekeepingStatus = housekeepingStatus;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$roomNumber,
      l$housekeepingStatus,
      l$status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateRoomStatus$updateRoomStatus) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$roomNumber = roomNumber;
    final lOther$roomNumber = other.roomNumber;
    if (l$roomNumber != lOther$roomNumber) {
      return false;
    }
    final l$housekeepingStatus = housekeepingStatus;
    final lOther$housekeepingStatus = other.housekeepingStatus;
    if (l$housekeepingStatus != lOther$housekeepingStatus) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateRoomStatus$updateRoomStatus
    on Mutation$UpdateRoomStatus$updateRoomStatus {
  CopyWith$Mutation$UpdateRoomStatus$updateRoomStatus<
          Mutation$UpdateRoomStatus$updateRoomStatus>
      get copyWith => CopyWith$Mutation$UpdateRoomStatus$updateRoomStatus(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateRoomStatus$updateRoomStatus<TRes> {
  factory CopyWith$Mutation$UpdateRoomStatus$updateRoomStatus(
    Mutation$UpdateRoomStatus$updateRoomStatus instance,
    TRes Function(Mutation$UpdateRoomStatus$updateRoomStatus) then,
  ) = _CopyWithImpl$Mutation$UpdateRoomStatus$updateRoomStatus;

  factory CopyWith$Mutation$UpdateRoomStatus$updateRoomStatus.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateRoomStatus$updateRoomStatus;

  TRes call({
    String? id,
    String? roomNumber,
    Enum$HousekeepingStatus? housekeepingStatus,
    Enum$RoomStatus? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateRoomStatus$updateRoomStatus<TRes>
    implements CopyWith$Mutation$UpdateRoomStatus$updateRoomStatus<TRes> {
  _CopyWithImpl$Mutation$UpdateRoomStatus$updateRoomStatus(
    this._instance,
    this._then,
  );

  final Mutation$UpdateRoomStatus$updateRoomStatus _instance;

  final TRes Function(Mutation$UpdateRoomStatus$updateRoomStatus) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? roomNumber = _undefined,
    Object? housekeepingStatus = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateRoomStatus$updateRoomStatus(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        roomNumber: roomNumber == _undefined || roomNumber == null
            ? _instance.roomNumber
            : (roomNumber as String),
        housekeepingStatus:
            housekeepingStatus == _undefined || housekeepingStatus == null
                ? _instance.housekeepingStatus
                : (housekeepingStatus as Enum$HousekeepingStatus),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$RoomStatus),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UpdateRoomStatus$updateRoomStatus<TRes>
    implements CopyWith$Mutation$UpdateRoomStatus$updateRoomStatus<TRes> {
  _CopyWithStubImpl$Mutation$UpdateRoomStatus$updateRoomStatus(this._res);

  TRes _res;

  call({
    String? id,
    String? roomNumber,
    Enum$HousekeepingStatus? housekeepingStatus,
    Enum$RoomStatus? status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$UpdateRoom {
  factory Variables$Mutation$UpdateRoom({
    required String id,
    required Input$UpdateRoomInput input,
  }) =>
      Variables$Mutation$UpdateRoom._({
        r'id': id,
        r'input': input,
      });

  Variables$Mutation$UpdateRoom._(this._$data);

  factory Variables$Mutation$UpdateRoom.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$input = data['input'];
    result$data['input'] =
        Input$UpdateRoomInput.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$UpdateRoom._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Input$UpdateRoomInput get input => (_$data['input'] as Input$UpdateRoomInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateRoom<Variables$Mutation$UpdateRoom>
      get copyWith => CopyWith$Variables$Mutation$UpdateRoom(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$UpdateRoom) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$input = input;
    return Object.hashAll([
      l$id,
      l$input,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateRoom<TRes> {
  factory CopyWith$Variables$Mutation$UpdateRoom(
    Variables$Mutation$UpdateRoom instance,
    TRes Function(Variables$Mutation$UpdateRoom) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateRoom;

  factory CopyWith$Variables$Mutation$UpdateRoom.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateRoom;

  TRes call({
    String? id,
    Input$UpdateRoomInput? input,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateRoom<TRes>
    implements CopyWith$Variables$Mutation$UpdateRoom<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateRoom(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateRoom _instance;

  final TRes Function(Variables$Mutation$UpdateRoom) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? input = _undefined,
  }) =>
      _then(Variables$Mutation$UpdateRoom._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (input != _undefined && input != null)
          'input': (input as Input$UpdateRoomInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateRoom<TRes>
    implements CopyWith$Variables$Mutation$UpdateRoom<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateRoom(this._res);

  TRes _res;

  call({
    String? id,
    Input$UpdateRoomInput? input,
  }) =>
      _res;
}

class Mutation$UpdateRoom {
  Mutation$UpdateRoom({
    required this.updateRoom,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateRoom.fromJson(Map<String, dynamic> json) {
    final l$updateRoom = json['updateRoom'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateRoom(
      updateRoom: Mutation$UpdateRoom$updateRoom.fromJson(
          (l$updateRoom as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateRoom$updateRoom updateRoom;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateRoom = updateRoom;
    _resultData['updateRoom'] = l$updateRoom.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateRoom = updateRoom;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateRoom,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateRoom) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateRoom = updateRoom;
    final lOther$updateRoom = other.updateRoom;
    if (l$updateRoom != lOther$updateRoom) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateRoom on Mutation$UpdateRoom {
  CopyWith$Mutation$UpdateRoom<Mutation$UpdateRoom> get copyWith =>
      CopyWith$Mutation$UpdateRoom(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateRoom<TRes> {
  factory CopyWith$Mutation$UpdateRoom(
    Mutation$UpdateRoom instance,
    TRes Function(Mutation$UpdateRoom) then,
  ) = _CopyWithImpl$Mutation$UpdateRoom;

  factory CopyWith$Mutation$UpdateRoom.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateRoom;

  TRes call({
    Mutation$UpdateRoom$updateRoom? updateRoom,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateRoom$updateRoom<TRes> get updateRoom;
}

class _CopyWithImpl$Mutation$UpdateRoom<TRes>
    implements CopyWith$Mutation$UpdateRoom<TRes> {
  _CopyWithImpl$Mutation$UpdateRoom(
    this._instance,
    this._then,
  );

  final Mutation$UpdateRoom _instance;

  final TRes Function(Mutation$UpdateRoom) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateRoom = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateRoom(
        updateRoom: updateRoom == _undefined || updateRoom == null
            ? _instance.updateRoom
            : (updateRoom as Mutation$UpdateRoom$updateRoom),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdateRoom$updateRoom<TRes> get updateRoom {
    final local$updateRoom = _instance.updateRoom;
    return CopyWith$Mutation$UpdateRoom$updateRoom(
        local$updateRoom, (e) => call(updateRoom: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateRoom<TRes>
    implements CopyWith$Mutation$UpdateRoom<TRes> {
  _CopyWithStubImpl$Mutation$UpdateRoom(this._res);

  TRes _res;

  call({
    Mutation$UpdateRoom$updateRoom? updateRoom,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdateRoom$updateRoom<TRes> get updateRoom =>
      CopyWith$Mutation$UpdateRoom$updateRoom.stub(_res);
}

const documentNodeMutationUpdateRoom = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateRoom'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'UpdateRoomInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateRoom'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'roomNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'housekeepingStatus'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'priorityCleaning'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$UpdateRoom _parserFn$Mutation$UpdateRoom(Map<String, dynamic> data) =>
    Mutation$UpdateRoom.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateRoom = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$UpdateRoom?,
);

class Options$Mutation$UpdateRoom
    extends graphql.MutationOptions<Mutation$UpdateRoom> {
  Options$Mutation$UpdateRoom({
    String? operationName,
    required Variables$Mutation$UpdateRoom variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateRoom? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateRoom? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateRoom>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$UpdateRoom(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateRoom,
          parserFn: _parserFn$Mutation$UpdateRoom,
        );

  final OnMutationCompleted$Mutation$UpdateRoom? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateRoom
    extends graphql.WatchQueryOptions<Mutation$UpdateRoom> {
  WatchOptions$Mutation$UpdateRoom({
    String? operationName,
    required Variables$Mutation$UpdateRoom variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateRoom? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationUpdateRoom,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateRoom,
        );
}

extension ClientExtension$Mutation$UpdateRoom on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateRoom>> mutate$UpdateRoom(
          Options$Mutation$UpdateRoom options) async =>
      await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateRoom> watchMutation$UpdateRoom(
          WatchOptions$Mutation$UpdateRoom options) =>
      this.watchMutation(options);
}

class Mutation$UpdateRoom$HookResult {
  Mutation$UpdateRoom$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateRoom runMutation;

  final graphql.QueryResult<Mutation$UpdateRoom> result;
}

Mutation$UpdateRoom$HookResult useMutation$UpdateRoom(
    [WidgetOptions$Mutation$UpdateRoom? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateRoom());
  return Mutation$UpdateRoom$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateRoom> useWatchMutation$UpdateRoom(
        WatchOptions$Mutation$UpdateRoom options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateRoom
    extends graphql.MutationOptions<Mutation$UpdateRoom> {
  WidgetOptions$Mutation$UpdateRoom({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateRoom? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateRoom? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateRoom>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$UpdateRoom(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateRoom,
          parserFn: _parserFn$Mutation$UpdateRoom,
        );

  final OnMutationCompleted$Mutation$UpdateRoom? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateRoom
    = graphql.MultiSourceResult<Mutation$UpdateRoom> Function(
  Variables$Mutation$UpdateRoom, {
  Object? optimisticResult,
  Mutation$UpdateRoom? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateRoom = widgets.Widget Function(
  RunMutation$Mutation$UpdateRoom,
  graphql.QueryResult<Mutation$UpdateRoom>?,
);

class Mutation$UpdateRoom$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateRoom> {
  Mutation$UpdateRoom$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateRoom? options,
    required Builder$Mutation$UpdateRoom builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdateRoom(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$UpdateRoom$updateRoom {
  Mutation$UpdateRoom$updateRoom({
    required this.id,
    required this.roomNumber,
    required this.status,
    required this.housekeepingStatus,
    required this.priorityCleaning,
    this.$__typename = 'Room',
  });

  factory Mutation$UpdateRoom$updateRoom.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$roomNumber = json['roomNumber'];
    final l$status = json['status'];
    final l$housekeepingStatus = json['housekeepingStatus'];
    final l$priorityCleaning = json['priorityCleaning'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateRoom$updateRoom(
      id: (l$id as String),
      roomNumber: (l$roomNumber as String),
      status: fromJson$Enum$RoomStatus((l$status as String)),
      housekeepingStatus:
          fromJson$Enum$HousekeepingStatus((l$housekeepingStatus as String)),
      priorityCleaning: (l$priorityCleaning as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String roomNumber;

  final Enum$RoomStatus status;

  final Enum$HousekeepingStatus housekeepingStatus;

  final bool priorityCleaning;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$roomNumber = roomNumber;
    _resultData['roomNumber'] = l$roomNumber;
    final l$status = status;
    _resultData['status'] = toJson$Enum$RoomStatus(l$status);
    final l$housekeepingStatus = housekeepingStatus;
    _resultData['housekeepingStatus'] =
        toJson$Enum$HousekeepingStatus(l$housekeepingStatus);
    final l$priorityCleaning = priorityCleaning;
    _resultData['priorityCleaning'] = l$priorityCleaning;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$roomNumber = roomNumber;
    final l$status = status;
    final l$housekeepingStatus = housekeepingStatus;
    final l$priorityCleaning = priorityCleaning;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$roomNumber,
      l$status,
      l$housekeepingStatus,
      l$priorityCleaning,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateRoom$updateRoom) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$roomNumber = roomNumber;
    final lOther$roomNumber = other.roomNumber;
    if (l$roomNumber != lOther$roomNumber) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$housekeepingStatus = housekeepingStatus;
    final lOther$housekeepingStatus = other.housekeepingStatus;
    if (l$housekeepingStatus != lOther$housekeepingStatus) {
      return false;
    }
    final l$priorityCleaning = priorityCleaning;
    final lOther$priorityCleaning = other.priorityCleaning;
    if (l$priorityCleaning != lOther$priorityCleaning) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateRoom$updateRoom
    on Mutation$UpdateRoom$updateRoom {
  CopyWith$Mutation$UpdateRoom$updateRoom<Mutation$UpdateRoom$updateRoom>
      get copyWith => CopyWith$Mutation$UpdateRoom$updateRoom(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateRoom$updateRoom<TRes> {
  factory CopyWith$Mutation$UpdateRoom$updateRoom(
    Mutation$UpdateRoom$updateRoom instance,
    TRes Function(Mutation$UpdateRoom$updateRoom) then,
  ) = _CopyWithImpl$Mutation$UpdateRoom$updateRoom;

  factory CopyWith$Mutation$UpdateRoom$updateRoom.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateRoom$updateRoom;

  TRes call({
    String? id,
    String? roomNumber,
    Enum$RoomStatus? status,
    Enum$HousekeepingStatus? housekeepingStatus,
    bool? priorityCleaning,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateRoom$updateRoom<TRes>
    implements CopyWith$Mutation$UpdateRoom$updateRoom<TRes> {
  _CopyWithImpl$Mutation$UpdateRoom$updateRoom(
    this._instance,
    this._then,
  );

  final Mutation$UpdateRoom$updateRoom _instance;

  final TRes Function(Mutation$UpdateRoom$updateRoom) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? roomNumber = _undefined,
    Object? status = _undefined,
    Object? housekeepingStatus = _undefined,
    Object? priorityCleaning = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateRoom$updateRoom(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        roomNumber: roomNumber == _undefined || roomNumber == null
            ? _instance.roomNumber
            : (roomNumber as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$RoomStatus),
        housekeepingStatus:
            housekeepingStatus == _undefined || housekeepingStatus == null
                ? _instance.housekeepingStatus
                : (housekeepingStatus as Enum$HousekeepingStatus),
        priorityCleaning:
            priorityCleaning == _undefined || priorityCleaning == null
                ? _instance.priorityCleaning
                : (priorityCleaning as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UpdateRoom$updateRoom<TRes>
    implements CopyWith$Mutation$UpdateRoom$updateRoom<TRes> {
  _CopyWithStubImpl$Mutation$UpdateRoom$updateRoom(this._res);

  TRes _res;

  call({
    String? id,
    String? roomNumber,
    Enum$RoomStatus? status,
    Enum$HousekeepingStatus? housekeepingStatus,
    bool? priorityCleaning,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetGuests {
  Query$GetGuests({
    required this.guests,
    this.$__typename = 'Query',
  });

  factory Query$GetGuests.fromJson(Map<String, dynamic> json) {
    final l$guests = json['guests'];
    final l$$__typename = json['__typename'];
    return Query$GetGuests(
      guests: (l$guests as List<dynamic>)
          .map((e) =>
              Query$GetGuests$guests.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetGuests$guests> guests;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$guests = guests;
    _resultData['guests'] = l$guests.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$guests = guests;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$guests.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetGuests) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$guests = guests;
    final lOther$guests = other.guests;
    if (l$guests.length != lOther$guests.length) {
      return false;
    }
    for (int i = 0; i < l$guests.length; i++) {
      final l$guests$entry = l$guests[i];
      final lOther$guests$entry = lOther$guests[i];
      if (l$guests$entry != lOther$guests$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetGuests on Query$GetGuests {
  CopyWith$Query$GetGuests<Query$GetGuests> get copyWith =>
      CopyWith$Query$GetGuests(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetGuests<TRes> {
  factory CopyWith$Query$GetGuests(
    Query$GetGuests instance,
    TRes Function(Query$GetGuests) then,
  ) = _CopyWithImpl$Query$GetGuests;

  factory CopyWith$Query$GetGuests.stub(TRes res) =
      _CopyWithStubImpl$Query$GetGuests;

  TRes call({
    List<Query$GetGuests$guests>? guests,
    String? $__typename,
  });
  TRes guests(
      Iterable<Query$GetGuests$guests> Function(
              Iterable<CopyWith$Query$GetGuests$guests<Query$GetGuests$guests>>)
          _fn);
}

class _CopyWithImpl$Query$GetGuests<TRes>
    implements CopyWith$Query$GetGuests<TRes> {
  _CopyWithImpl$Query$GetGuests(
    this._instance,
    this._then,
  );

  final Query$GetGuests _instance;

  final TRes Function(Query$GetGuests) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? guests = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetGuests(
        guests: guests == _undefined || guests == null
            ? _instance.guests
            : (guests as List<Query$GetGuests$guests>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes guests(
          Iterable<Query$GetGuests$guests> Function(
                  Iterable<
                      CopyWith$Query$GetGuests$guests<Query$GetGuests$guests>>)
              _fn) =>
      call(
          guests:
              _fn(_instance.guests.map((e) => CopyWith$Query$GetGuests$guests(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetGuests<TRes>
    implements CopyWith$Query$GetGuests<TRes> {
  _CopyWithStubImpl$Query$GetGuests(this._res);

  TRes _res;

  call({
    List<Query$GetGuests$guests>? guests,
    String? $__typename,
  }) =>
      _res;

  guests(_fn) => _res;
}

const documentNodeQueryGetGuests = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetGuests'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'guests'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'phone'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'email'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$GetGuests _parserFn$Query$GetGuests(Map<String, dynamic> data) =>
    Query$GetGuests.fromJson(data);
typedef OnQueryComplete$Query$GetGuests = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetGuests?,
);

class Options$Query$GetGuests extends graphql.QueryOptions<Query$GetGuests> {
  Options$Query$GetGuests({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetGuests? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetGuests? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$GetGuests(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetGuests,
          parserFn: _parserFn$Query$GetGuests,
        );

  final OnQueryComplete$Query$GetGuests? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetGuests
    extends graphql.WatchQueryOptions<Query$GetGuests> {
  WatchOptions$Query$GetGuests({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetGuests? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetGuests,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetGuests,
        );
}

class FetchMoreOptions$Query$GetGuests extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetGuests({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetGuests,
        );
}

extension ClientExtension$Query$GetGuests on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetGuests>> query$GetGuests(
          [Options$Query$GetGuests? options]) async =>
      await this.query(options ?? Options$Query$GetGuests());

  graphql.ObservableQuery<Query$GetGuests> watchQuery$GetGuests(
          [WatchOptions$Query$GetGuests? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetGuests());

  void writeQuery$GetGuests({
    required Query$GetGuests data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryGetGuests)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  Query$GetGuests? readQuery$GetGuests({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetGuests)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetGuests.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetGuests> useQuery$GetGuests(
        [Options$Query$GetGuests? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$GetGuests());
graphql.ObservableQuery<Query$GetGuests> useWatchQuery$GetGuests(
        [WatchOptions$Query$GetGuests? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$GetGuests());

class Query$GetGuests$Widget extends graphql_flutter.Query<Query$GetGuests> {
  Query$GetGuests$Widget({
    widgets.Key? key,
    Options$Query$GetGuests? options,
    required graphql_flutter.QueryBuilder<Query$GetGuests> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetGuests(),
          builder: builder,
        );
}

class Query$GetGuests$guests {
  Query$GetGuests$guests({
    required this.id,
    required this.name,
    this.phone,
    this.email,
    this.$__typename = 'Guest',
  });

  factory Query$GetGuests$guests.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$phone = json['phone'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Query$GetGuests$guests(
      id: (l$id as String),
      name: (l$name as String),
      phone: (l$phone as String?),
      email: (l$email as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? phone;

  final String? email;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$phone = phone;
    final l$email = email;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$phone,
      l$email,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetGuests$guests) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetGuests$guests on Query$GetGuests$guests {
  CopyWith$Query$GetGuests$guests<Query$GetGuests$guests> get copyWith =>
      CopyWith$Query$GetGuests$guests(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetGuests$guests<TRes> {
  factory CopyWith$Query$GetGuests$guests(
    Query$GetGuests$guests instance,
    TRes Function(Query$GetGuests$guests) then,
  ) = _CopyWithImpl$Query$GetGuests$guests;

  factory CopyWith$Query$GetGuests$guests.stub(TRes res) =
      _CopyWithStubImpl$Query$GetGuests$guests;

  TRes call({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetGuests$guests<TRes>
    implements CopyWith$Query$GetGuests$guests<TRes> {
  _CopyWithImpl$Query$GetGuests$guests(
    this._instance,
    this._then,
  );

  final Query$GetGuests$guests _instance;

  final TRes Function(Query$GetGuests$guests) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? phone = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetGuests$guests(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        email: email == _undefined ? _instance.email : (email as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetGuests$guests<TRes>
    implements CopyWith$Query$GetGuests$guests<TRes> {
  _CopyWithStubImpl$Query$GetGuests$guests(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$CreateGuest {
  factory Variables$Mutation$CreateGuest(
          {required Input$CreateGuestInput input}) =>
      Variables$Mutation$CreateGuest._({
        r'input': input,
      });

  Variables$Mutation$CreateGuest._(this._$data);

  factory Variables$Mutation$CreateGuest.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$CreateGuestInput.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$CreateGuest._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CreateGuestInput get input =>
      (_$data['input'] as Input$CreateGuestInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateGuest<Variables$Mutation$CreateGuest>
      get copyWith => CopyWith$Variables$Mutation$CreateGuest(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$CreateGuest) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateGuest<TRes> {
  factory CopyWith$Variables$Mutation$CreateGuest(
    Variables$Mutation$CreateGuest instance,
    TRes Function(Variables$Mutation$CreateGuest) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateGuest;

  factory CopyWith$Variables$Mutation$CreateGuest.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateGuest;

  TRes call({Input$CreateGuestInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateGuest<TRes>
    implements CopyWith$Variables$Mutation$CreateGuest<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateGuest(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateGuest _instance;

  final TRes Function(Variables$Mutation$CreateGuest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$CreateGuest._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$CreateGuestInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateGuest<TRes>
    implements CopyWith$Variables$Mutation$CreateGuest<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateGuest(this._res);

  TRes _res;

  call({Input$CreateGuestInput? input}) => _res;
}

class Mutation$CreateGuest {
  Mutation$CreateGuest({
    required this.createGuest,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateGuest.fromJson(Map<String, dynamic> json) {
    final l$createGuest = json['createGuest'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateGuest(
      createGuest: Mutation$CreateGuest$createGuest.fromJson(
          (l$createGuest as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateGuest$createGuest createGuest;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createGuest = createGuest;
    _resultData['createGuest'] = l$createGuest.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createGuest = createGuest;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createGuest,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CreateGuest) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createGuest = createGuest;
    final lOther$createGuest = other.createGuest;
    if (l$createGuest != lOther$createGuest) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CreateGuest on Mutation$CreateGuest {
  CopyWith$Mutation$CreateGuest<Mutation$CreateGuest> get copyWith =>
      CopyWith$Mutation$CreateGuest(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateGuest<TRes> {
  factory CopyWith$Mutation$CreateGuest(
    Mutation$CreateGuest instance,
    TRes Function(Mutation$CreateGuest) then,
  ) = _CopyWithImpl$Mutation$CreateGuest;

  factory CopyWith$Mutation$CreateGuest.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateGuest;

  TRes call({
    Mutation$CreateGuest$createGuest? createGuest,
    String? $__typename,
  });
  CopyWith$Mutation$CreateGuest$createGuest<TRes> get createGuest;
}

class _CopyWithImpl$Mutation$CreateGuest<TRes>
    implements CopyWith$Mutation$CreateGuest<TRes> {
  _CopyWithImpl$Mutation$CreateGuest(
    this._instance,
    this._then,
  );

  final Mutation$CreateGuest _instance;

  final TRes Function(Mutation$CreateGuest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createGuest = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateGuest(
        createGuest: createGuest == _undefined || createGuest == null
            ? _instance.createGuest
            : (createGuest as Mutation$CreateGuest$createGuest),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateGuest$createGuest<TRes> get createGuest {
    final local$createGuest = _instance.createGuest;
    return CopyWith$Mutation$CreateGuest$createGuest(
        local$createGuest, (e) => call(createGuest: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateGuest<TRes>
    implements CopyWith$Mutation$CreateGuest<TRes> {
  _CopyWithStubImpl$Mutation$CreateGuest(this._res);

  TRes _res;

  call({
    Mutation$CreateGuest$createGuest? createGuest,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateGuest$createGuest<TRes> get createGuest =>
      CopyWith$Mutation$CreateGuest$createGuest.stub(_res);
}

const documentNodeMutationCreateGuest = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateGuest'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'CreateGuestInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createGuest'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'phone'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'email'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$CreateGuest _parserFn$Mutation$CreateGuest(
        Map<String, dynamic> data) =>
    Mutation$CreateGuest.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateGuest = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CreateGuest?,
);

class Options$Mutation$CreateGuest
    extends graphql.MutationOptions<Mutation$CreateGuest> {
  Options$Mutation$CreateGuest({
    String? operationName,
    required Variables$Mutation$CreateGuest variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateGuest? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateGuest? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateGuest>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$CreateGuest(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateGuest,
          parserFn: _parserFn$Mutation$CreateGuest,
        );

  final OnMutationCompleted$Mutation$CreateGuest? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateGuest
    extends graphql.WatchQueryOptions<Mutation$CreateGuest> {
  WatchOptions$Mutation$CreateGuest({
    String? operationName,
    required Variables$Mutation$CreateGuest variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateGuest? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationCreateGuest,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateGuest,
        );
}

extension ClientExtension$Mutation$CreateGuest on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateGuest>> mutate$CreateGuest(
          Options$Mutation$CreateGuest options) async =>
      await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreateGuest> watchMutation$CreateGuest(
          WatchOptions$Mutation$CreateGuest options) =>
      this.watchMutation(options);
}

class Mutation$CreateGuest$HookResult {
  Mutation$CreateGuest$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CreateGuest runMutation;

  final graphql.QueryResult<Mutation$CreateGuest> result;
}

Mutation$CreateGuest$HookResult useMutation$CreateGuest(
    [WidgetOptions$Mutation$CreateGuest? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CreateGuest());
  return Mutation$CreateGuest$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateGuest> useWatchMutation$CreateGuest(
        WatchOptions$Mutation$CreateGuest options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateGuest
    extends graphql.MutationOptions<Mutation$CreateGuest> {
  WidgetOptions$Mutation$CreateGuest({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateGuest? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateGuest? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateGuest>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$CreateGuest(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateGuest,
          parserFn: _parserFn$Mutation$CreateGuest,
        );

  final OnMutationCompleted$Mutation$CreateGuest? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CreateGuest
    = graphql.MultiSourceResult<Mutation$CreateGuest> Function(
  Variables$Mutation$CreateGuest, {
  Object? optimisticResult,
  Mutation$CreateGuest? typedOptimisticResult,
});
typedef Builder$Mutation$CreateGuest = widgets.Widget Function(
  RunMutation$Mutation$CreateGuest,
  graphql.QueryResult<Mutation$CreateGuest>?,
);

class Mutation$CreateGuest$Widget
    extends graphql_flutter.Mutation<Mutation$CreateGuest> {
  Mutation$CreateGuest$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateGuest? options,
    required Builder$Mutation$CreateGuest builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CreateGuest(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$CreateGuest$createGuest {
  Mutation$CreateGuest$createGuest({
    required this.id,
    required this.name,
    this.phone,
    this.email,
    this.$__typename = 'Guest',
  });

  factory Mutation$CreateGuest$createGuest.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$phone = json['phone'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateGuest$createGuest(
      id: (l$id as String),
      name: (l$name as String),
      phone: (l$phone as String?),
      email: (l$email as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? phone;

  final String? email;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$phone = phone;
    final l$email = email;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$phone,
      l$email,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CreateGuest$createGuest) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CreateGuest$createGuest
    on Mutation$CreateGuest$createGuest {
  CopyWith$Mutation$CreateGuest$createGuest<Mutation$CreateGuest$createGuest>
      get copyWith => CopyWith$Mutation$CreateGuest$createGuest(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateGuest$createGuest<TRes> {
  factory CopyWith$Mutation$CreateGuest$createGuest(
    Mutation$CreateGuest$createGuest instance,
    TRes Function(Mutation$CreateGuest$createGuest) then,
  ) = _CopyWithImpl$Mutation$CreateGuest$createGuest;

  factory CopyWith$Mutation$CreateGuest$createGuest.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateGuest$createGuest;

  TRes call({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateGuest$createGuest<TRes>
    implements CopyWith$Mutation$CreateGuest$createGuest<TRes> {
  _CopyWithImpl$Mutation$CreateGuest$createGuest(
    this._instance,
    this._then,
  );

  final Mutation$CreateGuest$createGuest _instance;

  final TRes Function(Mutation$CreateGuest$createGuest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? phone = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateGuest$createGuest(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        email: email == _undefined ? _instance.email : (email as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreateGuest$createGuest<TRes>
    implements CopyWith$Mutation$CreateGuest$createGuest<TRes> {
  _CopyWithStubImpl$Mutation$CreateGuest$createGuest(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$CreateBooking {
  factory Variables$Mutation$CreateBooking(
          {required Input$CreateBookingInput input}) =>
      Variables$Mutation$CreateBooking._({
        r'input': input,
      });

  Variables$Mutation$CreateBooking._(this._$data);

  factory Variables$Mutation$CreateBooking.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$CreateBookingInput.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$CreateBooking._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CreateBookingInput get input =>
      (_$data['input'] as Input$CreateBookingInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateBooking<Variables$Mutation$CreateBooking>
      get copyWith => CopyWith$Variables$Mutation$CreateBooking(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$CreateBooking) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateBooking<TRes> {
  factory CopyWith$Variables$Mutation$CreateBooking(
    Variables$Mutation$CreateBooking instance,
    TRes Function(Variables$Mutation$CreateBooking) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateBooking;

  factory CopyWith$Variables$Mutation$CreateBooking.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateBooking;

  TRes call({Input$CreateBookingInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateBooking<TRes>
    implements CopyWith$Variables$Mutation$CreateBooking<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateBooking(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateBooking _instance;

  final TRes Function(Variables$Mutation$CreateBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$CreateBooking._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$CreateBookingInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateBooking<TRes>
    implements CopyWith$Variables$Mutation$CreateBooking<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateBooking(this._res);

  TRes _res;

  call({Input$CreateBookingInput? input}) => _res;
}

class Mutation$CreateBooking {
  Mutation$CreateBooking({
    required this.createBooking,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateBooking.fromJson(Map<String, dynamic> json) {
    final l$createBooking = json['createBooking'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateBooking(
      createBooking: Mutation$CreateBooking$createBooking.fromJson(
          (l$createBooking as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateBooking$createBooking createBooking;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createBooking = createBooking;
    _resultData['createBooking'] = l$createBooking.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createBooking = createBooking;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createBooking,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CreateBooking) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createBooking = createBooking;
    final lOther$createBooking = other.createBooking;
    if (l$createBooking != lOther$createBooking) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CreateBooking on Mutation$CreateBooking {
  CopyWith$Mutation$CreateBooking<Mutation$CreateBooking> get copyWith =>
      CopyWith$Mutation$CreateBooking(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateBooking<TRes> {
  factory CopyWith$Mutation$CreateBooking(
    Mutation$CreateBooking instance,
    TRes Function(Mutation$CreateBooking) then,
  ) = _CopyWithImpl$Mutation$CreateBooking;

  factory CopyWith$Mutation$CreateBooking.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateBooking;

  TRes call({
    Mutation$CreateBooking$createBooking? createBooking,
    String? $__typename,
  });
  CopyWith$Mutation$CreateBooking$createBooking<TRes> get createBooking;
}

class _CopyWithImpl$Mutation$CreateBooking<TRes>
    implements CopyWith$Mutation$CreateBooking<TRes> {
  _CopyWithImpl$Mutation$CreateBooking(
    this._instance,
    this._then,
  );

  final Mutation$CreateBooking _instance;

  final TRes Function(Mutation$CreateBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createBooking = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateBooking(
        createBooking: createBooking == _undefined || createBooking == null
            ? _instance.createBooking
            : (createBooking as Mutation$CreateBooking$createBooking),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateBooking$createBooking<TRes> get createBooking {
    final local$createBooking = _instance.createBooking;
    return CopyWith$Mutation$CreateBooking$createBooking(
        local$createBooking, (e) => call(createBooking: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateBooking<TRes>
    implements CopyWith$Mutation$CreateBooking<TRes> {
  _CopyWithStubImpl$Mutation$CreateBooking(this._res);

  TRes _res;

  call({
    Mutation$CreateBooking$createBooking? createBooking,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateBooking$createBooking<TRes> get createBooking =>
      CopyWith$Mutation$CreateBooking$createBooking.stub(_res);
}

const documentNodeMutationCreateBooking = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateBooking'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'CreateBookingInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createBooking'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'guestId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'propertyId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'checkInDate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'checkOutDate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'adults'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'children'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'totalAmount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'notes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'waiveLastDayCharge'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$CreateBooking _parserFn$Mutation$CreateBooking(
        Map<String, dynamic> data) =>
    Mutation$CreateBooking.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateBooking = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CreateBooking?,
);

class Options$Mutation$CreateBooking
    extends graphql.MutationOptions<Mutation$CreateBooking> {
  Options$Mutation$CreateBooking({
    String? operationName,
    required Variables$Mutation$CreateBooking variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateBooking? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateBooking? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateBooking>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$CreateBooking(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateBooking,
          parserFn: _parserFn$Mutation$CreateBooking,
        );

  final OnMutationCompleted$Mutation$CreateBooking? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateBooking
    extends graphql.WatchQueryOptions<Mutation$CreateBooking> {
  WatchOptions$Mutation$CreateBooking({
    String? operationName,
    required Variables$Mutation$CreateBooking variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateBooking? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationCreateBooking,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateBooking,
        );
}

extension ClientExtension$Mutation$CreateBooking on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateBooking>> mutate$CreateBooking(
          Options$Mutation$CreateBooking options) async =>
      await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreateBooking> watchMutation$CreateBooking(
          WatchOptions$Mutation$CreateBooking options) =>
      this.watchMutation(options);
}

class Mutation$CreateBooking$HookResult {
  Mutation$CreateBooking$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CreateBooking runMutation;

  final graphql.QueryResult<Mutation$CreateBooking> result;
}

Mutation$CreateBooking$HookResult useMutation$CreateBooking(
    [WidgetOptions$Mutation$CreateBooking? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CreateBooking());
  return Mutation$CreateBooking$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateBooking> useWatchMutation$CreateBooking(
        WatchOptions$Mutation$CreateBooking options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateBooking
    extends graphql.MutationOptions<Mutation$CreateBooking> {
  WidgetOptions$Mutation$CreateBooking({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateBooking? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateBooking? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateBooking>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$CreateBooking(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateBooking,
          parserFn: _parserFn$Mutation$CreateBooking,
        );

  final OnMutationCompleted$Mutation$CreateBooking? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CreateBooking
    = graphql.MultiSourceResult<Mutation$CreateBooking> Function(
  Variables$Mutation$CreateBooking, {
  Object? optimisticResult,
  Mutation$CreateBooking? typedOptimisticResult,
});
typedef Builder$Mutation$CreateBooking = widgets.Widget Function(
  RunMutation$Mutation$CreateBooking,
  graphql.QueryResult<Mutation$CreateBooking>?,
);

class Mutation$CreateBooking$Widget
    extends graphql_flutter.Mutation<Mutation$CreateBooking> {
  Mutation$CreateBooking$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateBooking? options,
    required Builder$Mutation$CreateBooking builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CreateBooking(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$CreateBooking$createBooking {
  Mutation$CreateBooking$createBooking({
    required this.id,
    required this.guestId,
    required this.propertyId,
    this.status,
    required this.checkInDate,
    required this.checkOutDate,
    this.adults,
    this.children,
    this.totalAmount,
    this.notes,
    this.waiveLastDayCharge,
    this.$__typename = 'Booking',
  });

  factory Mutation$CreateBooking$createBooking.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$guestId = json['guestId'];
    final l$propertyId = json['propertyId'];
    final l$status = json['status'];
    final l$checkInDate = json['checkInDate'];
    final l$checkOutDate = json['checkOutDate'];
    final l$adults = json['adults'];
    final l$children = json['children'];
    final l$totalAmount = json['totalAmount'];
    final l$notes = json['notes'];
    final l$waiveLastDayCharge = json['waiveLastDayCharge'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateBooking$createBooking(
      id: (l$id as String),
      guestId: (l$guestId as String),
      propertyId: (l$propertyId as String),
      status: l$status == null
          ? null
          : fromJson$Enum$BookingStatus((l$status as String)),
      checkInDate: (l$checkInDate as String),
      checkOutDate: (l$checkOutDate as String),
      adults: (l$adults as int?),
      children: (l$children as int?),
      totalAmount: (l$totalAmount as num?)?.toDouble(),
      notes: (l$notes as String?),
      waiveLastDayCharge: (l$waiveLastDayCharge as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String guestId;

  final String propertyId;

  final Enum$BookingStatus? status;

  final String checkInDate;

  final String checkOutDate;

  final int? adults;

  final int? children;

  final double? totalAmount;

  final String? notes;

  final bool? waiveLastDayCharge;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$guestId = guestId;
    _resultData['guestId'] = l$guestId;
    final l$propertyId = propertyId;
    _resultData['propertyId'] = l$propertyId;
    final l$status = status;
    _resultData['status'] =
        l$status == null ? null : toJson$Enum$BookingStatus(l$status);
    final l$checkInDate = checkInDate;
    _resultData['checkInDate'] = l$checkInDate;
    final l$checkOutDate = checkOutDate;
    _resultData['checkOutDate'] = l$checkOutDate;
    final l$adults = adults;
    _resultData['adults'] = l$adults;
    final l$children = children;
    _resultData['children'] = l$children;
    final l$totalAmount = totalAmount;
    _resultData['totalAmount'] = l$totalAmount;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$waiveLastDayCharge = waiveLastDayCharge;
    _resultData['waiveLastDayCharge'] = l$waiveLastDayCharge;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$guestId = guestId;
    final l$propertyId = propertyId;
    final l$status = status;
    final l$checkInDate = checkInDate;
    final l$checkOutDate = checkOutDate;
    final l$adults = adults;
    final l$children = children;
    final l$totalAmount = totalAmount;
    final l$notes = notes;
    final l$waiveLastDayCharge = waiveLastDayCharge;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$guestId,
      l$propertyId,
      l$status,
      l$checkInDate,
      l$checkOutDate,
      l$adults,
      l$children,
      l$totalAmount,
      l$notes,
      l$waiveLastDayCharge,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CreateBooking$createBooking) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$guestId = guestId;
    final lOther$guestId = other.guestId;
    if (l$guestId != lOther$guestId) {
      return false;
    }
    final l$propertyId = propertyId;
    final lOther$propertyId = other.propertyId;
    if (l$propertyId != lOther$propertyId) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$checkInDate = checkInDate;
    final lOther$checkInDate = other.checkInDate;
    if (l$checkInDate != lOther$checkInDate) {
      return false;
    }
    final l$checkOutDate = checkOutDate;
    final lOther$checkOutDate = other.checkOutDate;
    if (l$checkOutDate != lOther$checkOutDate) {
      return false;
    }
    final l$adults = adults;
    final lOther$adults = other.adults;
    if (l$adults != lOther$adults) {
      return false;
    }
    final l$children = children;
    final lOther$children = other.children;
    if (l$children != lOther$children) {
      return false;
    }
    final l$totalAmount = totalAmount;
    final lOther$totalAmount = other.totalAmount;
    if (l$totalAmount != lOther$totalAmount) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$waiveLastDayCharge = waiveLastDayCharge;
    final lOther$waiveLastDayCharge = other.waiveLastDayCharge;
    if (l$waiveLastDayCharge != lOther$waiveLastDayCharge) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CreateBooking$createBooking
    on Mutation$CreateBooking$createBooking {
  CopyWith$Mutation$CreateBooking$createBooking<
          Mutation$CreateBooking$createBooking>
      get copyWith => CopyWith$Mutation$CreateBooking$createBooking(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateBooking$createBooking<TRes> {
  factory CopyWith$Mutation$CreateBooking$createBooking(
    Mutation$CreateBooking$createBooking instance,
    TRes Function(Mutation$CreateBooking$createBooking) then,
  ) = _CopyWithImpl$Mutation$CreateBooking$createBooking;

  factory CopyWith$Mutation$CreateBooking$createBooking.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateBooking$createBooking;

  TRes call({
    String? id,
    String? guestId,
    String? propertyId,
    Enum$BookingStatus? status,
    String? checkInDate,
    String? checkOutDate,
    int? adults,
    int? children,
    double? totalAmount,
    String? notes,
    bool? waiveLastDayCharge,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateBooking$createBooking<TRes>
    implements CopyWith$Mutation$CreateBooking$createBooking<TRes> {
  _CopyWithImpl$Mutation$CreateBooking$createBooking(
    this._instance,
    this._then,
  );

  final Mutation$CreateBooking$createBooking _instance;

  final TRes Function(Mutation$CreateBooking$createBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? guestId = _undefined,
    Object? propertyId = _undefined,
    Object? status = _undefined,
    Object? checkInDate = _undefined,
    Object? checkOutDate = _undefined,
    Object? adults = _undefined,
    Object? children = _undefined,
    Object? totalAmount = _undefined,
    Object? notes = _undefined,
    Object? waiveLastDayCharge = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateBooking$createBooking(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        guestId: guestId == _undefined || guestId == null
            ? _instance.guestId
            : (guestId as String),
        propertyId: propertyId == _undefined || propertyId == null
            ? _instance.propertyId
            : (propertyId as String),
        status: status == _undefined
            ? _instance.status
            : (status as Enum$BookingStatus?),
        checkInDate: checkInDate == _undefined || checkInDate == null
            ? _instance.checkInDate
            : (checkInDate as String),
        checkOutDate: checkOutDate == _undefined || checkOutDate == null
            ? _instance.checkOutDate
            : (checkOutDate as String),
        adults: adults == _undefined ? _instance.adults : (adults as int?),
        children:
            children == _undefined ? _instance.children : (children as int?),
        totalAmount: totalAmount == _undefined
            ? _instance.totalAmount
            : (totalAmount as double?),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        waiveLastDayCharge: waiveLastDayCharge == _undefined
            ? _instance.waiveLastDayCharge
            : (waiveLastDayCharge as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreateBooking$createBooking<TRes>
    implements CopyWith$Mutation$CreateBooking$createBooking<TRes> {
  _CopyWithStubImpl$Mutation$CreateBooking$createBooking(this._res);

  TRes _res;

  call({
    String? id,
    String? guestId,
    String? propertyId,
    Enum$BookingStatus? status,
    String? checkInDate,
    String? checkOutDate,
    int? adults,
    int? children,
    double? totalAmount,
    String? notes,
    bool? waiveLastDayCharge,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$UpdateBooking {
  factory Variables$Mutation$UpdateBooking({
    required String id,
    required Input$UpdateBookingInput input,
  }) =>
      Variables$Mutation$UpdateBooking._({
        r'id': id,
        r'input': input,
      });

  Variables$Mutation$UpdateBooking._(this._$data);

  factory Variables$Mutation$UpdateBooking.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$input = data['input'];
    result$data['input'] =
        Input$UpdateBookingInput.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$UpdateBooking._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Input$UpdateBookingInput get input =>
      (_$data['input'] as Input$UpdateBookingInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateBooking<Variables$Mutation$UpdateBooking>
      get copyWith => CopyWith$Variables$Mutation$UpdateBooking(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$UpdateBooking) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$input = input;
    return Object.hashAll([
      l$id,
      l$input,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateBooking<TRes> {
  factory CopyWith$Variables$Mutation$UpdateBooking(
    Variables$Mutation$UpdateBooking instance,
    TRes Function(Variables$Mutation$UpdateBooking) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateBooking;

  factory CopyWith$Variables$Mutation$UpdateBooking.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateBooking;

  TRes call({
    String? id,
    Input$UpdateBookingInput? input,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateBooking<TRes>
    implements CopyWith$Variables$Mutation$UpdateBooking<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateBooking(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateBooking _instance;

  final TRes Function(Variables$Mutation$UpdateBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? input = _undefined,
  }) =>
      _then(Variables$Mutation$UpdateBooking._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (input != _undefined && input != null)
          'input': (input as Input$UpdateBookingInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateBooking<TRes>
    implements CopyWith$Variables$Mutation$UpdateBooking<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateBooking(this._res);

  TRes _res;

  call({
    String? id,
    Input$UpdateBookingInput? input,
  }) =>
      _res;
}

class Mutation$UpdateBooking {
  Mutation$UpdateBooking({
    required this.updateBooking,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateBooking.fromJson(Map<String, dynamic> json) {
    final l$updateBooking = json['updateBooking'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateBooking(
      updateBooking: Mutation$UpdateBooking$updateBooking.fromJson(
          (l$updateBooking as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateBooking$updateBooking updateBooking;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateBooking = updateBooking;
    _resultData['updateBooking'] = l$updateBooking.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateBooking = updateBooking;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateBooking,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateBooking) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateBooking = updateBooking;
    final lOther$updateBooking = other.updateBooking;
    if (l$updateBooking != lOther$updateBooking) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateBooking on Mutation$UpdateBooking {
  CopyWith$Mutation$UpdateBooking<Mutation$UpdateBooking> get copyWith =>
      CopyWith$Mutation$UpdateBooking(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateBooking<TRes> {
  factory CopyWith$Mutation$UpdateBooking(
    Mutation$UpdateBooking instance,
    TRes Function(Mutation$UpdateBooking) then,
  ) = _CopyWithImpl$Mutation$UpdateBooking;

  factory CopyWith$Mutation$UpdateBooking.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateBooking;

  TRes call({
    Mutation$UpdateBooking$updateBooking? updateBooking,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateBooking$updateBooking<TRes> get updateBooking;
}

class _CopyWithImpl$Mutation$UpdateBooking<TRes>
    implements CopyWith$Mutation$UpdateBooking<TRes> {
  _CopyWithImpl$Mutation$UpdateBooking(
    this._instance,
    this._then,
  );

  final Mutation$UpdateBooking _instance;

  final TRes Function(Mutation$UpdateBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateBooking = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateBooking(
        updateBooking: updateBooking == _undefined || updateBooking == null
            ? _instance.updateBooking
            : (updateBooking as Mutation$UpdateBooking$updateBooking),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdateBooking$updateBooking<TRes> get updateBooking {
    final local$updateBooking = _instance.updateBooking;
    return CopyWith$Mutation$UpdateBooking$updateBooking(
        local$updateBooking, (e) => call(updateBooking: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateBooking<TRes>
    implements CopyWith$Mutation$UpdateBooking<TRes> {
  _CopyWithStubImpl$Mutation$UpdateBooking(this._res);

  TRes _res;

  call({
    Mutation$UpdateBooking$updateBooking? updateBooking,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdateBooking$updateBooking<TRes> get updateBooking =>
      CopyWith$Mutation$UpdateBooking$updateBooking.stub(_res);
}

const documentNodeMutationUpdateBooking = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateBooking'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'UpdateBookingInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateBooking'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'guestId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'propertyId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'checkInDate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'checkOutDate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'adults'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'children'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'totalAmount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'notes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'waiveLastDayCharge'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$UpdateBooking _parserFn$Mutation$UpdateBooking(
        Map<String, dynamic> data) =>
    Mutation$UpdateBooking.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateBooking = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$UpdateBooking?,
);

class Options$Mutation$UpdateBooking
    extends graphql.MutationOptions<Mutation$UpdateBooking> {
  Options$Mutation$UpdateBooking({
    String? operationName,
    required Variables$Mutation$UpdateBooking variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateBooking? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateBooking? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateBooking>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$UpdateBooking(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateBooking,
          parserFn: _parserFn$Mutation$UpdateBooking,
        );

  final OnMutationCompleted$Mutation$UpdateBooking? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateBooking
    extends graphql.WatchQueryOptions<Mutation$UpdateBooking> {
  WatchOptions$Mutation$UpdateBooking({
    String? operationName,
    required Variables$Mutation$UpdateBooking variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateBooking? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationUpdateBooking,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateBooking,
        );
}

extension ClientExtension$Mutation$UpdateBooking on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateBooking>> mutate$UpdateBooking(
          Options$Mutation$UpdateBooking options) async =>
      await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateBooking> watchMutation$UpdateBooking(
          WatchOptions$Mutation$UpdateBooking options) =>
      this.watchMutation(options);
}

class Mutation$UpdateBooking$HookResult {
  Mutation$UpdateBooking$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateBooking runMutation;

  final graphql.QueryResult<Mutation$UpdateBooking> result;
}

Mutation$UpdateBooking$HookResult useMutation$UpdateBooking(
    [WidgetOptions$Mutation$UpdateBooking? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateBooking());
  return Mutation$UpdateBooking$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateBooking> useWatchMutation$UpdateBooking(
        WatchOptions$Mutation$UpdateBooking options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateBooking
    extends graphql.MutationOptions<Mutation$UpdateBooking> {
  WidgetOptions$Mutation$UpdateBooking({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateBooking? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateBooking? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateBooking>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$UpdateBooking(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateBooking,
          parserFn: _parserFn$Mutation$UpdateBooking,
        );

  final OnMutationCompleted$Mutation$UpdateBooking? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateBooking
    = graphql.MultiSourceResult<Mutation$UpdateBooking> Function(
  Variables$Mutation$UpdateBooking, {
  Object? optimisticResult,
  Mutation$UpdateBooking? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateBooking = widgets.Widget Function(
  RunMutation$Mutation$UpdateBooking,
  graphql.QueryResult<Mutation$UpdateBooking>?,
);

class Mutation$UpdateBooking$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateBooking> {
  Mutation$UpdateBooking$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateBooking? options,
    required Builder$Mutation$UpdateBooking builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdateBooking(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$UpdateBooking$updateBooking {
  Mutation$UpdateBooking$updateBooking({
    required this.id,
    required this.guestId,
    required this.propertyId,
    this.status,
    required this.checkInDate,
    required this.checkOutDate,
    this.adults,
    this.children,
    this.totalAmount,
    this.notes,
    this.waiveLastDayCharge,
    this.$__typename = 'Booking',
  });

  factory Mutation$UpdateBooking$updateBooking.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$guestId = json['guestId'];
    final l$propertyId = json['propertyId'];
    final l$status = json['status'];
    final l$checkInDate = json['checkInDate'];
    final l$checkOutDate = json['checkOutDate'];
    final l$adults = json['adults'];
    final l$children = json['children'];
    final l$totalAmount = json['totalAmount'];
    final l$notes = json['notes'];
    final l$waiveLastDayCharge = json['waiveLastDayCharge'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateBooking$updateBooking(
      id: (l$id as String),
      guestId: (l$guestId as String),
      propertyId: (l$propertyId as String),
      status: l$status == null
          ? null
          : fromJson$Enum$BookingStatus((l$status as String)),
      checkInDate: (l$checkInDate as String),
      checkOutDate: (l$checkOutDate as String),
      adults: (l$adults as int?),
      children: (l$children as int?),
      totalAmount: (l$totalAmount as num?)?.toDouble(),
      notes: (l$notes as String?),
      waiveLastDayCharge: (l$waiveLastDayCharge as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String guestId;

  final String propertyId;

  final Enum$BookingStatus? status;

  final String checkInDate;

  final String checkOutDate;

  final int? adults;

  final int? children;

  final double? totalAmount;

  final String? notes;

  final bool? waiveLastDayCharge;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$guestId = guestId;
    _resultData['guestId'] = l$guestId;
    final l$propertyId = propertyId;
    _resultData['propertyId'] = l$propertyId;
    final l$status = status;
    _resultData['status'] =
        l$status == null ? null : toJson$Enum$BookingStatus(l$status);
    final l$checkInDate = checkInDate;
    _resultData['checkInDate'] = l$checkInDate;
    final l$checkOutDate = checkOutDate;
    _resultData['checkOutDate'] = l$checkOutDate;
    final l$adults = adults;
    _resultData['adults'] = l$adults;
    final l$children = children;
    _resultData['children'] = l$children;
    final l$totalAmount = totalAmount;
    _resultData['totalAmount'] = l$totalAmount;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$waiveLastDayCharge = waiveLastDayCharge;
    _resultData['waiveLastDayCharge'] = l$waiveLastDayCharge;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$guestId = guestId;
    final l$propertyId = propertyId;
    final l$status = status;
    final l$checkInDate = checkInDate;
    final l$checkOutDate = checkOutDate;
    final l$adults = adults;
    final l$children = children;
    final l$totalAmount = totalAmount;
    final l$notes = notes;
    final l$waiveLastDayCharge = waiveLastDayCharge;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$guestId,
      l$propertyId,
      l$status,
      l$checkInDate,
      l$checkOutDate,
      l$adults,
      l$children,
      l$totalAmount,
      l$notes,
      l$waiveLastDayCharge,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateBooking$updateBooking) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$guestId = guestId;
    final lOther$guestId = other.guestId;
    if (l$guestId != lOther$guestId) {
      return false;
    }
    final l$propertyId = propertyId;
    final lOther$propertyId = other.propertyId;
    if (l$propertyId != lOther$propertyId) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$checkInDate = checkInDate;
    final lOther$checkInDate = other.checkInDate;
    if (l$checkInDate != lOther$checkInDate) {
      return false;
    }
    final l$checkOutDate = checkOutDate;
    final lOther$checkOutDate = other.checkOutDate;
    if (l$checkOutDate != lOther$checkOutDate) {
      return false;
    }
    final l$adults = adults;
    final lOther$adults = other.adults;
    if (l$adults != lOther$adults) {
      return false;
    }
    final l$children = children;
    final lOther$children = other.children;
    if (l$children != lOther$children) {
      return false;
    }
    final l$totalAmount = totalAmount;
    final lOther$totalAmount = other.totalAmount;
    if (l$totalAmount != lOther$totalAmount) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$waiveLastDayCharge = waiveLastDayCharge;
    final lOther$waiveLastDayCharge = other.waiveLastDayCharge;
    if (l$waiveLastDayCharge != lOther$waiveLastDayCharge) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateBooking$updateBooking
    on Mutation$UpdateBooking$updateBooking {
  CopyWith$Mutation$UpdateBooking$updateBooking<
          Mutation$UpdateBooking$updateBooking>
      get copyWith => CopyWith$Mutation$UpdateBooking$updateBooking(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateBooking$updateBooking<TRes> {
  factory CopyWith$Mutation$UpdateBooking$updateBooking(
    Mutation$UpdateBooking$updateBooking instance,
    TRes Function(Mutation$UpdateBooking$updateBooking) then,
  ) = _CopyWithImpl$Mutation$UpdateBooking$updateBooking;

  factory CopyWith$Mutation$UpdateBooking$updateBooking.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateBooking$updateBooking;

  TRes call({
    String? id,
    String? guestId,
    String? propertyId,
    Enum$BookingStatus? status,
    String? checkInDate,
    String? checkOutDate,
    int? adults,
    int? children,
    double? totalAmount,
    String? notes,
    bool? waiveLastDayCharge,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateBooking$updateBooking<TRes>
    implements CopyWith$Mutation$UpdateBooking$updateBooking<TRes> {
  _CopyWithImpl$Mutation$UpdateBooking$updateBooking(
    this._instance,
    this._then,
  );

  final Mutation$UpdateBooking$updateBooking _instance;

  final TRes Function(Mutation$UpdateBooking$updateBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? guestId = _undefined,
    Object? propertyId = _undefined,
    Object? status = _undefined,
    Object? checkInDate = _undefined,
    Object? checkOutDate = _undefined,
    Object? adults = _undefined,
    Object? children = _undefined,
    Object? totalAmount = _undefined,
    Object? notes = _undefined,
    Object? waiveLastDayCharge = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateBooking$updateBooking(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        guestId: guestId == _undefined || guestId == null
            ? _instance.guestId
            : (guestId as String),
        propertyId: propertyId == _undefined || propertyId == null
            ? _instance.propertyId
            : (propertyId as String),
        status: status == _undefined
            ? _instance.status
            : (status as Enum$BookingStatus?),
        checkInDate: checkInDate == _undefined || checkInDate == null
            ? _instance.checkInDate
            : (checkInDate as String),
        checkOutDate: checkOutDate == _undefined || checkOutDate == null
            ? _instance.checkOutDate
            : (checkOutDate as String),
        adults: adults == _undefined ? _instance.adults : (adults as int?),
        children:
            children == _undefined ? _instance.children : (children as int?),
        totalAmount: totalAmount == _undefined
            ? _instance.totalAmount
            : (totalAmount as double?),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        waiveLastDayCharge: waiveLastDayCharge == _undefined
            ? _instance.waiveLastDayCharge
            : (waiveLastDayCharge as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UpdateBooking$updateBooking<TRes>
    implements CopyWith$Mutation$UpdateBooking$updateBooking<TRes> {
  _CopyWithStubImpl$Mutation$UpdateBooking$updateBooking(this._res);

  TRes _res;

  call({
    String? id,
    String? guestId,
    String? propertyId,
    Enum$BookingStatus? status,
    String? checkInDate,
    String? checkOutDate,
    int? adults,
    int? children,
    double? totalAmount,
    String? notes,
    bool? waiveLastDayCharge,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$CancelBooking {
  factory Variables$Mutation$CancelBooking({required String id}) =>
      Variables$Mutation$CancelBooking._({
        r'id': id,
      });

  Variables$Mutation$CancelBooking._(this._$data);

  factory Variables$Mutation$CancelBooking.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$CancelBooking._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$CancelBooking<Variables$Mutation$CancelBooking>
      get copyWith => CopyWith$Variables$Mutation$CancelBooking(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$CancelBooking) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Mutation$CancelBooking<TRes> {
  factory CopyWith$Variables$Mutation$CancelBooking(
    Variables$Mutation$CancelBooking instance,
    TRes Function(Variables$Mutation$CancelBooking) then,
  ) = _CopyWithImpl$Variables$Mutation$CancelBooking;

  factory CopyWith$Variables$Mutation$CancelBooking.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CancelBooking;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$CancelBooking<TRes>
    implements CopyWith$Variables$Mutation$CancelBooking<TRes> {
  _CopyWithImpl$Variables$Mutation$CancelBooking(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CancelBooking _instance;

  final TRes Function(Variables$Mutation$CancelBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$CancelBooking._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CancelBooking<TRes>
    implements CopyWith$Variables$Mutation$CancelBooking<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CancelBooking(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$CancelBooking {
  Mutation$CancelBooking({
    required this.cancelBooking,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CancelBooking.fromJson(Map<String, dynamic> json) {
    final l$cancelBooking = json['cancelBooking'];
    final l$$__typename = json['__typename'];
    return Mutation$CancelBooking(
      cancelBooking: Mutation$CancelBooking$cancelBooking.fromJson(
          (l$cancelBooking as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CancelBooking$cancelBooking cancelBooking;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cancelBooking = cancelBooking;
    _resultData['cancelBooking'] = l$cancelBooking.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cancelBooking = cancelBooking;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cancelBooking,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CancelBooking) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cancelBooking = cancelBooking;
    final lOther$cancelBooking = other.cancelBooking;
    if (l$cancelBooking != lOther$cancelBooking) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CancelBooking on Mutation$CancelBooking {
  CopyWith$Mutation$CancelBooking<Mutation$CancelBooking> get copyWith =>
      CopyWith$Mutation$CancelBooking(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CancelBooking<TRes> {
  factory CopyWith$Mutation$CancelBooking(
    Mutation$CancelBooking instance,
    TRes Function(Mutation$CancelBooking) then,
  ) = _CopyWithImpl$Mutation$CancelBooking;

  factory CopyWith$Mutation$CancelBooking.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CancelBooking;

  TRes call({
    Mutation$CancelBooking$cancelBooking? cancelBooking,
    String? $__typename,
  });
  CopyWith$Mutation$CancelBooking$cancelBooking<TRes> get cancelBooking;
}

class _CopyWithImpl$Mutation$CancelBooking<TRes>
    implements CopyWith$Mutation$CancelBooking<TRes> {
  _CopyWithImpl$Mutation$CancelBooking(
    this._instance,
    this._then,
  );

  final Mutation$CancelBooking _instance;

  final TRes Function(Mutation$CancelBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? cancelBooking = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CancelBooking(
        cancelBooking: cancelBooking == _undefined || cancelBooking == null
            ? _instance.cancelBooking
            : (cancelBooking as Mutation$CancelBooking$cancelBooking),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CancelBooking$cancelBooking<TRes> get cancelBooking {
    final local$cancelBooking = _instance.cancelBooking;
    return CopyWith$Mutation$CancelBooking$cancelBooking(
        local$cancelBooking, (e) => call(cancelBooking: e));
  }
}

class _CopyWithStubImpl$Mutation$CancelBooking<TRes>
    implements CopyWith$Mutation$CancelBooking<TRes> {
  _CopyWithStubImpl$Mutation$CancelBooking(this._res);

  TRes _res;

  call({
    Mutation$CancelBooking$cancelBooking? cancelBooking,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CancelBooking$cancelBooking<TRes> get cancelBooking =>
      CopyWith$Mutation$CancelBooking$cancelBooking.stub(_res);
}

const documentNodeMutationCancelBooking = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CancelBooking'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'cancelBooking'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$CancelBooking _parserFn$Mutation$CancelBooking(
        Map<String, dynamic> data) =>
    Mutation$CancelBooking.fromJson(data);
typedef OnMutationCompleted$Mutation$CancelBooking = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CancelBooking?,
);

class Options$Mutation$CancelBooking
    extends graphql.MutationOptions<Mutation$CancelBooking> {
  Options$Mutation$CancelBooking({
    String? operationName,
    required Variables$Mutation$CancelBooking variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CancelBooking? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CancelBooking? onCompleted,
    graphql.OnMutationUpdate<Mutation$CancelBooking>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$CancelBooking(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCancelBooking,
          parserFn: _parserFn$Mutation$CancelBooking,
        );

  final OnMutationCompleted$Mutation$CancelBooking? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CancelBooking
    extends graphql.WatchQueryOptions<Mutation$CancelBooking> {
  WatchOptions$Mutation$CancelBooking({
    String? operationName,
    required Variables$Mutation$CancelBooking variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CancelBooking? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationCancelBooking,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CancelBooking,
        );
}

extension ClientExtension$Mutation$CancelBooking on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CancelBooking>> mutate$CancelBooking(
          Options$Mutation$CancelBooking options) async =>
      await this.mutate(options);

  graphql.ObservableQuery<Mutation$CancelBooking> watchMutation$CancelBooking(
          WatchOptions$Mutation$CancelBooking options) =>
      this.watchMutation(options);
}

class Mutation$CancelBooking$HookResult {
  Mutation$CancelBooking$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CancelBooking runMutation;

  final graphql.QueryResult<Mutation$CancelBooking> result;
}

Mutation$CancelBooking$HookResult useMutation$CancelBooking(
    [WidgetOptions$Mutation$CancelBooking? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CancelBooking());
  return Mutation$CancelBooking$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CancelBooking> useWatchMutation$CancelBooking(
        WatchOptions$Mutation$CancelBooking options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CancelBooking
    extends graphql.MutationOptions<Mutation$CancelBooking> {
  WidgetOptions$Mutation$CancelBooking({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CancelBooking? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CancelBooking? onCompleted,
    graphql.OnMutationUpdate<Mutation$CancelBooking>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$CancelBooking(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCancelBooking,
          parserFn: _parserFn$Mutation$CancelBooking,
        );

  final OnMutationCompleted$Mutation$CancelBooking? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CancelBooking
    = graphql.MultiSourceResult<Mutation$CancelBooking> Function(
  Variables$Mutation$CancelBooking, {
  Object? optimisticResult,
  Mutation$CancelBooking? typedOptimisticResult,
});
typedef Builder$Mutation$CancelBooking = widgets.Widget Function(
  RunMutation$Mutation$CancelBooking,
  graphql.QueryResult<Mutation$CancelBooking>?,
);

class Mutation$CancelBooking$Widget
    extends graphql_flutter.Mutation<Mutation$CancelBooking> {
  Mutation$CancelBooking$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CancelBooking? options,
    required Builder$Mutation$CancelBooking builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CancelBooking(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$CancelBooking$cancelBooking {
  Mutation$CancelBooking$cancelBooking({
    required this.id,
    this.status,
    this.$__typename = 'Booking',
  });

  factory Mutation$CancelBooking$cancelBooking.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Mutation$CancelBooking$cancelBooking(
      id: (l$id as String),
      status: l$status == null
          ? null
          : fromJson$Enum$BookingStatus((l$status as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$BookingStatus? status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] =
        l$status == null ? null : toJson$Enum$BookingStatus(l$status);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CancelBooking$cancelBooking) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CancelBooking$cancelBooking
    on Mutation$CancelBooking$cancelBooking {
  CopyWith$Mutation$CancelBooking$cancelBooking<
          Mutation$CancelBooking$cancelBooking>
      get copyWith => CopyWith$Mutation$CancelBooking$cancelBooking(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CancelBooking$cancelBooking<TRes> {
  factory CopyWith$Mutation$CancelBooking$cancelBooking(
    Mutation$CancelBooking$cancelBooking instance,
    TRes Function(Mutation$CancelBooking$cancelBooking) then,
  ) = _CopyWithImpl$Mutation$CancelBooking$cancelBooking;

  factory CopyWith$Mutation$CancelBooking$cancelBooking.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CancelBooking$cancelBooking;

  TRes call({
    String? id,
    Enum$BookingStatus? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CancelBooking$cancelBooking<TRes>
    implements CopyWith$Mutation$CancelBooking$cancelBooking<TRes> {
  _CopyWithImpl$Mutation$CancelBooking$cancelBooking(
    this._instance,
    this._then,
  );

  final Mutation$CancelBooking$cancelBooking _instance;

  final TRes Function(Mutation$CancelBooking$cancelBooking) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CancelBooking$cancelBooking(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        status: status == _undefined
            ? _instance.status
            : (status as Enum$BookingStatus?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CancelBooking$cancelBooking<TRes>
    implements CopyWith$Mutation$CancelBooking$cancelBooking<TRes> {
  _CopyWithStubImpl$Mutation$CancelBooking$cancelBooking(this._res);

  TRes _res;

  call({
    String? id,
    Enum$BookingStatus? status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$CreatePayment {
  factory Variables$Mutation$CreatePayment(
          {required Input$CreatePaymentInput input}) =>
      Variables$Mutation$CreatePayment._({
        r'input': input,
      });

  Variables$Mutation$CreatePayment._(this._$data);

  factory Variables$Mutation$CreatePayment.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$CreatePaymentInput.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$CreatePayment._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CreatePaymentInput get input =>
      (_$data['input'] as Input$CreatePaymentInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreatePayment<Variables$Mutation$CreatePayment>
      get copyWith => CopyWith$Variables$Mutation$CreatePayment(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$CreatePayment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$CreatePayment<TRes> {
  factory CopyWith$Variables$Mutation$CreatePayment(
    Variables$Mutation$CreatePayment instance,
    TRes Function(Variables$Mutation$CreatePayment) then,
  ) = _CopyWithImpl$Variables$Mutation$CreatePayment;

  factory CopyWith$Variables$Mutation$CreatePayment.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreatePayment;

  TRes call({Input$CreatePaymentInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreatePayment<TRes>
    implements CopyWith$Variables$Mutation$CreatePayment<TRes> {
  _CopyWithImpl$Variables$Mutation$CreatePayment(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreatePayment _instance;

  final TRes Function(Variables$Mutation$CreatePayment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$CreatePayment._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$CreatePaymentInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreatePayment<TRes>
    implements CopyWith$Variables$Mutation$CreatePayment<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreatePayment(this._res);

  TRes _res;

  call({Input$CreatePaymentInput? input}) => _res;
}

class Mutation$CreatePayment {
  Mutation$CreatePayment({
    required this.createPayment,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreatePayment.fromJson(Map<String, dynamic> json) {
    final l$createPayment = json['createPayment'];
    final l$$__typename = json['__typename'];
    return Mutation$CreatePayment(
      createPayment: Mutation$CreatePayment$createPayment.fromJson(
          (l$createPayment as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreatePayment$createPayment createPayment;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createPayment = createPayment;
    _resultData['createPayment'] = l$createPayment.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createPayment = createPayment;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createPayment,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CreatePayment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createPayment = createPayment;
    final lOther$createPayment = other.createPayment;
    if (l$createPayment != lOther$createPayment) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CreatePayment on Mutation$CreatePayment {
  CopyWith$Mutation$CreatePayment<Mutation$CreatePayment> get copyWith =>
      CopyWith$Mutation$CreatePayment(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreatePayment<TRes> {
  factory CopyWith$Mutation$CreatePayment(
    Mutation$CreatePayment instance,
    TRes Function(Mutation$CreatePayment) then,
  ) = _CopyWithImpl$Mutation$CreatePayment;

  factory CopyWith$Mutation$CreatePayment.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreatePayment;

  TRes call({
    Mutation$CreatePayment$createPayment? createPayment,
    String? $__typename,
  });
  CopyWith$Mutation$CreatePayment$createPayment<TRes> get createPayment;
}

class _CopyWithImpl$Mutation$CreatePayment<TRes>
    implements CopyWith$Mutation$CreatePayment<TRes> {
  _CopyWithImpl$Mutation$CreatePayment(
    this._instance,
    this._then,
  );

  final Mutation$CreatePayment _instance;

  final TRes Function(Mutation$CreatePayment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createPayment = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreatePayment(
        createPayment: createPayment == _undefined || createPayment == null
            ? _instance.createPayment
            : (createPayment as Mutation$CreatePayment$createPayment),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreatePayment$createPayment<TRes> get createPayment {
    final local$createPayment = _instance.createPayment;
    return CopyWith$Mutation$CreatePayment$createPayment(
        local$createPayment, (e) => call(createPayment: e));
  }
}

class _CopyWithStubImpl$Mutation$CreatePayment<TRes>
    implements CopyWith$Mutation$CreatePayment<TRes> {
  _CopyWithStubImpl$Mutation$CreatePayment(this._res);

  TRes _res;

  call({
    Mutation$CreatePayment$createPayment? createPayment,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreatePayment$createPayment<TRes> get createPayment =>
      CopyWith$Mutation$CreatePayment$createPayment.stub(_res);
}

const documentNodeMutationCreatePayment = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreatePayment'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'CreatePaymentInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createPayment'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'amount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'method'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$CreatePayment _parserFn$Mutation$CreatePayment(
        Map<String, dynamic> data) =>
    Mutation$CreatePayment.fromJson(data);
typedef OnMutationCompleted$Mutation$CreatePayment = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CreatePayment?,
);

class Options$Mutation$CreatePayment
    extends graphql.MutationOptions<Mutation$CreatePayment> {
  Options$Mutation$CreatePayment({
    String? operationName,
    required Variables$Mutation$CreatePayment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreatePayment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreatePayment? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreatePayment>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$CreatePayment(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreatePayment,
          parserFn: _parserFn$Mutation$CreatePayment,
        );

  final OnMutationCompleted$Mutation$CreatePayment? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreatePayment
    extends graphql.WatchQueryOptions<Mutation$CreatePayment> {
  WatchOptions$Mutation$CreatePayment({
    String? operationName,
    required Variables$Mutation$CreatePayment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreatePayment? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationCreatePayment,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreatePayment,
        );
}

extension ClientExtension$Mutation$CreatePayment on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreatePayment>> mutate$CreatePayment(
          Options$Mutation$CreatePayment options) async =>
      await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreatePayment> watchMutation$CreatePayment(
          WatchOptions$Mutation$CreatePayment options) =>
      this.watchMutation(options);
}

class Mutation$CreatePayment$HookResult {
  Mutation$CreatePayment$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CreatePayment runMutation;

  final graphql.QueryResult<Mutation$CreatePayment> result;
}

Mutation$CreatePayment$HookResult useMutation$CreatePayment(
    [WidgetOptions$Mutation$CreatePayment? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CreatePayment());
  return Mutation$CreatePayment$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreatePayment> useWatchMutation$CreatePayment(
        WatchOptions$Mutation$CreatePayment options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreatePayment
    extends graphql.MutationOptions<Mutation$CreatePayment> {
  WidgetOptions$Mutation$CreatePayment({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreatePayment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreatePayment? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreatePayment>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$CreatePayment(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreatePayment,
          parserFn: _parserFn$Mutation$CreatePayment,
        );

  final OnMutationCompleted$Mutation$CreatePayment? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CreatePayment
    = graphql.MultiSourceResult<Mutation$CreatePayment> Function(
  Variables$Mutation$CreatePayment, {
  Object? optimisticResult,
  Mutation$CreatePayment? typedOptimisticResult,
});
typedef Builder$Mutation$CreatePayment = widgets.Widget Function(
  RunMutation$Mutation$CreatePayment,
  graphql.QueryResult<Mutation$CreatePayment>?,
);

class Mutation$CreatePayment$Widget
    extends graphql_flutter.Mutation<Mutation$CreatePayment> {
  Mutation$CreatePayment$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreatePayment? options,
    required Builder$Mutation$CreatePayment builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CreatePayment(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$CreatePayment$createPayment {
  Mutation$CreatePayment$createPayment({
    required this.id,
    required this.amount,
    required this.method,
    this.status,
    this.$__typename = 'Payment',
  });

  factory Mutation$CreatePayment$createPayment.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$amount = json['amount'];
    final l$method = json['method'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Mutation$CreatePayment$createPayment(
      id: (l$id as String),
      amount: (l$amount as num).toDouble(),
      method: (l$method as String),
      status: l$status == null
          ? null
          : fromJson$Enum$PaymentStatus((l$status as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final double amount;

  final String method;

  final Enum$PaymentStatus? status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$amount = amount;
    _resultData['amount'] = l$amount;
    final l$method = method;
    _resultData['method'] = l$method;
    final l$status = status;
    _resultData['status'] =
        l$status == null ? null : toJson$Enum$PaymentStatus(l$status);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$amount = amount;
    final l$method = method;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$amount,
      l$method,
      l$status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CreatePayment$createPayment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$amount = amount;
    final lOther$amount = other.amount;
    if (l$amount != lOther$amount) {
      return false;
    }
    final l$method = method;
    final lOther$method = other.method;
    if (l$method != lOther$method) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CreatePayment$createPayment
    on Mutation$CreatePayment$createPayment {
  CopyWith$Mutation$CreatePayment$createPayment<
          Mutation$CreatePayment$createPayment>
      get copyWith => CopyWith$Mutation$CreatePayment$createPayment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreatePayment$createPayment<TRes> {
  factory CopyWith$Mutation$CreatePayment$createPayment(
    Mutation$CreatePayment$createPayment instance,
    TRes Function(Mutation$CreatePayment$createPayment) then,
  ) = _CopyWithImpl$Mutation$CreatePayment$createPayment;

  factory CopyWith$Mutation$CreatePayment$createPayment.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreatePayment$createPayment;

  TRes call({
    String? id,
    double? amount,
    String? method,
    Enum$PaymentStatus? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreatePayment$createPayment<TRes>
    implements CopyWith$Mutation$CreatePayment$createPayment<TRes> {
  _CopyWithImpl$Mutation$CreatePayment$createPayment(
    this._instance,
    this._then,
  );

  final Mutation$CreatePayment$createPayment _instance;

  final TRes Function(Mutation$CreatePayment$createPayment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? amount = _undefined,
    Object? method = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreatePayment$createPayment(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        amount: amount == _undefined || amount == null
            ? _instance.amount
            : (amount as double),
        method: method == _undefined || method == null
            ? _instance.method
            : (method as String),
        status: status == _undefined
            ? _instance.status
            : (status as Enum$PaymentStatus?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreatePayment$createPayment<TRes>
    implements CopyWith$Mutation$CreatePayment$createPayment<TRes> {
  _CopyWithStubImpl$Mutation$CreatePayment$createPayment(this._res);

  TRes _res;

  call({
    String? id,
    double? amount,
    String? method,
    Enum$PaymentStatus? status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetServices {
  factory Variables$Query$GetServices({required String propertyId}) =>
      Variables$Query$GetServices._({
        r'propertyId': propertyId,
      });

  Variables$Query$GetServices._(this._$data);

  factory Variables$Query$GetServices.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$propertyId = data['propertyId'];
    result$data['propertyId'] = (l$propertyId as String);
    return Variables$Query$GetServices._(result$data);
  }

  Map<String, dynamic> _$data;

  String get propertyId => (_$data['propertyId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$propertyId = propertyId;
    result$data['propertyId'] = l$propertyId;
    return result$data;
  }

  CopyWith$Variables$Query$GetServices<Variables$Query$GetServices>
      get copyWith => CopyWith$Variables$Query$GetServices(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetServices) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$propertyId = propertyId;
    final lOther$propertyId = other.propertyId;
    if (l$propertyId != lOther$propertyId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$propertyId = propertyId;
    return Object.hashAll([l$propertyId]);
  }
}

abstract class CopyWith$Variables$Query$GetServices<TRes> {
  factory CopyWith$Variables$Query$GetServices(
    Variables$Query$GetServices instance,
    TRes Function(Variables$Query$GetServices) then,
  ) = _CopyWithImpl$Variables$Query$GetServices;

  factory CopyWith$Variables$Query$GetServices.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetServices;

  TRes call({String? propertyId});
}

class _CopyWithImpl$Variables$Query$GetServices<TRes>
    implements CopyWith$Variables$Query$GetServices<TRes> {
  _CopyWithImpl$Variables$Query$GetServices(
    this._instance,
    this._then,
  );

  final Variables$Query$GetServices _instance;

  final TRes Function(Variables$Query$GetServices) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? propertyId = _undefined}) =>
      _then(Variables$Query$GetServices._({
        ..._instance._$data,
        if (propertyId != _undefined && propertyId != null)
          'propertyId': (propertyId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetServices<TRes>
    implements CopyWith$Variables$Query$GetServices<TRes> {
  _CopyWithStubImpl$Variables$Query$GetServices(this._res);

  TRes _res;

  call({String? propertyId}) => _res;
}

class Query$GetServices {
  Query$GetServices({
    required this.services,
    this.$__typename = 'Query',
  });

  factory Query$GetServices.fromJson(Map<String, dynamic> json) {
    final l$services = json['services'];
    final l$$__typename = json['__typename'];
    return Query$GetServices(
      services: (l$services as List<dynamic>)
          .map((e) =>
              Query$GetServices$services.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetServices$services> services;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$services = services;
    _resultData['services'] = l$services.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$services = services;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$services.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetServices) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$services = services;
    final lOther$services = other.services;
    if (l$services.length != lOther$services.length) {
      return false;
    }
    for (int i = 0; i < l$services.length; i++) {
      final l$services$entry = l$services[i];
      final lOther$services$entry = lOther$services[i];
      if (l$services$entry != lOther$services$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetServices on Query$GetServices {
  CopyWith$Query$GetServices<Query$GetServices> get copyWith =>
      CopyWith$Query$GetServices(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetServices<TRes> {
  factory CopyWith$Query$GetServices(
    Query$GetServices instance,
    TRes Function(Query$GetServices) then,
  ) = _CopyWithImpl$Query$GetServices;

  factory CopyWith$Query$GetServices.stub(TRes res) =
      _CopyWithStubImpl$Query$GetServices;

  TRes call({
    List<Query$GetServices$services>? services,
    String? $__typename,
  });
  TRes services(
      Iterable<Query$GetServices$services> Function(
              Iterable<
                  CopyWith$Query$GetServices$services<
                      Query$GetServices$services>>)
          _fn);
}

class _CopyWithImpl$Query$GetServices<TRes>
    implements CopyWith$Query$GetServices<TRes> {
  _CopyWithImpl$Query$GetServices(
    this._instance,
    this._then,
  );

  final Query$GetServices _instance;

  final TRes Function(Query$GetServices) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? services = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetServices(
        services: services == _undefined || services == null
            ? _instance.services
            : (services as List<Query$GetServices$services>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes services(
          Iterable<Query$GetServices$services> Function(
                  Iterable<
                      CopyWith$Query$GetServices$services<
                          Query$GetServices$services>>)
              _fn) =>
      call(
          services: _fn(
              _instance.services.map((e) => CopyWith$Query$GetServices$services(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetServices<TRes>
    implements CopyWith$Query$GetServices<TRes> {
  _CopyWithStubImpl$Query$GetServices(this._res);

  TRes _res;

  call({
    List<Query$GetServices$services>? services,
    String? $__typename,
  }) =>
      _res;

  services(_fn) => _res;
}

const documentNodeQueryGetServices = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetServices'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'propertyId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'services'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'propertyId'),
            value: VariableNode(name: NameNode(value: 'propertyId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'price'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'propertyId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'category'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$GetServices _parserFn$Query$GetServices(Map<String, dynamic> data) =>
    Query$GetServices.fromJson(data);
typedef OnQueryComplete$Query$GetServices = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetServices?,
);

class Options$Query$GetServices
    extends graphql.QueryOptions<Query$GetServices> {
  Options$Query$GetServices({
    String? operationName,
    required Variables$Query$GetServices variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetServices? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetServices? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$GetServices(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetServices,
          parserFn: _parserFn$Query$GetServices,
        );

  final OnQueryComplete$Query$GetServices? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetServices
    extends graphql.WatchQueryOptions<Query$GetServices> {
  WatchOptions$Query$GetServices({
    String? operationName,
    required Variables$Query$GetServices variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetServices? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetServices,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetServices,
        );
}

class FetchMoreOptions$Query$GetServices extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetServices({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetServices variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetServices,
        );
}

extension ClientExtension$Query$GetServices on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetServices>> query$GetServices(
          Options$Query$GetServices options) async =>
      await this.query(options);

  graphql.ObservableQuery<Query$GetServices> watchQuery$GetServices(
          WatchOptions$Query$GetServices options) =>
      this.watchQuery(options);

  void writeQuery$GetServices({
    required Query$GetServices data,
    required Variables$Query$GetServices variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetServices),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );

  Query$GetServices? readQuery$GetServices({
    required Variables$Query$GetServices variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetServices),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetServices.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetServices> useQuery$GetServices(
        Options$Query$GetServices options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetServices> useWatchQuery$GetServices(
        WatchOptions$Query$GetServices options) =>
    graphql_flutter.useWatchQuery(options);

class Query$GetServices$Widget
    extends graphql_flutter.Query<Query$GetServices> {
  Query$GetServices$Widget({
    widgets.Key? key,
    required Options$Query$GetServices options,
    required graphql_flutter.QueryBuilder<Query$GetServices> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetServices$services {
  Query$GetServices$services({
    required this.id,
    required this.name,
    required this.price,
    required this.propertyId,
    this.category,
    this.$__typename = 'Service',
  });

  factory Query$GetServices$services.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$price = json['price'];
    final l$propertyId = json['propertyId'];
    final l$category = json['category'];
    final l$$__typename = json['__typename'];
    return Query$GetServices$services(
      id: (l$id as String),
      name: (l$name as String),
      price: (l$price as num).toDouble(),
      propertyId: (l$propertyId as String),
      category: (l$category as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final double price;

  final String propertyId;

  final String? category;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$propertyId = propertyId;
    _resultData['propertyId'] = l$propertyId;
    final l$category = category;
    _resultData['category'] = l$category;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$price = price;
    final l$propertyId = propertyId;
    final l$category = category;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$price,
      l$propertyId,
      l$category,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetServices$services) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) {
      return false;
    }
    final l$propertyId = propertyId;
    final lOther$propertyId = other.propertyId;
    if (l$propertyId != lOther$propertyId) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetServices$services
    on Query$GetServices$services {
  CopyWith$Query$GetServices$services<Query$GetServices$services>
      get copyWith => CopyWith$Query$GetServices$services(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetServices$services<TRes> {
  factory CopyWith$Query$GetServices$services(
    Query$GetServices$services instance,
    TRes Function(Query$GetServices$services) then,
  ) = _CopyWithImpl$Query$GetServices$services;

  factory CopyWith$Query$GetServices$services.stub(TRes res) =
      _CopyWithStubImpl$Query$GetServices$services;

  TRes call({
    String? id,
    String? name,
    double? price,
    String? propertyId,
    String? category,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetServices$services<TRes>
    implements CopyWith$Query$GetServices$services<TRes> {
  _CopyWithImpl$Query$GetServices$services(
    this._instance,
    this._then,
  );

  final Query$GetServices$services _instance;

  final TRes Function(Query$GetServices$services) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? price = _undefined,
    Object? propertyId = _undefined,
    Object? category = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetServices$services(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        price: price == _undefined || price == null
            ? _instance.price
            : (price as double),
        propertyId: propertyId == _undefined || propertyId == null
            ? _instance.propertyId
            : (propertyId as String),
        category:
            category == _undefined ? _instance.category : (category as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetServices$services<TRes>
    implements CopyWith$Query$GetServices$services<TRes> {
  _CopyWithStubImpl$Query$GetServices$services(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    double? price,
    String? propertyId,
    String? category,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$AddBookingRoom {
  factory Variables$Mutation$AddBookingRoom({
    required String bookingId,
    String? roomId,
    required String roomTypeId,
    String? checkInDate,
    String? checkOutDate,
  }) =>
      Variables$Mutation$AddBookingRoom._({
        r'bookingId': bookingId,
        if (roomId != null) r'roomId': roomId,
        r'roomTypeId': roomTypeId,
        if (checkInDate != null) r'checkInDate': checkInDate,
        if (checkOutDate != null) r'checkOutDate': checkOutDate,
      });

  Variables$Mutation$AddBookingRoom._(this._$data);

  factory Variables$Mutation$AddBookingRoom.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$bookingId = data['bookingId'];
    result$data['bookingId'] = (l$bookingId as String);
    if (data.containsKey('roomId')) {
      final l$roomId = data['roomId'];
      result$data['roomId'] = (l$roomId as String?);
    }
    final l$roomTypeId = data['roomTypeId'];
    result$data['roomTypeId'] = (l$roomTypeId as String);
    if (data.containsKey('checkInDate')) {
      final l$checkInDate = data['checkInDate'];
      result$data['checkInDate'] = (l$checkInDate as String?);
    }
    if (data.containsKey('checkOutDate')) {
      final l$checkOutDate = data['checkOutDate'];
      result$data['checkOutDate'] = (l$checkOutDate as String?);
    }
    return Variables$Mutation$AddBookingRoom._(result$data);
  }

  Map<String, dynamic> _$data;

  String get bookingId => (_$data['bookingId'] as String);

  String? get roomId => (_$data['roomId'] as String?);

  String get roomTypeId => (_$data['roomTypeId'] as String);

  String? get checkInDate => (_$data['checkInDate'] as String?);

  String? get checkOutDate => (_$data['checkOutDate'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$bookingId = bookingId;
    result$data['bookingId'] = l$bookingId;
    if (_$data.containsKey('roomId')) {
      final l$roomId = roomId;
      result$data['roomId'] = l$roomId;
    }
    final l$roomTypeId = roomTypeId;
    result$data['roomTypeId'] = l$roomTypeId;
    if (_$data.containsKey('checkInDate')) {
      final l$checkInDate = checkInDate;
      result$data['checkInDate'] = l$checkInDate;
    }
    if (_$data.containsKey('checkOutDate')) {
      final l$checkOutDate = checkOutDate;
      result$data['checkOutDate'] = l$checkOutDate;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$AddBookingRoom<Variables$Mutation$AddBookingRoom>
      get copyWith => CopyWith$Variables$Mutation$AddBookingRoom(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$AddBookingRoom) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$bookingId = bookingId;
    final lOther$bookingId = other.bookingId;
    if (l$bookingId != lOther$bookingId) {
      return false;
    }
    final l$roomId = roomId;
    final lOther$roomId = other.roomId;
    if (_$data.containsKey('roomId') != other._$data.containsKey('roomId')) {
      return false;
    }
    if (l$roomId != lOther$roomId) {
      return false;
    }
    final l$roomTypeId = roomTypeId;
    final lOther$roomTypeId = other.roomTypeId;
    if (l$roomTypeId != lOther$roomTypeId) {
      return false;
    }
    final l$checkInDate = checkInDate;
    final lOther$checkInDate = other.checkInDate;
    if (_$data.containsKey('checkInDate') !=
        other._$data.containsKey('checkInDate')) {
      return false;
    }
    if (l$checkInDate != lOther$checkInDate) {
      return false;
    }
    final l$checkOutDate = checkOutDate;
    final lOther$checkOutDate = other.checkOutDate;
    if (_$data.containsKey('checkOutDate') !=
        other._$data.containsKey('checkOutDate')) {
      return false;
    }
    if (l$checkOutDate != lOther$checkOutDate) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$bookingId = bookingId;
    final l$roomId = roomId;
    final l$roomTypeId = roomTypeId;
    final l$checkInDate = checkInDate;
    final l$checkOutDate = checkOutDate;
    return Object.hashAll([
      l$bookingId,
      _$data.containsKey('roomId') ? l$roomId : const {},
      l$roomTypeId,
      _$data.containsKey('checkInDate') ? l$checkInDate : const {},
      _$data.containsKey('checkOutDate') ? l$checkOutDate : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$AddBookingRoom<TRes> {
  factory CopyWith$Variables$Mutation$AddBookingRoom(
    Variables$Mutation$AddBookingRoom instance,
    TRes Function(Variables$Mutation$AddBookingRoom) then,
  ) = _CopyWithImpl$Variables$Mutation$AddBookingRoom;

  factory CopyWith$Variables$Mutation$AddBookingRoom.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$AddBookingRoom;

  TRes call({
    String? bookingId,
    String? roomId,
    String? roomTypeId,
    String? checkInDate,
    String? checkOutDate,
  });
}

class _CopyWithImpl$Variables$Mutation$AddBookingRoom<TRes>
    implements CopyWith$Variables$Mutation$AddBookingRoom<TRes> {
  _CopyWithImpl$Variables$Mutation$AddBookingRoom(
    this._instance,
    this._then,
  );

  final Variables$Mutation$AddBookingRoom _instance;

  final TRes Function(Variables$Mutation$AddBookingRoom) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? bookingId = _undefined,
    Object? roomId = _undefined,
    Object? roomTypeId = _undefined,
    Object? checkInDate = _undefined,
    Object? checkOutDate = _undefined,
  }) =>
      _then(Variables$Mutation$AddBookingRoom._({
        ..._instance._$data,
        if (bookingId != _undefined && bookingId != null)
          'bookingId': (bookingId as String),
        if (roomId != _undefined) 'roomId': (roomId as String?),
        if (roomTypeId != _undefined && roomTypeId != null)
          'roomTypeId': (roomTypeId as String),
        if (checkInDate != _undefined) 'checkInDate': (checkInDate as String?),
        if (checkOutDate != _undefined)
          'checkOutDate': (checkOutDate as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$AddBookingRoom<TRes>
    implements CopyWith$Variables$Mutation$AddBookingRoom<TRes> {
  _CopyWithStubImpl$Variables$Mutation$AddBookingRoom(this._res);

  TRes _res;

  call({
    String? bookingId,
    String? roomId,
    String? roomTypeId,
    String? checkInDate,
    String? checkOutDate,
  }) =>
      _res;
}

class Mutation$AddBookingRoom {
  Mutation$AddBookingRoom({
    required this.addBookingRoom,
    this.$__typename = 'Mutation',
  });

  factory Mutation$AddBookingRoom.fromJson(Map<String, dynamic> json) {
    final l$addBookingRoom = json['addBookingRoom'];
    final l$$__typename = json['__typename'];
    return Mutation$AddBookingRoom(
      addBookingRoom: Mutation$AddBookingRoom$addBookingRoom.fromJson(
          (l$addBookingRoom as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$AddBookingRoom$addBookingRoom addBookingRoom;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$addBookingRoom = addBookingRoom;
    _resultData['addBookingRoom'] = l$addBookingRoom.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$addBookingRoom = addBookingRoom;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$addBookingRoom,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$AddBookingRoom) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$addBookingRoom = addBookingRoom;
    final lOther$addBookingRoom = other.addBookingRoom;
    if (l$addBookingRoom != lOther$addBookingRoom) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$AddBookingRoom on Mutation$AddBookingRoom {
  CopyWith$Mutation$AddBookingRoom<Mutation$AddBookingRoom> get copyWith =>
      CopyWith$Mutation$AddBookingRoom(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$AddBookingRoom<TRes> {
  factory CopyWith$Mutation$AddBookingRoom(
    Mutation$AddBookingRoom instance,
    TRes Function(Mutation$AddBookingRoom) then,
  ) = _CopyWithImpl$Mutation$AddBookingRoom;

  factory CopyWith$Mutation$AddBookingRoom.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddBookingRoom;

  TRes call({
    Mutation$AddBookingRoom$addBookingRoom? addBookingRoom,
    String? $__typename,
  });
  CopyWith$Mutation$AddBookingRoom$addBookingRoom<TRes> get addBookingRoom;
}

class _CopyWithImpl$Mutation$AddBookingRoom<TRes>
    implements CopyWith$Mutation$AddBookingRoom<TRes> {
  _CopyWithImpl$Mutation$AddBookingRoom(
    this._instance,
    this._then,
  );

  final Mutation$AddBookingRoom _instance;

  final TRes Function(Mutation$AddBookingRoom) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? addBookingRoom = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AddBookingRoom(
        addBookingRoom: addBookingRoom == _undefined || addBookingRoom == null
            ? _instance.addBookingRoom
            : (addBookingRoom as Mutation$AddBookingRoom$addBookingRoom),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$AddBookingRoom$addBookingRoom<TRes> get addBookingRoom {
    final local$addBookingRoom = _instance.addBookingRoom;
    return CopyWith$Mutation$AddBookingRoom$addBookingRoom(
        local$addBookingRoom, (e) => call(addBookingRoom: e));
  }
}

class _CopyWithStubImpl$Mutation$AddBookingRoom<TRes>
    implements CopyWith$Mutation$AddBookingRoom<TRes> {
  _CopyWithStubImpl$Mutation$AddBookingRoom(this._res);

  TRes _res;

  call({
    Mutation$AddBookingRoom$addBookingRoom? addBookingRoom,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$AddBookingRoom$addBookingRoom<TRes> get addBookingRoom =>
      CopyWith$Mutation$AddBookingRoom$addBookingRoom.stub(_res);
}

const documentNodeMutationAddBookingRoom = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'AddBookingRoom'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'bookingId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'roomId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'roomTypeId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'checkInDate')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'checkOutDate')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'addBookingRoom'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'bookingId'),
            value: VariableNode(name: NameNode(value: 'bookingId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'roomId'),
            value: VariableNode(name: NameNode(value: 'roomId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'roomTypeId'),
            value: VariableNode(name: NameNode(value: 'roomTypeId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'checkInDate'),
            value: VariableNode(name: NameNode(value: 'checkInDate')),
          ),
          ArgumentNode(
            name: NameNode(value: 'checkOutDate'),
            value: VariableNode(name: NameNode(value: 'checkOutDate')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'bookingId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'roomTypeId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'roomId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'priceOverride'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'checkInDate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'checkOutDate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$AddBookingRoom _parserFn$Mutation$AddBookingRoom(
        Map<String, dynamic> data) =>
    Mutation$AddBookingRoom.fromJson(data);
typedef OnMutationCompleted$Mutation$AddBookingRoom = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$AddBookingRoom?,
);

class Options$Mutation$AddBookingRoom
    extends graphql.MutationOptions<Mutation$AddBookingRoom> {
  Options$Mutation$AddBookingRoom({
    String? operationName,
    required Variables$Mutation$AddBookingRoom variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddBookingRoom? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddBookingRoom? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddBookingRoom>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$AddBookingRoom(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAddBookingRoom,
          parserFn: _parserFn$Mutation$AddBookingRoom,
        );

  final OnMutationCompleted$Mutation$AddBookingRoom? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$AddBookingRoom
    extends graphql.WatchQueryOptions<Mutation$AddBookingRoom> {
  WatchOptions$Mutation$AddBookingRoom({
    String? operationName,
    required Variables$Mutation$AddBookingRoom variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddBookingRoom? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationAddBookingRoom,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$AddBookingRoom,
        );
}

extension ClientExtension$Mutation$AddBookingRoom on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$AddBookingRoom>> mutate$AddBookingRoom(
          Options$Mutation$AddBookingRoom options) async =>
      await this.mutate(options);

  graphql.ObservableQuery<Mutation$AddBookingRoom> watchMutation$AddBookingRoom(
          WatchOptions$Mutation$AddBookingRoom options) =>
      this.watchMutation(options);
}

class Mutation$AddBookingRoom$HookResult {
  Mutation$AddBookingRoom$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$AddBookingRoom runMutation;

  final graphql.QueryResult<Mutation$AddBookingRoom> result;
}

Mutation$AddBookingRoom$HookResult useMutation$AddBookingRoom(
    [WidgetOptions$Mutation$AddBookingRoom? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$AddBookingRoom());
  return Mutation$AddBookingRoom$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$AddBookingRoom>
    useWatchMutation$AddBookingRoom(
            WatchOptions$Mutation$AddBookingRoom options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$AddBookingRoom
    extends graphql.MutationOptions<Mutation$AddBookingRoom> {
  WidgetOptions$Mutation$AddBookingRoom({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddBookingRoom? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddBookingRoom? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddBookingRoom>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$AddBookingRoom(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAddBookingRoom,
          parserFn: _parserFn$Mutation$AddBookingRoom,
        );

  final OnMutationCompleted$Mutation$AddBookingRoom? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$AddBookingRoom
    = graphql.MultiSourceResult<Mutation$AddBookingRoom> Function(
  Variables$Mutation$AddBookingRoom, {
  Object? optimisticResult,
  Mutation$AddBookingRoom? typedOptimisticResult,
});
typedef Builder$Mutation$AddBookingRoom = widgets.Widget Function(
  RunMutation$Mutation$AddBookingRoom,
  graphql.QueryResult<Mutation$AddBookingRoom>?,
);

class Mutation$AddBookingRoom$Widget
    extends graphql_flutter.Mutation<Mutation$AddBookingRoom> {
  Mutation$AddBookingRoom$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$AddBookingRoom? options,
    required Builder$Mutation$AddBookingRoom builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$AddBookingRoom(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$AddBookingRoom$addBookingRoom {
  Mutation$AddBookingRoom$addBookingRoom({
    required this.id,
    required this.bookingId,
    required this.roomTypeId,
    this.roomId,
    this.priceOverride,
    required this.status,
    this.checkInDate,
    this.checkOutDate,
    this.$__typename = 'BookingRoom',
  });

  factory Mutation$AddBookingRoom$addBookingRoom.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$bookingId = json['bookingId'];
    final l$roomTypeId = json['roomTypeId'];
    final l$roomId = json['roomId'];
    final l$priceOverride = json['priceOverride'];
    final l$status = json['status'];
    final l$checkInDate = json['checkInDate'];
    final l$checkOutDate = json['checkOutDate'];
    final l$$__typename = json['__typename'];
    return Mutation$AddBookingRoom$addBookingRoom(
      id: (l$id as String),
      bookingId: (l$bookingId as String),
      roomTypeId: (l$roomTypeId as String),
      roomId: (l$roomId as String?),
      priceOverride: (l$priceOverride as num?)?.toDouble(),
      status: fromJson$Enum$BookingStatus((l$status as String)),
      checkInDate: (l$checkInDate as String?),
      checkOutDate: (l$checkOutDate as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String bookingId;

  final String roomTypeId;

  final String? roomId;

  final double? priceOverride;

  final Enum$BookingStatus status;

  final String? checkInDate;

  final String? checkOutDate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$bookingId = bookingId;
    _resultData['bookingId'] = l$bookingId;
    final l$roomTypeId = roomTypeId;
    _resultData['roomTypeId'] = l$roomTypeId;
    final l$roomId = roomId;
    _resultData['roomId'] = l$roomId;
    final l$priceOverride = priceOverride;
    _resultData['priceOverride'] = l$priceOverride;
    final l$status = status;
    _resultData['status'] = toJson$Enum$BookingStatus(l$status);
    final l$checkInDate = checkInDate;
    _resultData['checkInDate'] = l$checkInDate;
    final l$checkOutDate = checkOutDate;
    _resultData['checkOutDate'] = l$checkOutDate;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$bookingId = bookingId;
    final l$roomTypeId = roomTypeId;
    final l$roomId = roomId;
    final l$priceOverride = priceOverride;
    final l$status = status;
    final l$checkInDate = checkInDate;
    final l$checkOutDate = checkOutDate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$bookingId,
      l$roomTypeId,
      l$roomId,
      l$priceOverride,
      l$status,
      l$checkInDate,
      l$checkOutDate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$AddBookingRoom$addBookingRoom) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$bookingId = bookingId;
    final lOther$bookingId = other.bookingId;
    if (l$bookingId != lOther$bookingId) {
      return false;
    }
    final l$roomTypeId = roomTypeId;
    final lOther$roomTypeId = other.roomTypeId;
    if (l$roomTypeId != lOther$roomTypeId) {
      return false;
    }
    final l$roomId = roomId;
    final lOther$roomId = other.roomId;
    if (l$roomId != lOther$roomId) {
      return false;
    }
    final l$priceOverride = priceOverride;
    final lOther$priceOverride = other.priceOverride;
    if (l$priceOverride != lOther$priceOverride) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$checkInDate = checkInDate;
    final lOther$checkInDate = other.checkInDate;
    if (l$checkInDate != lOther$checkInDate) {
      return false;
    }
    final l$checkOutDate = checkOutDate;
    final lOther$checkOutDate = other.checkOutDate;
    if (l$checkOutDate != lOther$checkOutDate) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$AddBookingRoom$addBookingRoom
    on Mutation$AddBookingRoom$addBookingRoom {
  CopyWith$Mutation$AddBookingRoom$addBookingRoom<
          Mutation$AddBookingRoom$addBookingRoom>
      get copyWith => CopyWith$Mutation$AddBookingRoom$addBookingRoom(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$AddBookingRoom$addBookingRoom<TRes> {
  factory CopyWith$Mutation$AddBookingRoom$addBookingRoom(
    Mutation$AddBookingRoom$addBookingRoom instance,
    TRes Function(Mutation$AddBookingRoom$addBookingRoom) then,
  ) = _CopyWithImpl$Mutation$AddBookingRoom$addBookingRoom;

  factory CopyWith$Mutation$AddBookingRoom$addBookingRoom.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddBookingRoom$addBookingRoom;

  TRes call({
    String? id,
    String? bookingId,
    String? roomTypeId,
    String? roomId,
    double? priceOverride,
    Enum$BookingStatus? status,
    String? checkInDate,
    String? checkOutDate,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$AddBookingRoom$addBookingRoom<TRes>
    implements CopyWith$Mutation$AddBookingRoom$addBookingRoom<TRes> {
  _CopyWithImpl$Mutation$AddBookingRoom$addBookingRoom(
    this._instance,
    this._then,
  );

  final Mutation$AddBookingRoom$addBookingRoom _instance;

  final TRes Function(Mutation$AddBookingRoom$addBookingRoom) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? bookingId = _undefined,
    Object? roomTypeId = _undefined,
    Object? roomId = _undefined,
    Object? priceOverride = _undefined,
    Object? status = _undefined,
    Object? checkInDate = _undefined,
    Object? checkOutDate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AddBookingRoom$addBookingRoom(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        bookingId: bookingId == _undefined || bookingId == null
            ? _instance.bookingId
            : (bookingId as String),
        roomTypeId: roomTypeId == _undefined || roomTypeId == null
            ? _instance.roomTypeId
            : (roomTypeId as String),
        roomId: roomId == _undefined ? _instance.roomId : (roomId as String?),
        priceOverride: priceOverride == _undefined
            ? _instance.priceOverride
            : (priceOverride as double?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$BookingStatus),
        checkInDate: checkInDate == _undefined
            ? _instance.checkInDate
            : (checkInDate as String?),
        checkOutDate: checkOutDate == _undefined
            ? _instance.checkOutDate
            : (checkOutDate as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$AddBookingRoom$addBookingRoom<TRes>
    implements CopyWith$Mutation$AddBookingRoom$addBookingRoom<TRes> {
  _CopyWithStubImpl$Mutation$AddBookingRoom$addBookingRoom(this._res);

  TRes _res;

  call({
    String? id,
    String? bookingId,
    String? roomTypeId,
    String? roomId,
    double? priceOverride,
    Enum$BookingStatus? status,
    String? checkInDate,
    String? checkOutDate,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$UpdateBookingRoom {
  factory Variables$Mutation$UpdateBookingRoom({
    required String id,
    required Input$UpdateBookingRoomInput input,
  }) =>
      Variables$Mutation$UpdateBookingRoom._({
        r'id': id,
        r'input': input,
      });

  Variables$Mutation$UpdateBookingRoom._(this._$data);

  factory Variables$Mutation$UpdateBookingRoom.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$input = data['input'];
    result$data['input'] = Input$UpdateBookingRoomInput.fromJson(
        (l$input as Map<String, dynamic>));
    return Variables$Mutation$UpdateBookingRoom._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Input$UpdateBookingRoomInput get input =>
      (_$data['input'] as Input$UpdateBookingRoomInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateBookingRoom<
          Variables$Mutation$UpdateBookingRoom>
      get copyWith => CopyWith$Variables$Mutation$UpdateBookingRoom(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$UpdateBookingRoom) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$input = input;
    return Object.hashAll([
      l$id,
      l$input,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateBookingRoom<TRes> {
  factory CopyWith$Variables$Mutation$UpdateBookingRoom(
    Variables$Mutation$UpdateBookingRoom instance,
    TRes Function(Variables$Mutation$UpdateBookingRoom) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateBookingRoom;

  factory CopyWith$Variables$Mutation$UpdateBookingRoom.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateBookingRoom;

  TRes call({
    String? id,
    Input$UpdateBookingRoomInput? input,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateBookingRoom<TRes>
    implements CopyWith$Variables$Mutation$UpdateBookingRoom<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateBookingRoom(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateBookingRoom _instance;

  final TRes Function(Variables$Mutation$UpdateBookingRoom) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? input = _undefined,
  }) =>
      _then(Variables$Mutation$UpdateBookingRoom._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (input != _undefined && input != null)
          'input': (input as Input$UpdateBookingRoomInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateBookingRoom<TRes>
    implements CopyWith$Variables$Mutation$UpdateBookingRoom<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateBookingRoom(this._res);

  TRes _res;

  call({
    String? id,
    Input$UpdateBookingRoomInput? input,
  }) =>
      _res;
}

class Mutation$UpdateBookingRoom {
  Mutation$UpdateBookingRoom({
    required this.updateBookingRoom,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateBookingRoom.fromJson(Map<String, dynamic> json) {
    final l$updateBookingRoom = json['updateBookingRoom'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateBookingRoom(
      updateBookingRoom: Mutation$UpdateBookingRoom$updateBookingRoom.fromJson(
          (l$updateBookingRoom as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateBookingRoom$updateBookingRoom updateBookingRoom;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateBookingRoom = updateBookingRoom;
    _resultData['updateBookingRoom'] = l$updateBookingRoom.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateBookingRoom = updateBookingRoom;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateBookingRoom,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateBookingRoom) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateBookingRoom = updateBookingRoom;
    final lOther$updateBookingRoom = other.updateBookingRoom;
    if (l$updateBookingRoom != lOther$updateBookingRoom) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateBookingRoom
    on Mutation$UpdateBookingRoom {
  CopyWith$Mutation$UpdateBookingRoom<Mutation$UpdateBookingRoom>
      get copyWith => CopyWith$Mutation$UpdateBookingRoom(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateBookingRoom<TRes> {
  factory CopyWith$Mutation$UpdateBookingRoom(
    Mutation$UpdateBookingRoom instance,
    TRes Function(Mutation$UpdateBookingRoom) then,
  ) = _CopyWithImpl$Mutation$UpdateBookingRoom;

  factory CopyWith$Mutation$UpdateBookingRoom.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateBookingRoom;

  TRes call({
    Mutation$UpdateBookingRoom$updateBookingRoom? updateBookingRoom,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateBookingRoom$updateBookingRoom<TRes>
      get updateBookingRoom;
}

class _CopyWithImpl$Mutation$UpdateBookingRoom<TRes>
    implements CopyWith$Mutation$UpdateBookingRoom<TRes> {
  _CopyWithImpl$Mutation$UpdateBookingRoom(
    this._instance,
    this._then,
  );

  final Mutation$UpdateBookingRoom _instance;

  final TRes Function(Mutation$UpdateBookingRoom) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateBookingRoom = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateBookingRoom(
        updateBookingRoom:
            updateBookingRoom == _undefined || updateBookingRoom == null
                ? _instance.updateBookingRoom
                : (updateBookingRoom
                    as Mutation$UpdateBookingRoom$updateBookingRoom),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdateBookingRoom$updateBookingRoom<TRes>
      get updateBookingRoom {
    final local$updateBookingRoom = _instance.updateBookingRoom;
    return CopyWith$Mutation$UpdateBookingRoom$updateBookingRoom(
        local$updateBookingRoom, (e) => call(updateBookingRoom: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateBookingRoom<TRes>
    implements CopyWith$Mutation$UpdateBookingRoom<TRes> {
  _CopyWithStubImpl$Mutation$UpdateBookingRoom(this._res);

  TRes _res;

  call({
    Mutation$UpdateBookingRoom$updateBookingRoom? updateBookingRoom,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdateBookingRoom$updateBookingRoom<TRes>
      get updateBookingRoom =>
          CopyWith$Mutation$UpdateBookingRoom$updateBookingRoom.stub(_res);
}

const documentNodeMutationUpdateBookingRoom = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateBookingRoom'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'UpdateBookingRoomInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateBookingRoom'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'roomId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'roomTypeId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'priceOverride'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'checkInDate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'checkOutDate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$UpdateBookingRoom _parserFn$Mutation$UpdateBookingRoom(
        Map<String, dynamic> data) =>
    Mutation$UpdateBookingRoom.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateBookingRoom = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$UpdateBookingRoom?,
);

class Options$Mutation$UpdateBookingRoom
    extends graphql.MutationOptions<Mutation$UpdateBookingRoom> {
  Options$Mutation$UpdateBookingRoom({
    String? operationName,
    required Variables$Mutation$UpdateBookingRoom variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateBookingRoom? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateBookingRoom? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateBookingRoom>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$UpdateBookingRoom(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateBookingRoom,
          parserFn: _parserFn$Mutation$UpdateBookingRoom,
        );

  final OnMutationCompleted$Mutation$UpdateBookingRoom? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateBookingRoom
    extends graphql.WatchQueryOptions<Mutation$UpdateBookingRoom> {
  WatchOptions$Mutation$UpdateBookingRoom({
    String? operationName,
    required Variables$Mutation$UpdateBookingRoom variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateBookingRoom? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationUpdateBookingRoom,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateBookingRoom,
        );
}

extension ClientExtension$Mutation$UpdateBookingRoom on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateBookingRoom>>
      mutate$UpdateBookingRoom(
              Options$Mutation$UpdateBookingRoom options) async =>
          await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateBookingRoom>
      watchMutation$UpdateBookingRoom(
              WatchOptions$Mutation$UpdateBookingRoom options) =>
          this.watchMutation(options);
}

class Mutation$UpdateBookingRoom$HookResult {
  Mutation$UpdateBookingRoom$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateBookingRoom runMutation;

  final graphql.QueryResult<Mutation$UpdateBookingRoom> result;
}

Mutation$UpdateBookingRoom$HookResult useMutation$UpdateBookingRoom(
    [WidgetOptions$Mutation$UpdateBookingRoom? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateBookingRoom());
  return Mutation$UpdateBookingRoom$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateBookingRoom>
    useWatchMutation$UpdateBookingRoom(
            WatchOptions$Mutation$UpdateBookingRoom options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateBookingRoom
    extends graphql.MutationOptions<Mutation$UpdateBookingRoom> {
  WidgetOptions$Mutation$UpdateBookingRoom({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateBookingRoom? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateBookingRoom? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateBookingRoom>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$UpdateBookingRoom(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateBookingRoom,
          parserFn: _parserFn$Mutation$UpdateBookingRoom,
        );

  final OnMutationCompleted$Mutation$UpdateBookingRoom? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateBookingRoom
    = graphql.MultiSourceResult<Mutation$UpdateBookingRoom> Function(
  Variables$Mutation$UpdateBookingRoom, {
  Object? optimisticResult,
  Mutation$UpdateBookingRoom? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateBookingRoom = widgets.Widget Function(
  RunMutation$Mutation$UpdateBookingRoom,
  graphql.QueryResult<Mutation$UpdateBookingRoom>?,
);

class Mutation$UpdateBookingRoom$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateBookingRoom> {
  Mutation$UpdateBookingRoom$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateBookingRoom? options,
    required Builder$Mutation$UpdateBookingRoom builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdateBookingRoom(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$UpdateBookingRoom$updateBookingRoom {
  Mutation$UpdateBookingRoom$updateBookingRoom({
    required this.id,
    this.roomId,
    required this.roomTypeId,
    this.priceOverride,
    this.checkInDate,
    this.checkOutDate,
    this.$__typename = 'BookingRoom',
  });

  factory Mutation$UpdateBookingRoom$updateBookingRoom.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$roomId = json['roomId'];
    final l$roomTypeId = json['roomTypeId'];
    final l$priceOverride = json['priceOverride'];
    final l$checkInDate = json['checkInDate'];
    final l$checkOutDate = json['checkOutDate'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateBookingRoom$updateBookingRoom(
      id: (l$id as String),
      roomId: (l$roomId as String?),
      roomTypeId: (l$roomTypeId as String),
      priceOverride: (l$priceOverride as num?)?.toDouble(),
      checkInDate: (l$checkInDate as String?),
      checkOutDate: (l$checkOutDate as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? roomId;

  final String roomTypeId;

  final double? priceOverride;

  final String? checkInDate;

  final String? checkOutDate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$roomId = roomId;
    _resultData['roomId'] = l$roomId;
    final l$roomTypeId = roomTypeId;
    _resultData['roomTypeId'] = l$roomTypeId;
    final l$priceOverride = priceOverride;
    _resultData['priceOverride'] = l$priceOverride;
    final l$checkInDate = checkInDate;
    _resultData['checkInDate'] = l$checkInDate;
    final l$checkOutDate = checkOutDate;
    _resultData['checkOutDate'] = l$checkOutDate;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$roomId = roomId;
    final l$roomTypeId = roomTypeId;
    final l$priceOverride = priceOverride;
    final l$checkInDate = checkInDate;
    final l$checkOutDate = checkOutDate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$roomId,
      l$roomTypeId,
      l$priceOverride,
      l$checkInDate,
      l$checkOutDate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateBookingRoom$updateBookingRoom) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$roomId = roomId;
    final lOther$roomId = other.roomId;
    if (l$roomId != lOther$roomId) {
      return false;
    }
    final l$roomTypeId = roomTypeId;
    final lOther$roomTypeId = other.roomTypeId;
    if (l$roomTypeId != lOther$roomTypeId) {
      return false;
    }
    final l$priceOverride = priceOverride;
    final lOther$priceOverride = other.priceOverride;
    if (l$priceOverride != lOther$priceOverride) {
      return false;
    }
    final l$checkInDate = checkInDate;
    final lOther$checkInDate = other.checkInDate;
    if (l$checkInDate != lOther$checkInDate) {
      return false;
    }
    final l$checkOutDate = checkOutDate;
    final lOther$checkOutDate = other.checkOutDate;
    if (l$checkOutDate != lOther$checkOutDate) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateBookingRoom$updateBookingRoom
    on Mutation$UpdateBookingRoom$updateBookingRoom {
  CopyWith$Mutation$UpdateBookingRoom$updateBookingRoom<
          Mutation$UpdateBookingRoom$updateBookingRoom>
      get copyWith => CopyWith$Mutation$UpdateBookingRoom$updateBookingRoom(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateBookingRoom$updateBookingRoom<TRes> {
  factory CopyWith$Mutation$UpdateBookingRoom$updateBookingRoom(
    Mutation$UpdateBookingRoom$updateBookingRoom instance,
    TRes Function(Mutation$UpdateBookingRoom$updateBookingRoom) then,
  ) = _CopyWithImpl$Mutation$UpdateBookingRoom$updateBookingRoom;

  factory CopyWith$Mutation$UpdateBookingRoom$updateBookingRoom.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateBookingRoom$updateBookingRoom;

  TRes call({
    String? id,
    String? roomId,
    String? roomTypeId,
    double? priceOverride,
    String? checkInDate,
    String? checkOutDate,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateBookingRoom$updateBookingRoom<TRes>
    implements CopyWith$Mutation$UpdateBookingRoom$updateBookingRoom<TRes> {
  _CopyWithImpl$Mutation$UpdateBookingRoom$updateBookingRoom(
    this._instance,
    this._then,
  );

  final Mutation$UpdateBookingRoom$updateBookingRoom _instance;

  final TRes Function(Mutation$UpdateBookingRoom$updateBookingRoom) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? roomId = _undefined,
    Object? roomTypeId = _undefined,
    Object? priceOverride = _undefined,
    Object? checkInDate = _undefined,
    Object? checkOutDate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateBookingRoom$updateBookingRoom(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        roomId: roomId == _undefined ? _instance.roomId : (roomId as String?),
        roomTypeId: roomTypeId == _undefined || roomTypeId == null
            ? _instance.roomTypeId
            : (roomTypeId as String),
        priceOverride: priceOverride == _undefined
            ? _instance.priceOverride
            : (priceOverride as double?),
        checkInDate: checkInDate == _undefined
            ? _instance.checkInDate
            : (checkInDate as String?),
        checkOutDate: checkOutDate == _undefined
            ? _instance.checkOutDate
            : (checkOutDate as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UpdateBookingRoom$updateBookingRoom<TRes>
    implements CopyWith$Mutation$UpdateBookingRoom$updateBookingRoom<TRes> {
  _CopyWithStubImpl$Mutation$UpdateBookingRoom$updateBookingRoom(this._res);

  TRes _res;

  call({
    String? id,
    String? roomId,
    String? roomTypeId,
    double? priceOverride,
    String? checkInDate,
    String? checkOutDate,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$DeleteBookingRoom {
  factory Variables$Mutation$DeleteBookingRoom({required String id}) =>
      Variables$Mutation$DeleteBookingRoom._({
        r'id': id,
      });

  Variables$Mutation$DeleteBookingRoom._(this._$data);

  factory Variables$Mutation$DeleteBookingRoom.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$DeleteBookingRoom._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteBookingRoom<
          Variables$Mutation$DeleteBookingRoom>
      get copyWith => CopyWith$Variables$Mutation$DeleteBookingRoom(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$DeleteBookingRoom) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Mutation$DeleteBookingRoom<TRes> {
  factory CopyWith$Variables$Mutation$DeleteBookingRoom(
    Variables$Mutation$DeleteBookingRoom instance,
    TRes Function(Variables$Mutation$DeleteBookingRoom) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteBookingRoom;

  factory CopyWith$Variables$Mutation$DeleteBookingRoom.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteBookingRoom;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$DeleteBookingRoom<TRes>
    implements CopyWith$Variables$Mutation$DeleteBookingRoom<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteBookingRoom(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteBookingRoom _instance;

  final TRes Function(Variables$Mutation$DeleteBookingRoom) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$DeleteBookingRoom._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$DeleteBookingRoom<TRes>
    implements CopyWith$Variables$Mutation$DeleteBookingRoom<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteBookingRoom(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$DeleteBookingRoom {
  Mutation$DeleteBookingRoom({
    required this.deleteBookingRoom,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteBookingRoom.fromJson(Map<String, dynamic> json) {
    final l$deleteBookingRoom = json['deleteBookingRoom'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteBookingRoom(
      deleteBookingRoom: (l$deleteBookingRoom as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool deleteBookingRoom;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteBookingRoom = deleteBookingRoom;
    _resultData['deleteBookingRoom'] = l$deleteBookingRoom;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteBookingRoom = deleteBookingRoom;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleteBookingRoom,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$DeleteBookingRoom) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteBookingRoom = deleteBookingRoom;
    final lOther$deleteBookingRoom = other.deleteBookingRoom;
    if (l$deleteBookingRoom != lOther$deleteBookingRoom) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$DeleteBookingRoom
    on Mutation$DeleteBookingRoom {
  CopyWith$Mutation$DeleteBookingRoom<Mutation$DeleteBookingRoom>
      get copyWith => CopyWith$Mutation$DeleteBookingRoom(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteBookingRoom<TRes> {
  factory CopyWith$Mutation$DeleteBookingRoom(
    Mutation$DeleteBookingRoom instance,
    TRes Function(Mutation$DeleteBookingRoom) then,
  ) = _CopyWithImpl$Mutation$DeleteBookingRoom;

  factory CopyWith$Mutation$DeleteBookingRoom.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteBookingRoom;

  TRes call({
    bool? deleteBookingRoom,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteBookingRoom<TRes>
    implements CopyWith$Mutation$DeleteBookingRoom<TRes> {
  _CopyWithImpl$Mutation$DeleteBookingRoom(
    this._instance,
    this._then,
  );

  final Mutation$DeleteBookingRoom _instance;

  final TRes Function(Mutation$DeleteBookingRoom) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteBookingRoom = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteBookingRoom(
        deleteBookingRoom:
            deleteBookingRoom == _undefined || deleteBookingRoom == null
                ? _instance.deleteBookingRoom
                : (deleteBookingRoom as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeleteBookingRoom<TRes>
    implements CopyWith$Mutation$DeleteBookingRoom<TRes> {
  _CopyWithStubImpl$Mutation$DeleteBookingRoom(this._res);

  TRes _res;

  call({
    bool? deleteBookingRoom,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationDeleteBookingRoom = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteBookingRoom'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'deleteBookingRoom'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$DeleteBookingRoom _parserFn$Mutation$DeleteBookingRoom(
        Map<String, dynamic> data) =>
    Mutation$DeleteBookingRoom.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteBookingRoom = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$DeleteBookingRoom?,
);

class Options$Mutation$DeleteBookingRoom
    extends graphql.MutationOptions<Mutation$DeleteBookingRoom> {
  Options$Mutation$DeleteBookingRoom({
    String? operationName,
    required Variables$Mutation$DeleteBookingRoom variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteBookingRoom? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteBookingRoom? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteBookingRoom>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$DeleteBookingRoom(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteBookingRoom,
          parserFn: _parserFn$Mutation$DeleteBookingRoom,
        );

  final OnMutationCompleted$Mutation$DeleteBookingRoom? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteBookingRoom
    extends graphql.WatchQueryOptions<Mutation$DeleteBookingRoom> {
  WatchOptions$Mutation$DeleteBookingRoom({
    String? operationName,
    required Variables$Mutation$DeleteBookingRoom variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteBookingRoom? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationDeleteBookingRoom,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeleteBookingRoom,
        );
}

extension ClientExtension$Mutation$DeleteBookingRoom on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteBookingRoom>>
      mutate$DeleteBookingRoom(
              Options$Mutation$DeleteBookingRoom options) async =>
          await this.mutate(options);

  graphql.ObservableQuery<Mutation$DeleteBookingRoom>
      watchMutation$DeleteBookingRoom(
              WatchOptions$Mutation$DeleteBookingRoom options) =>
          this.watchMutation(options);
}

class Mutation$DeleteBookingRoom$HookResult {
  Mutation$DeleteBookingRoom$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$DeleteBookingRoom runMutation;

  final graphql.QueryResult<Mutation$DeleteBookingRoom> result;
}

Mutation$DeleteBookingRoom$HookResult useMutation$DeleteBookingRoom(
    [WidgetOptions$Mutation$DeleteBookingRoom? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$DeleteBookingRoom());
  return Mutation$DeleteBookingRoom$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteBookingRoom>
    useWatchMutation$DeleteBookingRoom(
            WatchOptions$Mutation$DeleteBookingRoom options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteBookingRoom
    extends graphql.MutationOptions<Mutation$DeleteBookingRoom> {
  WidgetOptions$Mutation$DeleteBookingRoom({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteBookingRoom? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteBookingRoom? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteBookingRoom>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$DeleteBookingRoom(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteBookingRoom,
          parserFn: _parserFn$Mutation$DeleteBookingRoom,
        );

  final OnMutationCompleted$Mutation$DeleteBookingRoom? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$DeleteBookingRoom
    = graphql.MultiSourceResult<Mutation$DeleteBookingRoom> Function(
  Variables$Mutation$DeleteBookingRoom, {
  Object? optimisticResult,
  Mutation$DeleteBookingRoom? typedOptimisticResult,
});
typedef Builder$Mutation$DeleteBookingRoom = widgets.Widget Function(
  RunMutation$Mutation$DeleteBookingRoom,
  graphql.QueryResult<Mutation$DeleteBookingRoom>?,
);

class Mutation$DeleteBookingRoom$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteBookingRoom> {
  Mutation$DeleteBookingRoom$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteBookingRoom? options,
    required Builder$Mutation$DeleteBookingRoom builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$DeleteBookingRoom(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Variables$Mutation$AddBookingService {
  factory Variables$Mutation$AddBookingService({
    required String bookingId,
    required String serviceId,
    required int quantity,
    required double totalPrice,
  }) =>
      Variables$Mutation$AddBookingService._({
        r'bookingId': bookingId,
        r'serviceId': serviceId,
        r'quantity': quantity,
        r'totalPrice': totalPrice,
      });

  Variables$Mutation$AddBookingService._(this._$data);

  factory Variables$Mutation$AddBookingService.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$bookingId = data['bookingId'];
    result$data['bookingId'] = (l$bookingId as String);
    final l$serviceId = data['serviceId'];
    result$data['serviceId'] = (l$serviceId as String);
    final l$quantity = data['quantity'];
    result$data['quantity'] = (l$quantity as int);
    final l$totalPrice = data['totalPrice'];
    result$data['totalPrice'] = (l$totalPrice as num).toDouble();
    return Variables$Mutation$AddBookingService._(result$data);
  }

  Map<String, dynamic> _$data;

  String get bookingId => (_$data['bookingId'] as String);

  String get serviceId => (_$data['serviceId'] as String);

  int get quantity => (_$data['quantity'] as int);

  double get totalPrice => (_$data['totalPrice'] as double);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$bookingId = bookingId;
    result$data['bookingId'] = l$bookingId;
    final l$serviceId = serviceId;
    result$data['serviceId'] = l$serviceId;
    final l$quantity = quantity;
    result$data['quantity'] = l$quantity;
    final l$totalPrice = totalPrice;
    result$data['totalPrice'] = l$totalPrice;
    return result$data;
  }

  CopyWith$Variables$Mutation$AddBookingService<
          Variables$Mutation$AddBookingService>
      get copyWith => CopyWith$Variables$Mutation$AddBookingService(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$AddBookingService) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$bookingId = bookingId;
    final lOther$bookingId = other.bookingId;
    if (l$bookingId != lOther$bookingId) {
      return false;
    }
    final l$serviceId = serviceId;
    final lOther$serviceId = other.serviceId;
    if (l$serviceId != lOther$serviceId) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) {
      return false;
    }
    final l$totalPrice = totalPrice;
    final lOther$totalPrice = other.totalPrice;
    if (l$totalPrice != lOther$totalPrice) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$bookingId = bookingId;
    final l$serviceId = serviceId;
    final l$quantity = quantity;
    final l$totalPrice = totalPrice;
    return Object.hashAll([
      l$bookingId,
      l$serviceId,
      l$quantity,
      l$totalPrice,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$AddBookingService<TRes> {
  factory CopyWith$Variables$Mutation$AddBookingService(
    Variables$Mutation$AddBookingService instance,
    TRes Function(Variables$Mutation$AddBookingService) then,
  ) = _CopyWithImpl$Variables$Mutation$AddBookingService;

  factory CopyWith$Variables$Mutation$AddBookingService.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$AddBookingService;

  TRes call({
    String? bookingId,
    String? serviceId,
    int? quantity,
    double? totalPrice,
  });
}

class _CopyWithImpl$Variables$Mutation$AddBookingService<TRes>
    implements CopyWith$Variables$Mutation$AddBookingService<TRes> {
  _CopyWithImpl$Variables$Mutation$AddBookingService(
    this._instance,
    this._then,
  );

  final Variables$Mutation$AddBookingService _instance;

  final TRes Function(Variables$Mutation$AddBookingService) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? bookingId = _undefined,
    Object? serviceId = _undefined,
    Object? quantity = _undefined,
    Object? totalPrice = _undefined,
  }) =>
      _then(Variables$Mutation$AddBookingService._({
        ..._instance._$data,
        if (bookingId != _undefined && bookingId != null)
          'bookingId': (bookingId as String),
        if (serviceId != _undefined && serviceId != null)
          'serviceId': (serviceId as String),
        if (quantity != _undefined && quantity != null)
          'quantity': (quantity as int),
        if (totalPrice != _undefined && totalPrice != null)
          'totalPrice': (totalPrice as double),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$AddBookingService<TRes>
    implements CopyWith$Variables$Mutation$AddBookingService<TRes> {
  _CopyWithStubImpl$Variables$Mutation$AddBookingService(this._res);

  TRes _res;

  call({
    String? bookingId,
    String? serviceId,
    int? quantity,
    double? totalPrice,
  }) =>
      _res;
}

class Mutation$AddBookingService {
  Mutation$AddBookingService({
    required this.addBookingService,
    this.$__typename = 'Mutation',
  });

  factory Mutation$AddBookingService.fromJson(Map<String, dynamic> json) {
    final l$addBookingService = json['addBookingService'];
    final l$$__typename = json['__typename'];
    return Mutation$AddBookingService(
      addBookingService: Mutation$AddBookingService$addBookingService.fromJson(
          (l$addBookingService as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$AddBookingService$addBookingService addBookingService;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$addBookingService = addBookingService;
    _resultData['addBookingService'] = l$addBookingService.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$addBookingService = addBookingService;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$addBookingService,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$AddBookingService) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$addBookingService = addBookingService;
    final lOther$addBookingService = other.addBookingService;
    if (l$addBookingService != lOther$addBookingService) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$AddBookingService
    on Mutation$AddBookingService {
  CopyWith$Mutation$AddBookingService<Mutation$AddBookingService>
      get copyWith => CopyWith$Mutation$AddBookingService(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$AddBookingService<TRes> {
  factory CopyWith$Mutation$AddBookingService(
    Mutation$AddBookingService instance,
    TRes Function(Mutation$AddBookingService) then,
  ) = _CopyWithImpl$Mutation$AddBookingService;

  factory CopyWith$Mutation$AddBookingService.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddBookingService;

  TRes call({
    Mutation$AddBookingService$addBookingService? addBookingService,
    String? $__typename,
  });
  CopyWith$Mutation$AddBookingService$addBookingService<TRes>
      get addBookingService;
}

class _CopyWithImpl$Mutation$AddBookingService<TRes>
    implements CopyWith$Mutation$AddBookingService<TRes> {
  _CopyWithImpl$Mutation$AddBookingService(
    this._instance,
    this._then,
  );

  final Mutation$AddBookingService _instance;

  final TRes Function(Mutation$AddBookingService) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? addBookingService = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AddBookingService(
        addBookingService:
            addBookingService == _undefined || addBookingService == null
                ? _instance.addBookingService
                : (addBookingService
                    as Mutation$AddBookingService$addBookingService),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$AddBookingService$addBookingService<TRes>
      get addBookingService {
    final local$addBookingService = _instance.addBookingService;
    return CopyWith$Mutation$AddBookingService$addBookingService(
        local$addBookingService, (e) => call(addBookingService: e));
  }
}

class _CopyWithStubImpl$Mutation$AddBookingService<TRes>
    implements CopyWith$Mutation$AddBookingService<TRes> {
  _CopyWithStubImpl$Mutation$AddBookingService(this._res);

  TRes _res;

  call({
    Mutation$AddBookingService$addBookingService? addBookingService,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$AddBookingService$addBookingService<TRes>
      get addBookingService =>
          CopyWith$Mutation$AddBookingService$addBookingService.stub(_res);
}

const documentNodeMutationAddBookingService = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'AddBookingService'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'bookingId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'serviceId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'quantity')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'totalPrice')),
        type: NamedTypeNode(
          name: NameNode(value: 'Float'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'addBookingService'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'bookingId'),
            value: VariableNode(name: NameNode(value: 'bookingId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'serviceId'),
            value: VariableNode(name: NameNode(value: 'serviceId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'quantity'),
            value: VariableNode(name: NameNode(value: 'quantity')),
          ),
          ArgumentNode(
            name: NameNode(value: 'totalPrice'),
            value: VariableNode(name: NameNode(value: 'totalPrice')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'bookingId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'serviceId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'quantity'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'totalPrice'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$AddBookingService _parserFn$Mutation$AddBookingService(
        Map<String, dynamic> data) =>
    Mutation$AddBookingService.fromJson(data);
typedef OnMutationCompleted$Mutation$AddBookingService = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$AddBookingService?,
);

class Options$Mutation$AddBookingService
    extends graphql.MutationOptions<Mutation$AddBookingService> {
  Options$Mutation$AddBookingService({
    String? operationName,
    required Variables$Mutation$AddBookingService variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddBookingService? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddBookingService? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddBookingService>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$AddBookingService(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAddBookingService,
          parserFn: _parserFn$Mutation$AddBookingService,
        );

  final OnMutationCompleted$Mutation$AddBookingService? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$AddBookingService
    extends graphql.WatchQueryOptions<Mutation$AddBookingService> {
  WatchOptions$Mutation$AddBookingService({
    String? operationName,
    required Variables$Mutation$AddBookingService variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddBookingService? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationAddBookingService,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$AddBookingService,
        );
}

extension ClientExtension$Mutation$AddBookingService on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$AddBookingService>>
      mutate$AddBookingService(
              Options$Mutation$AddBookingService options) async =>
          await this.mutate(options);

  graphql.ObservableQuery<Mutation$AddBookingService>
      watchMutation$AddBookingService(
              WatchOptions$Mutation$AddBookingService options) =>
          this.watchMutation(options);
}

class Mutation$AddBookingService$HookResult {
  Mutation$AddBookingService$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$AddBookingService runMutation;

  final graphql.QueryResult<Mutation$AddBookingService> result;
}

Mutation$AddBookingService$HookResult useMutation$AddBookingService(
    [WidgetOptions$Mutation$AddBookingService? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$AddBookingService());
  return Mutation$AddBookingService$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$AddBookingService>
    useWatchMutation$AddBookingService(
            WatchOptions$Mutation$AddBookingService options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$AddBookingService
    extends graphql.MutationOptions<Mutation$AddBookingService> {
  WidgetOptions$Mutation$AddBookingService({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddBookingService? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddBookingService? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddBookingService>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$AddBookingService(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAddBookingService,
          parserFn: _parserFn$Mutation$AddBookingService,
        );

  final OnMutationCompleted$Mutation$AddBookingService? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$AddBookingService
    = graphql.MultiSourceResult<Mutation$AddBookingService> Function(
  Variables$Mutation$AddBookingService, {
  Object? optimisticResult,
  Mutation$AddBookingService? typedOptimisticResult,
});
typedef Builder$Mutation$AddBookingService = widgets.Widget Function(
  RunMutation$Mutation$AddBookingService,
  graphql.QueryResult<Mutation$AddBookingService>?,
);

class Mutation$AddBookingService$Widget
    extends graphql_flutter.Mutation<Mutation$AddBookingService> {
  Mutation$AddBookingService$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$AddBookingService? options,
    required Builder$Mutation$AddBookingService builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$AddBookingService(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$AddBookingService$addBookingService {
  Mutation$AddBookingService$addBookingService({
    required this.id,
    required this.bookingId,
    required this.serviceId,
    this.quantity,
    required this.totalPrice,
    this.$__typename = 'BookingService',
  });

  factory Mutation$AddBookingService$addBookingService.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$bookingId = json['bookingId'];
    final l$serviceId = json['serviceId'];
    final l$quantity = json['quantity'];
    final l$totalPrice = json['totalPrice'];
    final l$$__typename = json['__typename'];
    return Mutation$AddBookingService$addBookingService(
      id: (l$id as String),
      bookingId: (l$bookingId as String),
      serviceId: (l$serviceId as String),
      quantity: (l$quantity as int?),
      totalPrice: (l$totalPrice as num).toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String bookingId;

  final String serviceId;

  final int? quantity;

  final double totalPrice;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$bookingId = bookingId;
    _resultData['bookingId'] = l$bookingId;
    final l$serviceId = serviceId;
    _resultData['serviceId'] = l$serviceId;
    final l$quantity = quantity;
    _resultData['quantity'] = l$quantity;
    final l$totalPrice = totalPrice;
    _resultData['totalPrice'] = l$totalPrice;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$bookingId = bookingId;
    final l$serviceId = serviceId;
    final l$quantity = quantity;
    final l$totalPrice = totalPrice;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$bookingId,
      l$serviceId,
      l$quantity,
      l$totalPrice,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$AddBookingService$addBookingService) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$bookingId = bookingId;
    final lOther$bookingId = other.bookingId;
    if (l$bookingId != lOther$bookingId) {
      return false;
    }
    final l$serviceId = serviceId;
    final lOther$serviceId = other.serviceId;
    if (l$serviceId != lOther$serviceId) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) {
      return false;
    }
    final l$totalPrice = totalPrice;
    final lOther$totalPrice = other.totalPrice;
    if (l$totalPrice != lOther$totalPrice) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$AddBookingService$addBookingService
    on Mutation$AddBookingService$addBookingService {
  CopyWith$Mutation$AddBookingService$addBookingService<
          Mutation$AddBookingService$addBookingService>
      get copyWith => CopyWith$Mutation$AddBookingService$addBookingService(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$AddBookingService$addBookingService<TRes> {
  factory CopyWith$Mutation$AddBookingService$addBookingService(
    Mutation$AddBookingService$addBookingService instance,
    TRes Function(Mutation$AddBookingService$addBookingService) then,
  ) = _CopyWithImpl$Mutation$AddBookingService$addBookingService;

  factory CopyWith$Mutation$AddBookingService$addBookingService.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddBookingService$addBookingService;

  TRes call({
    String? id,
    String? bookingId,
    String? serviceId,
    int? quantity,
    double? totalPrice,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$AddBookingService$addBookingService<TRes>
    implements CopyWith$Mutation$AddBookingService$addBookingService<TRes> {
  _CopyWithImpl$Mutation$AddBookingService$addBookingService(
    this._instance,
    this._then,
  );

  final Mutation$AddBookingService$addBookingService _instance;

  final TRes Function(Mutation$AddBookingService$addBookingService) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? bookingId = _undefined,
    Object? serviceId = _undefined,
    Object? quantity = _undefined,
    Object? totalPrice = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AddBookingService$addBookingService(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        bookingId: bookingId == _undefined || bookingId == null
            ? _instance.bookingId
            : (bookingId as String),
        serviceId: serviceId == _undefined || serviceId == null
            ? _instance.serviceId
            : (serviceId as String),
        quantity:
            quantity == _undefined ? _instance.quantity : (quantity as int?),
        totalPrice: totalPrice == _undefined || totalPrice == null
            ? _instance.totalPrice
            : (totalPrice as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$AddBookingService$addBookingService<TRes>
    implements CopyWith$Mutation$AddBookingService$addBookingService<TRes> {
  _CopyWithStubImpl$Mutation$AddBookingService$addBookingService(this._res);

  TRes _res;

  call({
    String? id,
    String? bookingId,
    String? serviceId,
    int? quantity,
    double? totalPrice,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$UpdateBookingService {
  factory Variables$Mutation$UpdateBookingService({
    required String id,
    required Input$UpdateBookingServiceInput input,
  }) =>
      Variables$Mutation$UpdateBookingService._({
        r'id': id,
        r'input': input,
      });

  Variables$Mutation$UpdateBookingService._(this._$data);

  factory Variables$Mutation$UpdateBookingService.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$input = data['input'];
    result$data['input'] = Input$UpdateBookingServiceInput.fromJson(
        (l$input as Map<String, dynamic>));
    return Variables$Mutation$UpdateBookingService._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Input$UpdateBookingServiceInput get input =>
      (_$data['input'] as Input$UpdateBookingServiceInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateBookingService<
          Variables$Mutation$UpdateBookingService>
      get copyWith => CopyWith$Variables$Mutation$UpdateBookingService(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$UpdateBookingService) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$input = input;
    return Object.hashAll([
      l$id,
      l$input,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateBookingService<TRes> {
  factory CopyWith$Variables$Mutation$UpdateBookingService(
    Variables$Mutation$UpdateBookingService instance,
    TRes Function(Variables$Mutation$UpdateBookingService) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateBookingService;

  factory CopyWith$Variables$Mutation$UpdateBookingService.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateBookingService;

  TRes call({
    String? id,
    Input$UpdateBookingServiceInput? input,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateBookingService<TRes>
    implements CopyWith$Variables$Mutation$UpdateBookingService<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateBookingService(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateBookingService _instance;

  final TRes Function(Variables$Mutation$UpdateBookingService) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? input = _undefined,
  }) =>
      _then(Variables$Mutation$UpdateBookingService._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (input != _undefined && input != null)
          'input': (input as Input$UpdateBookingServiceInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateBookingService<TRes>
    implements CopyWith$Variables$Mutation$UpdateBookingService<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateBookingService(this._res);

  TRes _res;

  call({
    String? id,
    Input$UpdateBookingServiceInput? input,
  }) =>
      _res;
}

class Mutation$UpdateBookingService {
  Mutation$UpdateBookingService({
    required this.updateBookingService,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateBookingService.fromJson(Map<String, dynamic> json) {
    final l$updateBookingService = json['updateBookingService'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateBookingService(
      updateBookingService:
          Mutation$UpdateBookingService$updateBookingService.fromJson(
              (l$updateBookingService as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateBookingService$updateBookingService updateBookingService;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateBookingService = updateBookingService;
    _resultData['updateBookingService'] = l$updateBookingService.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateBookingService = updateBookingService;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateBookingService,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateBookingService) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateBookingService = updateBookingService;
    final lOther$updateBookingService = other.updateBookingService;
    if (l$updateBookingService != lOther$updateBookingService) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateBookingService
    on Mutation$UpdateBookingService {
  CopyWith$Mutation$UpdateBookingService<Mutation$UpdateBookingService>
      get copyWith => CopyWith$Mutation$UpdateBookingService(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateBookingService<TRes> {
  factory CopyWith$Mutation$UpdateBookingService(
    Mutation$UpdateBookingService instance,
    TRes Function(Mutation$UpdateBookingService) then,
  ) = _CopyWithImpl$Mutation$UpdateBookingService;

  factory CopyWith$Mutation$UpdateBookingService.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateBookingService;

  TRes call({
    Mutation$UpdateBookingService$updateBookingService? updateBookingService,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateBookingService$updateBookingService<TRes>
      get updateBookingService;
}

class _CopyWithImpl$Mutation$UpdateBookingService<TRes>
    implements CopyWith$Mutation$UpdateBookingService<TRes> {
  _CopyWithImpl$Mutation$UpdateBookingService(
    this._instance,
    this._then,
  );

  final Mutation$UpdateBookingService _instance;

  final TRes Function(Mutation$UpdateBookingService) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateBookingService = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateBookingService(
        updateBookingService:
            updateBookingService == _undefined || updateBookingService == null
                ? _instance.updateBookingService
                : (updateBookingService
                    as Mutation$UpdateBookingService$updateBookingService),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdateBookingService$updateBookingService<TRes>
      get updateBookingService {
    final local$updateBookingService = _instance.updateBookingService;
    return CopyWith$Mutation$UpdateBookingService$updateBookingService(
        local$updateBookingService, (e) => call(updateBookingService: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateBookingService<TRes>
    implements CopyWith$Mutation$UpdateBookingService<TRes> {
  _CopyWithStubImpl$Mutation$UpdateBookingService(this._res);

  TRes _res;

  call({
    Mutation$UpdateBookingService$updateBookingService? updateBookingService,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdateBookingService$updateBookingService<TRes>
      get updateBookingService =>
          CopyWith$Mutation$UpdateBookingService$updateBookingService.stub(
              _res);
}

const documentNodeMutationUpdateBookingService = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateBookingService'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'UpdateBookingServiceInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateBookingService'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'quantity'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'totalPrice'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$UpdateBookingService _parserFn$Mutation$UpdateBookingService(
        Map<String, dynamic> data) =>
    Mutation$UpdateBookingService.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateBookingService = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$UpdateBookingService?,
);

class Options$Mutation$UpdateBookingService
    extends graphql.MutationOptions<Mutation$UpdateBookingService> {
  Options$Mutation$UpdateBookingService({
    String? operationName,
    required Variables$Mutation$UpdateBookingService variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateBookingService? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateBookingService? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateBookingService>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$UpdateBookingService(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateBookingService,
          parserFn: _parserFn$Mutation$UpdateBookingService,
        );

  final OnMutationCompleted$Mutation$UpdateBookingService?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateBookingService
    extends graphql.WatchQueryOptions<Mutation$UpdateBookingService> {
  WatchOptions$Mutation$UpdateBookingService({
    String? operationName,
    required Variables$Mutation$UpdateBookingService variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateBookingService? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationUpdateBookingService,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateBookingService,
        );
}

extension ClientExtension$Mutation$UpdateBookingService
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateBookingService>>
      mutate$UpdateBookingService(
              Options$Mutation$UpdateBookingService options) async =>
          await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateBookingService>
      watchMutation$UpdateBookingService(
              WatchOptions$Mutation$UpdateBookingService options) =>
          this.watchMutation(options);
}

class Mutation$UpdateBookingService$HookResult {
  Mutation$UpdateBookingService$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateBookingService runMutation;

  final graphql.QueryResult<Mutation$UpdateBookingService> result;
}

Mutation$UpdateBookingService$HookResult useMutation$UpdateBookingService(
    [WidgetOptions$Mutation$UpdateBookingService? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateBookingService());
  return Mutation$UpdateBookingService$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateBookingService>
    useWatchMutation$UpdateBookingService(
            WatchOptions$Mutation$UpdateBookingService options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateBookingService
    extends graphql.MutationOptions<Mutation$UpdateBookingService> {
  WidgetOptions$Mutation$UpdateBookingService({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateBookingService? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateBookingService? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateBookingService>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$UpdateBookingService(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateBookingService,
          parserFn: _parserFn$Mutation$UpdateBookingService,
        );

  final OnMutationCompleted$Mutation$UpdateBookingService?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateBookingService
    = graphql.MultiSourceResult<Mutation$UpdateBookingService> Function(
  Variables$Mutation$UpdateBookingService, {
  Object? optimisticResult,
  Mutation$UpdateBookingService? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateBookingService = widgets.Widget Function(
  RunMutation$Mutation$UpdateBookingService,
  graphql.QueryResult<Mutation$UpdateBookingService>?,
);

class Mutation$UpdateBookingService$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateBookingService> {
  Mutation$UpdateBookingService$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateBookingService? options,
    required Builder$Mutation$UpdateBookingService builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdateBookingService(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$UpdateBookingService$updateBookingService {
  Mutation$UpdateBookingService$updateBookingService({
    required this.id,
    this.quantity,
    required this.totalPrice,
    this.$__typename = 'BookingService',
  });

  factory Mutation$UpdateBookingService$updateBookingService.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$quantity = json['quantity'];
    final l$totalPrice = json['totalPrice'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateBookingService$updateBookingService(
      id: (l$id as String),
      quantity: (l$quantity as int?),
      totalPrice: (l$totalPrice as num).toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final int? quantity;

  final double totalPrice;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$quantity = quantity;
    _resultData['quantity'] = l$quantity;
    final l$totalPrice = totalPrice;
    _resultData['totalPrice'] = l$totalPrice;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$quantity = quantity;
    final l$totalPrice = totalPrice;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$quantity,
      l$totalPrice,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateBookingService$updateBookingService) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) {
      return false;
    }
    final l$totalPrice = totalPrice;
    final lOther$totalPrice = other.totalPrice;
    if (l$totalPrice != lOther$totalPrice) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateBookingService$updateBookingService
    on Mutation$UpdateBookingService$updateBookingService {
  CopyWith$Mutation$UpdateBookingService$updateBookingService<
          Mutation$UpdateBookingService$updateBookingService>
      get copyWith =>
          CopyWith$Mutation$UpdateBookingService$updateBookingService(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateBookingService$updateBookingService<
    TRes> {
  factory CopyWith$Mutation$UpdateBookingService$updateBookingService(
    Mutation$UpdateBookingService$updateBookingService instance,
    TRes Function(Mutation$UpdateBookingService$updateBookingService) then,
  ) = _CopyWithImpl$Mutation$UpdateBookingService$updateBookingService;

  factory CopyWith$Mutation$UpdateBookingService$updateBookingService.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$UpdateBookingService$updateBookingService;

  TRes call({
    String? id,
    int? quantity,
    double? totalPrice,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateBookingService$updateBookingService<TRes>
    implements
        CopyWith$Mutation$UpdateBookingService$updateBookingService<TRes> {
  _CopyWithImpl$Mutation$UpdateBookingService$updateBookingService(
    this._instance,
    this._then,
  );

  final Mutation$UpdateBookingService$updateBookingService _instance;

  final TRes Function(Mutation$UpdateBookingService$updateBookingService) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? quantity = _undefined,
    Object? totalPrice = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateBookingService$updateBookingService(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        quantity:
            quantity == _undefined ? _instance.quantity : (quantity as int?),
        totalPrice: totalPrice == _undefined || totalPrice == null
            ? _instance.totalPrice
            : (totalPrice as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UpdateBookingService$updateBookingService<TRes>
    implements
        CopyWith$Mutation$UpdateBookingService$updateBookingService<TRes> {
  _CopyWithStubImpl$Mutation$UpdateBookingService$updateBookingService(
      this._res);

  TRes _res;

  call({
    String? id,
    int? quantity,
    double? totalPrice,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$DeleteBookingService {
  factory Variables$Mutation$DeleteBookingService({required String id}) =>
      Variables$Mutation$DeleteBookingService._({
        r'id': id,
      });

  Variables$Mutation$DeleteBookingService._(this._$data);

  factory Variables$Mutation$DeleteBookingService.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$DeleteBookingService._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteBookingService<
          Variables$Mutation$DeleteBookingService>
      get copyWith => CopyWith$Variables$Mutation$DeleteBookingService(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$DeleteBookingService) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Mutation$DeleteBookingService<TRes> {
  factory CopyWith$Variables$Mutation$DeleteBookingService(
    Variables$Mutation$DeleteBookingService instance,
    TRes Function(Variables$Mutation$DeleteBookingService) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteBookingService;

  factory CopyWith$Variables$Mutation$DeleteBookingService.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteBookingService;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$DeleteBookingService<TRes>
    implements CopyWith$Variables$Mutation$DeleteBookingService<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteBookingService(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteBookingService _instance;

  final TRes Function(Variables$Mutation$DeleteBookingService) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$DeleteBookingService._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$DeleteBookingService<TRes>
    implements CopyWith$Variables$Mutation$DeleteBookingService<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteBookingService(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$DeleteBookingService {
  Mutation$DeleteBookingService({
    required this.deleteBookingService,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteBookingService.fromJson(Map<String, dynamic> json) {
    final l$deleteBookingService = json['deleteBookingService'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteBookingService(
      deleteBookingService: (l$deleteBookingService as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool deleteBookingService;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteBookingService = deleteBookingService;
    _resultData['deleteBookingService'] = l$deleteBookingService;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteBookingService = deleteBookingService;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleteBookingService,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$DeleteBookingService) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteBookingService = deleteBookingService;
    final lOther$deleteBookingService = other.deleteBookingService;
    if (l$deleteBookingService != lOther$deleteBookingService) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$DeleteBookingService
    on Mutation$DeleteBookingService {
  CopyWith$Mutation$DeleteBookingService<Mutation$DeleteBookingService>
      get copyWith => CopyWith$Mutation$DeleteBookingService(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteBookingService<TRes> {
  factory CopyWith$Mutation$DeleteBookingService(
    Mutation$DeleteBookingService instance,
    TRes Function(Mutation$DeleteBookingService) then,
  ) = _CopyWithImpl$Mutation$DeleteBookingService;

  factory CopyWith$Mutation$DeleteBookingService.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteBookingService;

  TRes call({
    bool? deleteBookingService,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteBookingService<TRes>
    implements CopyWith$Mutation$DeleteBookingService<TRes> {
  _CopyWithImpl$Mutation$DeleteBookingService(
    this._instance,
    this._then,
  );

  final Mutation$DeleteBookingService _instance;

  final TRes Function(Mutation$DeleteBookingService) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteBookingService = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteBookingService(
        deleteBookingService:
            deleteBookingService == _undefined || deleteBookingService == null
                ? _instance.deleteBookingService
                : (deleteBookingService as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeleteBookingService<TRes>
    implements CopyWith$Mutation$DeleteBookingService<TRes> {
  _CopyWithStubImpl$Mutation$DeleteBookingService(this._res);

  TRes _res;

  call({
    bool? deleteBookingService,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationDeleteBookingService = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteBookingService'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'deleteBookingService'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$DeleteBookingService _parserFn$Mutation$DeleteBookingService(
        Map<String, dynamic> data) =>
    Mutation$DeleteBookingService.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteBookingService = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$DeleteBookingService?,
);

class Options$Mutation$DeleteBookingService
    extends graphql.MutationOptions<Mutation$DeleteBookingService> {
  Options$Mutation$DeleteBookingService({
    String? operationName,
    required Variables$Mutation$DeleteBookingService variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteBookingService? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteBookingService? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteBookingService>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$DeleteBookingService(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteBookingService,
          parserFn: _parserFn$Mutation$DeleteBookingService,
        );

  final OnMutationCompleted$Mutation$DeleteBookingService?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteBookingService
    extends graphql.WatchQueryOptions<Mutation$DeleteBookingService> {
  WatchOptions$Mutation$DeleteBookingService({
    String? operationName,
    required Variables$Mutation$DeleteBookingService variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteBookingService? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationDeleteBookingService,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeleteBookingService,
        );
}

extension ClientExtension$Mutation$DeleteBookingService
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteBookingService>>
      mutate$DeleteBookingService(
              Options$Mutation$DeleteBookingService options) async =>
          await this.mutate(options);

  graphql.ObservableQuery<Mutation$DeleteBookingService>
      watchMutation$DeleteBookingService(
              WatchOptions$Mutation$DeleteBookingService options) =>
          this.watchMutation(options);
}

class Mutation$DeleteBookingService$HookResult {
  Mutation$DeleteBookingService$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$DeleteBookingService runMutation;

  final graphql.QueryResult<Mutation$DeleteBookingService> result;
}

Mutation$DeleteBookingService$HookResult useMutation$DeleteBookingService(
    [WidgetOptions$Mutation$DeleteBookingService? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$DeleteBookingService());
  return Mutation$DeleteBookingService$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteBookingService>
    useWatchMutation$DeleteBookingService(
            WatchOptions$Mutation$DeleteBookingService options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteBookingService
    extends graphql.MutationOptions<Mutation$DeleteBookingService> {
  WidgetOptions$Mutation$DeleteBookingService({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteBookingService? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteBookingService? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteBookingService>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$DeleteBookingService(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteBookingService,
          parserFn: _parserFn$Mutation$DeleteBookingService,
        );

  final OnMutationCompleted$Mutation$DeleteBookingService?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$DeleteBookingService
    = graphql.MultiSourceResult<Mutation$DeleteBookingService> Function(
  Variables$Mutation$DeleteBookingService, {
  Object? optimisticResult,
  Mutation$DeleteBookingService? typedOptimisticResult,
});
typedef Builder$Mutation$DeleteBookingService = widgets.Widget Function(
  RunMutation$Mutation$DeleteBookingService,
  graphql.QueryResult<Mutation$DeleteBookingService>?,
);

class Mutation$DeleteBookingService$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteBookingService> {
  Mutation$DeleteBookingService$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteBookingService? options,
    required Builder$Mutation$DeleteBookingService builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$DeleteBookingService(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}
