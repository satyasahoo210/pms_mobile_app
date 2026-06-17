class Input$CreatePropertyInput {
  factory Input$CreatePropertyInput({
    required String name,
    required String address,
    required String timezone,
    double? taxPercentage,
    required String tenantId,
    String? logoUrl,
    String? phone,
    String? email,
    String? checkInTime,
    String? checkOutTime,
    String? settings,
    List<String?>? photos,
  }) =>
      Input$CreatePropertyInput._({
        r'name': name,
        r'address': address,
        r'timezone': timezone,
        if (taxPercentage != null) r'taxPercentage': taxPercentage,
        r'tenantId': tenantId,
        if (logoUrl != null) r'logoUrl': logoUrl,
        if (phone != null) r'phone': phone,
        if (email != null) r'email': email,
        if (checkInTime != null) r'checkInTime': checkInTime,
        if (checkOutTime != null) r'checkOutTime': checkOutTime,
        if (settings != null) r'settings': settings,
        if (photos != null) r'photos': photos,
      });

  Input$CreatePropertyInput._(this._$data);

  factory Input$CreatePropertyInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$address = data['address'];
    result$data['address'] = (l$address as String);
    final l$timezone = data['timezone'];
    result$data['timezone'] = (l$timezone as String);
    if (data.containsKey('taxPercentage')) {
      final l$taxPercentage = data['taxPercentage'];
      result$data['taxPercentage'] = (l$taxPercentage as num?)?.toDouble();
    }
    final l$tenantId = data['tenantId'];
    result$data['tenantId'] = (l$tenantId as String);
    if (data.containsKey('logoUrl')) {
      final l$logoUrl = data['logoUrl'];
      result$data['logoUrl'] = (l$logoUrl as String?);
    }
    if (data.containsKey('phone')) {
      final l$phone = data['phone'];
      result$data['phone'] = (l$phone as String?);
    }
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('checkInTime')) {
      final l$checkInTime = data['checkInTime'];
      result$data['checkInTime'] = (l$checkInTime as String?);
    }
    if (data.containsKey('checkOutTime')) {
      final l$checkOutTime = data['checkOutTime'];
      result$data['checkOutTime'] = (l$checkOutTime as String?);
    }
    if (data.containsKey('settings')) {
      final l$settings = data['settings'];
      result$data['settings'] = (l$settings as String?);
    }
    if (data.containsKey('photos')) {
      final l$photos = data['photos'];
      result$data['photos'] =
          (l$photos as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    return Input$CreatePropertyInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String get address => (_$data['address'] as String);

  String get timezone => (_$data['timezone'] as String);

  double? get taxPercentage => (_$data['taxPercentage'] as double?);

  String get tenantId => (_$data['tenantId'] as String);

  String? get logoUrl => (_$data['logoUrl'] as String?);

  String? get phone => (_$data['phone'] as String?);

  String? get email => (_$data['email'] as String?);

  String? get checkInTime => (_$data['checkInTime'] as String?);

  String? get checkOutTime => (_$data['checkOutTime'] as String?);

  String? get settings => (_$data['settings'] as String?);

  List<String?>? get photos => (_$data['photos'] as List<String?>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$address = address;
    result$data['address'] = l$address;
    final l$timezone = timezone;
    result$data['timezone'] = l$timezone;
    if (_$data.containsKey('taxPercentage')) {
      final l$taxPercentage = taxPercentage;
      result$data['taxPercentage'] = l$taxPercentage;
    }
    final l$tenantId = tenantId;
    result$data['tenantId'] = l$tenantId;
    if (_$data.containsKey('logoUrl')) {
      final l$logoUrl = logoUrl;
      result$data['logoUrl'] = l$logoUrl;
    }
    if (_$data.containsKey('phone')) {
      final l$phone = phone;
      result$data['phone'] = l$phone;
    }
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('checkInTime')) {
      final l$checkInTime = checkInTime;
      result$data['checkInTime'] = l$checkInTime;
    }
    if (_$data.containsKey('checkOutTime')) {
      final l$checkOutTime = checkOutTime;
      result$data['checkOutTime'] = l$checkOutTime;
    }
    if (_$data.containsKey('settings')) {
      final l$settings = settings;
      result$data['settings'] = l$settings;
    }
    if (_$data.containsKey('photos')) {
      final l$photos = photos;
      result$data['photos'] = l$photos?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$CreatePropertyInput<Input$CreatePropertyInput> get copyWith =>
      CopyWith$Input$CreatePropertyInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CreatePropertyInput) ||
        runtimeType != other.runtimeType) {
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
    final l$taxPercentage = taxPercentage;
    final lOther$taxPercentage = other.taxPercentage;
    if (_$data.containsKey('taxPercentage') !=
        other._$data.containsKey('taxPercentage')) {
      return false;
    }
    if (l$taxPercentage != lOther$taxPercentage) {
      return false;
    }
    final l$tenantId = tenantId;
    final lOther$tenantId = other.tenantId;
    if (l$tenantId != lOther$tenantId) {
      return false;
    }
    final l$logoUrl = logoUrl;
    final lOther$logoUrl = other.logoUrl;
    if (_$data.containsKey('logoUrl') != other._$data.containsKey('logoUrl')) {
      return false;
    }
    if (l$logoUrl != lOther$logoUrl) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (_$data.containsKey('phone') != other._$data.containsKey('phone')) {
      return false;
    }
    if (l$phone != lOther$phone) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$checkInTime = checkInTime;
    final lOther$checkInTime = other.checkInTime;
    if (_$data.containsKey('checkInTime') !=
        other._$data.containsKey('checkInTime')) {
      return false;
    }
    if (l$checkInTime != lOther$checkInTime) {
      return false;
    }
    final l$checkOutTime = checkOutTime;
    final lOther$checkOutTime = other.checkOutTime;
    if (_$data.containsKey('checkOutTime') !=
        other._$data.containsKey('checkOutTime')) {
      return false;
    }
    if (l$checkOutTime != lOther$checkOutTime) {
      return false;
    }
    final l$settings = settings;
    final lOther$settings = other.settings;
    if (_$data.containsKey('settings') !=
        other._$data.containsKey('settings')) {
      return false;
    }
    if (l$settings != lOther$settings) {
      return false;
    }
    final l$photos = photos;
    final lOther$photos = other.photos;
    if (_$data.containsKey('photos') != other._$data.containsKey('photos')) {
      return false;
    }
    if (l$photos != null && lOther$photos != null) {
      if (l$photos.length != lOther$photos.length) {
        return false;
      }
      for (int i = 0; i < l$photos.length; i++) {
        final l$photos$entry = l$photos[i];
        final lOther$photos$entry = lOther$photos[i];
        if (l$photos$entry != lOther$photos$entry) {
          return false;
        }
      }
    } else if (l$photos != lOther$photos) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$address = address;
    final l$timezone = timezone;
    final l$taxPercentage = taxPercentage;
    final l$tenantId = tenantId;
    final l$logoUrl = logoUrl;
    final l$phone = phone;
    final l$email = email;
    final l$checkInTime = checkInTime;
    final l$checkOutTime = checkOutTime;
    final l$settings = settings;
    final l$photos = photos;
    return Object.hashAll([
      l$name,
      l$address,
      l$timezone,
      _$data.containsKey('taxPercentage') ? l$taxPercentage : const {},
      l$tenantId,
      _$data.containsKey('logoUrl') ? l$logoUrl : const {},
      _$data.containsKey('phone') ? l$phone : const {},
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('checkInTime') ? l$checkInTime : const {},
      _$data.containsKey('checkOutTime') ? l$checkOutTime : const {},
      _$data.containsKey('settings') ? l$settings : const {},
      _$data.containsKey('photos')
          ? l$photos == null
              ? null
              : Object.hashAll(l$photos.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreatePropertyInput<TRes> {
  factory CopyWith$Input$CreatePropertyInput(
    Input$CreatePropertyInput instance,
    TRes Function(Input$CreatePropertyInput) then,
  ) = _CopyWithImpl$Input$CreatePropertyInput;

  factory CopyWith$Input$CreatePropertyInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreatePropertyInput;

  TRes call({
    String? name,
    String? address,
    String? timezone,
    double? taxPercentage,
    String? tenantId,
    String? logoUrl,
    String? phone,
    String? email,
    String? checkInTime,
    String? checkOutTime,
    String? settings,
    List<String?>? photos,
  });
}

class _CopyWithImpl$Input$CreatePropertyInput<TRes>
    implements CopyWith$Input$CreatePropertyInput<TRes> {
  _CopyWithImpl$Input$CreatePropertyInput(
    this._instance,
    this._then,
  );

  final Input$CreatePropertyInput _instance;

  final TRes Function(Input$CreatePropertyInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? address = _undefined,
    Object? timezone = _undefined,
    Object? taxPercentage = _undefined,
    Object? tenantId = _undefined,
    Object? logoUrl = _undefined,
    Object? phone = _undefined,
    Object? email = _undefined,
    Object? checkInTime = _undefined,
    Object? checkOutTime = _undefined,
    Object? settings = _undefined,
    Object? photos = _undefined,
  }) =>
      _then(Input$CreatePropertyInput._({
        ..._instance._$data,
        if (name != _undefined && name != null) 'name': (name as String),
        if (address != _undefined && address != null)
          'address': (address as String),
        if (timezone != _undefined && timezone != null)
          'timezone': (timezone as String),
        if (taxPercentage != _undefined)
          'taxPercentage': (taxPercentage as double?),
        if (tenantId != _undefined && tenantId != null)
          'tenantId': (tenantId as String),
        if (logoUrl != _undefined) 'logoUrl': (logoUrl as String?),
        if (phone != _undefined) 'phone': (phone as String?),
        if (email != _undefined) 'email': (email as String?),
        if (checkInTime != _undefined) 'checkInTime': (checkInTime as String?),
        if (checkOutTime != _undefined)
          'checkOutTime': (checkOutTime as String?),
        if (settings != _undefined) 'settings': (settings as String?),
        if (photos != _undefined) 'photos': (photos as List<String?>?),
      }));
}

class _CopyWithStubImpl$Input$CreatePropertyInput<TRes>
    implements CopyWith$Input$CreatePropertyInput<TRes> {
  _CopyWithStubImpl$Input$CreatePropertyInput(this._res);

  TRes _res;

  call({
    String? name,
    String? address,
    String? timezone,
    double? taxPercentage,
    String? tenantId,
    String? logoUrl,
    String? phone,
    String? email,
    String? checkInTime,
    String? checkOutTime,
    String? settings,
    List<String?>? photos,
  }) =>
      _res;
}

class Input$UpdatePropertyInput {
  factory Input$UpdatePropertyInput({
    String? name,
    String? address,
    String? timezone,
    double? taxPercentage,
    String? logoUrl,
    String? phone,
    String? email,
    String? checkInTime,
    String? checkOutTime,
    String? settings,
    List<String?>? photos,
  }) =>
      Input$UpdatePropertyInput._({
        if (name != null) r'name': name,
        if (address != null) r'address': address,
        if (timezone != null) r'timezone': timezone,
        if (taxPercentage != null) r'taxPercentage': taxPercentage,
        if (logoUrl != null) r'logoUrl': logoUrl,
        if (phone != null) r'phone': phone,
        if (email != null) r'email': email,
        if (checkInTime != null) r'checkInTime': checkInTime,
        if (checkOutTime != null) r'checkOutTime': checkOutTime,
        if (settings != null) r'settings': settings,
        if (photos != null) r'photos': photos,
      });

  Input$UpdatePropertyInput._(this._$data);

  factory Input$UpdatePropertyInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('address')) {
      final l$address = data['address'];
      result$data['address'] = (l$address as String?);
    }
    if (data.containsKey('timezone')) {
      final l$timezone = data['timezone'];
      result$data['timezone'] = (l$timezone as String?);
    }
    if (data.containsKey('taxPercentage')) {
      final l$taxPercentage = data['taxPercentage'];
      result$data['taxPercentage'] = (l$taxPercentage as num?)?.toDouble();
    }
    if (data.containsKey('logoUrl')) {
      final l$logoUrl = data['logoUrl'];
      result$data['logoUrl'] = (l$logoUrl as String?);
    }
    if (data.containsKey('phone')) {
      final l$phone = data['phone'];
      result$data['phone'] = (l$phone as String?);
    }
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('checkInTime')) {
      final l$checkInTime = data['checkInTime'];
      result$data['checkInTime'] = (l$checkInTime as String?);
    }
    if (data.containsKey('checkOutTime')) {
      final l$checkOutTime = data['checkOutTime'];
      result$data['checkOutTime'] = (l$checkOutTime as String?);
    }
    if (data.containsKey('settings')) {
      final l$settings = data['settings'];
      result$data['settings'] = (l$settings as String?);
    }
    if (data.containsKey('photos')) {
      final l$photos = data['photos'];
      result$data['photos'] =
          (l$photos as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    return Input$UpdatePropertyInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  String? get address => (_$data['address'] as String?);

  String? get timezone => (_$data['timezone'] as String?);

  double? get taxPercentage => (_$data['taxPercentage'] as double?);

  String? get logoUrl => (_$data['logoUrl'] as String?);

  String? get phone => (_$data['phone'] as String?);

  String? get email => (_$data['email'] as String?);

  String? get checkInTime => (_$data['checkInTime'] as String?);

  String? get checkOutTime => (_$data['checkOutTime'] as String?);

  String? get settings => (_$data['settings'] as String?);

  List<String?>? get photos => (_$data['photos'] as List<String?>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('address')) {
      final l$address = address;
      result$data['address'] = l$address;
    }
    if (_$data.containsKey('timezone')) {
      final l$timezone = timezone;
      result$data['timezone'] = l$timezone;
    }
    if (_$data.containsKey('taxPercentage')) {
      final l$taxPercentage = taxPercentage;
      result$data['taxPercentage'] = l$taxPercentage;
    }
    if (_$data.containsKey('logoUrl')) {
      final l$logoUrl = logoUrl;
      result$data['logoUrl'] = l$logoUrl;
    }
    if (_$data.containsKey('phone')) {
      final l$phone = phone;
      result$data['phone'] = l$phone;
    }
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('checkInTime')) {
      final l$checkInTime = checkInTime;
      result$data['checkInTime'] = l$checkInTime;
    }
    if (_$data.containsKey('checkOutTime')) {
      final l$checkOutTime = checkOutTime;
      result$data['checkOutTime'] = l$checkOutTime;
    }
    if (_$data.containsKey('settings')) {
      final l$settings = settings;
      result$data['settings'] = l$settings;
    }
    if (_$data.containsKey('photos')) {
      final l$photos = photos;
      result$data['photos'] = l$photos?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$UpdatePropertyInput<Input$UpdatePropertyInput> get copyWith =>
      CopyWith$Input$UpdatePropertyInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$UpdatePropertyInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (_$data.containsKey('address') != other._$data.containsKey('address')) {
      return false;
    }
    if (l$address != lOther$address) {
      return false;
    }
    final l$timezone = timezone;
    final lOther$timezone = other.timezone;
    if (_$data.containsKey('timezone') !=
        other._$data.containsKey('timezone')) {
      return false;
    }
    if (l$timezone != lOther$timezone) {
      return false;
    }
    final l$taxPercentage = taxPercentage;
    final lOther$taxPercentage = other.taxPercentage;
    if (_$data.containsKey('taxPercentage') !=
        other._$data.containsKey('taxPercentage')) {
      return false;
    }
    if (l$taxPercentage != lOther$taxPercentage) {
      return false;
    }
    final l$logoUrl = logoUrl;
    final lOther$logoUrl = other.logoUrl;
    if (_$data.containsKey('logoUrl') != other._$data.containsKey('logoUrl')) {
      return false;
    }
    if (l$logoUrl != lOther$logoUrl) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (_$data.containsKey('phone') != other._$data.containsKey('phone')) {
      return false;
    }
    if (l$phone != lOther$phone) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$checkInTime = checkInTime;
    final lOther$checkInTime = other.checkInTime;
    if (_$data.containsKey('checkInTime') !=
        other._$data.containsKey('checkInTime')) {
      return false;
    }
    if (l$checkInTime != lOther$checkInTime) {
      return false;
    }
    final l$checkOutTime = checkOutTime;
    final lOther$checkOutTime = other.checkOutTime;
    if (_$data.containsKey('checkOutTime') !=
        other._$data.containsKey('checkOutTime')) {
      return false;
    }
    if (l$checkOutTime != lOther$checkOutTime) {
      return false;
    }
    final l$settings = settings;
    final lOther$settings = other.settings;
    if (_$data.containsKey('settings') !=
        other._$data.containsKey('settings')) {
      return false;
    }
    if (l$settings != lOther$settings) {
      return false;
    }
    final l$photos = photos;
    final lOther$photos = other.photos;
    if (_$data.containsKey('photos') != other._$data.containsKey('photos')) {
      return false;
    }
    if (l$photos != null && lOther$photos != null) {
      if (l$photos.length != lOther$photos.length) {
        return false;
      }
      for (int i = 0; i < l$photos.length; i++) {
        final l$photos$entry = l$photos[i];
        final lOther$photos$entry = lOther$photos[i];
        if (l$photos$entry != lOther$photos$entry) {
          return false;
        }
      }
    } else if (l$photos != lOther$photos) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$address = address;
    final l$timezone = timezone;
    final l$taxPercentage = taxPercentage;
    final l$logoUrl = logoUrl;
    final l$phone = phone;
    final l$email = email;
    final l$checkInTime = checkInTime;
    final l$checkOutTime = checkOutTime;
    final l$settings = settings;
    final l$photos = photos;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('address') ? l$address : const {},
      _$data.containsKey('timezone') ? l$timezone : const {},
      _$data.containsKey('taxPercentage') ? l$taxPercentage : const {},
      _$data.containsKey('logoUrl') ? l$logoUrl : const {},
      _$data.containsKey('phone') ? l$phone : const {},
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('checkInTime') ? l$checkInTime : const {},
      _$data.containsKey('checkOutTime') ? l$checkOutTime : const {},
      _$data.containsKey('settings') ? l$settings : const {},
      _$data.containsKey('photos')
          ? l$photos == null
              ? null
              : Object.hashAll(l$photos.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdatePropertyInput<TRes> {
  factory CopyWith$Input$UpdatePropertyInput(
    Input$UpdatePropertyInput instance,
    TRes Function(Input$UpdatePropertyInput) then,
  ) = _CopyWithImpl$Input$UpdatePropertyInput;

  factory CopyWith$Input$UpdatePropertyInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdatePropertyInput;

  TRes call({
    String? name,
    String? address,
    String? timezone,
    double? taxPercentage,
    String? logoUrl,
    String? phone,
    String? email,
    String? checkInTime,
    String? checkOutTime,
    String? settings,
    List<String?>? photos,
  });
}

class _CopyWithImpl$Input$UpdatePropertyInput<TRes>
    implements CopyWith$Input$UpdatePropertyInput<TRes> {
  _CopyWithImpl$Input$UpdatePropertyInput(
    this._instance,
    this._then,
  );

  final Input$UpdatePropertyInput _instance;

  final TRes Function(Input$UpdatePropertyInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? address = _undefined,
    Object? timezone = _undefined,
    Object? taxPercentage = _undefined,
    Object? logoUrl = _undefined,
    Object? phone = _undefined,
    Object? email = _undefined,
    Object? checkInTime = _undefined,
    Object? checkOutTime = _undefined,
    Object? settings = _undefined,
    Object? photos = _undefined,
  }) =>
      _then(Input$UpdatePropertyInput._({
        ..._instance._$data,
        if (name != _undefined) 'name': (name as String?),
        if (address != _undefined) 'address': (address as String?),
        if (timezone != _undefined) 'timezone': (timezone as String?),
        if (taxPercentage != _undefined)
          'taxPercentage': (taxPercentage as double?),
        if (logoUrl != _undefined) 'logoUrl': (logoUrl as String?),
        if (phone != _undefined) 'phone': (phone as String?),
        if (email != _undefined) 'email': (email as String?),
        if (checkInTime != _undefined) 'checkInTime': (checkInTime as String?),
        if (checkOutTime != _undefined)
          'checkOutTime': (checkOutTime as String?),
        if (settings != _undefined) 'settings': (settings as String?),
        if (photos != _undefined) 'photos': (photos as List<String?>?),
      }));
}

class _CopyWithStubImpl$Input$UpdatePropertyInput<TRes>
    implements CopyWith$Input$UpdatePropertyInput<TRes> {
  _CopyWithStubImpl$Input$UpdatePropertyInput(this._res);

  TRes _res;

  call({
    String? name,
    String? address,
    String? timezone,
    double? taxPercentage,
    String? logoUrl,
    String? phone,
    String? email,
    String? checkInTime,
    String? checkOutTime,
    String? settings,
    List<String?>? photos,
  }) =>
      _res;
}

class Input$CreateRoomTypeInput {
  factory Input$CreateRoomTypeInput({
    required String name,
    required int capacity,
    required double defaultPrice,
    required String propertyId,
  }) =>
      Input$CreateRoomTypeInput._({
        r'name': name,
        r'capacity': capacity,
        r'defaultPrice': defaultPrice,
        r'propertyId': propertyId,
      });

  Input$CreateRoomTypeInput._(this._$data);

  factory Input$CreateRoomTypeInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$capacity = data['capacity'];
    result$data['capacity'] = (l$capacity as int);
    final l$defaultPrice = data['defaultPrice'];
    result$data['defaultPrice'] = (l$defaultPrice as num).toDouble();
    final l$propertyId = data['propertyId'];
    result$data['propertyId'] = (l$propertyId as String);
    return Input$CreateRoomTypeInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  int get capacity => (_$data['capacity'] as int);

  double get defaultPrice => (_$data['defaultPrice'] as double);

  String get propertyId => (_$data['propertyId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$capacity = capacity;
    result$data['capacity'] = l$capacity;
    final l$defaultPrice = defaultPrice;
    result$data['defaultPrice'] = l$defaultPrice;
    final l$propertyId = propertyId;
    result$data['propertyId'] = l$propertyId;
    return result$data;
  }

  CopyWith$Input$CreateRoomTypeInput<Input$CreateRoomTypeInput> get copyWith =>
      CopyWith$Input$CreateRoomTypeInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CreateRoomTypeInput) ||
        runtimeType != other.runtimeType) {
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
    final l$propertyId = propertyId;
    final lOther$propertyId = other.propertyId;
    if (l$propertyId != lOther$propertyId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$capacity = capacity;
    final l$defaultPrice = defaultPrice;
    final l$propertyId = propertyId;
    return Object.hashAll([
      l$name,
      l$capacity,
      l$defaultPrice,
      l$propertyId,
    ]);
  }
}

abstract class CopyWith$Input$CreateRoomTypeInput<TRes> {
  factory CopyWith$Input$CreateRoomTypeInput(
    Input$CreateRoomTypeInput instance,
    TRes Function(Input$CreateRoomTypeInput) then,
  ) = _CopyWithImpl$Input$CreateRoomTypeInput;

  factory CopyWith$Input$CreateRoomTypeInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateRoomTypeInput;

  TRes call({
    String? name,
    int? capacity,
    double? defaultPrice,
    String? propertyId,
  });
}

class _CopyWithImpl$Input$CreateRoomTypeInput<TRes>
    implements CopyWith$Input$CreateRoomTypeInput<TRes> {
  _CopyWithImpl$Input$CreateRoomTypeInput(
    this._instance,
    this._then,
  );

  final Input$CreateRoomTypeInput _instance;

  final TRes Function(Input$CreateRoomTypeInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? capacity = _undefined,
    Object? defaultPrice = _undefined,
    Object? propertyId = _undefined,
  }) =>
      _then(Input$CreateRoomTypeInput._({
        ..._instance._$data,
        if (name != _undefined && name != null) 'name': (name as String),
        if (capacity != _undefined && capacity != null)
          'capacity': (capacity as int),
        if (defaultPrice != _undefined && defaultPrice != null)
          'defaultPrice': (defaultPrice as double),
        if (propertyId != _undefined && propertyId != null)
          'propertyId': (propertyId as String),
      }));
}

class _CopyWithStubImpl$Input$CreateRoomTypeInput<TRes>
    implements CopyWith$Input$CreateRoomTypeInput<TRes> {
  _CopyWithStubImpl$Input$CreateRoomTypeInput(this._res);

  TRes _res;

  call({
    String? name,
    int? capacity,
    double? defaultPrice,
    String? propertyId,
  }) =>
      _res;
}

class Input$CreateRoomInput {
  factory Input$CreateRoomInput({
    required String roomNumber,
    required String roomTypeId,
  }) =>
      Input$CreateRoomInput._({
        r'roomNumber': roomNumber,
        r'roomTypeId': roomTypeId,
      });

  Input$CreateRoomInput._(this._$data);

  factory Input$CreateRoomInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$roomNumber = data['roomNumber'];
    result$data['roomNumber'] = (l$roomNumber as String);
    final l$roomTypeId = data['roomTypeId'];
    result$data['roomTypeId'] = (l$roomTypeId as String);
    return Input$CreateRoomInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get roomNumber => (_$data['roomNumber'] as String);

  String get roomTypeId => (_$data['roomTypeId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$roomNumber = roomNumber;
    result$data['roomNumber'] = l$roomNumber;
    final l$roomTypeId = roomTypeId;
    result$data['roomTypeId'] = l$roomTypeId;
    return result$data;
  }

  CopyWith$Input$CreateRoomInput<Input$CreateRoomInput> get copyWith =>
      CopyWith$Input$CreateRoomInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CreateRoomInput) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$roomNumber = roomNumber;
    final lOther$roomNumber = other.roomNumber;
    if (l$roomNumber != lOther$roomNumber) {
      return false;
    }
    final l$roomTypeId = roomTypeId;
    final lOther$roomTypeId = other.roomTypeId;
    if (l$roomTypeId != lOther$roomTypeId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$roomNumber = roomNumber;
    final l$roomTypeId = roomTypeId;
    return Object.hashAll([
      l$roomNumber,
      l$roomTypeId,
    ]);
  }
}

abstract class CopyWith$Input$CreateRoomInput<TRes> {
  factory CopyWith$Input$CreateRoomInput(
    Input$CreateRoomInput instance,
    TRes Function(Input$CreateRoomInput) then,
  ) = _CopyWithImpl$Input$CreateRoomInput;

  factory CopyWith$Input$CreateRoomInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateRoomInput;

  TRes call({
    String? roomNumber,
    String? roomTypeId,
  });
}

class _CopyWithImpl$Input$CreateRoomInput<TRes>
    implements CopyWith$Input$CreateRoomInput<TRes> {
  _CopyWithImpl$Input$CreateRoomInput(
    this._instance,
    this._then,
  );

  final Input$CreateRoomInput _instance;

  final TRes Function(Input$CreateRoomInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? roomNumber = _undefined,
    Object? roomTypeId = _undefined,
  }) =>
      _then(Input$CreateRoomInput._({
        ..._instance._$data,
        if (roomNumber != _undefined && roomNumber != null)
          'roomNumber': (roomNumber as String),
        if (roomTypeId != _undefined && roomTypeId != null)
          'roomTypeId': (roomTypeId as String),
      }));
}

class _CopyWithStubImpl$Input$CreateRoomInput<TRes>
    implements CopyWith$Input$CreateRoomInput<TRes> {
  _CopyWithStubImpl$Input$CreateRoomInput(this._res);

  TRes _res;

  call({
    String? roomNumber,
    String? roomTypeId,
  }) =>
      _res;
}

class Input$UpdateRoomTypeInput {
  factory Input$UpdateRoomTypeInput({
    String? name,
    int? capacity,
    double? defaultPrice,
  }) =>
      Input$UpdateRoomTypeInput._({
        if (name != null) r'name': name,
        if (capacity != null) r'capacity': capacity,
        if (defaultPrice != null) r'defaultPrice': defaultPrice,
      });

  Input$UpdateRoomTypeInput._(this._$data);

  factory Input$UpdateRoomTypeInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('capacity')) {
      final l$capacity = data['capacity'];
      result$data['capacity'] = (l$capacity as int?);
    }
    if (data.containsKey('defaultPrice')) {
      final l$defaultPrice = data['defaultPrice'];
      result$data['defaultPrice'] = (l$defaultPrice as num?)?.toDouble();
    }
    return Input$UpdateRoomTypeInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  int? get capacity => (_$data['capacity'] as int?);

  double? get defaultPrice => (_$data['defaultPrice'] as double?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('capacity')) {
      final l$capacity = capacity;
      result$data['capacity'] = l$capacity;
    }
    if (_$data.containsKey('defaultPrice')) {
      final l$defaultPrice = defaultPrice;
      result$data['defaultPrice'] = l$defaultPrice;
    }
    return result$data;
  }

  CopyWith$Input$UpdateRoomTypeInput<Input$UpdateRoomTypeInput> get copyWith =>
      CopyWith$Input$UpdateRoomTypeInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$UpdateRoomTypeInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$capacity = capacity;
    final lOther$capacity = other.capacity;
    if (_$data.containsKey('capacity') !=
        other._$data.containsKey('capacity')) {
      return false;
    }
    if (l$capacity != lOther$capacity) {
      return false;
    }
    final l$defaultPrice = defaultPrice;
    final lOther$defaultPrice = other.defaultPrice;
    if (_$data.containsKey('defaultPrice') !=
        other._$data.containsKey('defaultPrice')) {
      return false;
    }
    if (l$defaultPrice != lOther$defaultPrice) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$capacity = capacity;
    final l$defaultPrice = defaultPrice;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('capacity') ? l$capacity : const {},
      _$data.containsKey('defaultPrice') ? l$defaultPrice : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateRoomTypeInput<TRes> {
  factory CopyWith$Input$UpdateRoomTypeInput(
    Input$UpdateRoomTypeInput instance,
    TRes Function(Input$UpdateRoomTypeInput) then,
  ) = _CopyWithImpl$Input$UpdateRoomTypeInput;

  factory CopyWith$Input$UpdateRoomTypeInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateRoomTypeInput;

  TRes call({
    String? name,
    int? capacity,
    double? defaultPrice,
  });
}

class _CopyWithImpl$Input$UpdateRoomTypeInput<TRes>
    implements CopyWith$Input$UpdateRoomTypeInput<TRes> {
  _CopyWithImpl$Input$UpdateRoomTypeInput(
    this._instance,
    this._then,
  );

  final Input$UpdateRoomTypeInput _instance;

  final TRes Function(Input$UpdateRoomTypeInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? capacity = _undefined,
    Object? defaultPrice = _undefined,
  }) =>
      _then(Input$UpdateRoomTypeInput._({
        ..._instance._$data,
        if (name != _undefined) 'name': (name as String?),
        if (capacity != _undefined) 'capacity': (capacity as int?),
        if (defaultPrice != _undefined)
          'defaultPrice': (defaultPrice as double?),
      }));
}

class _CopyWithStubImpl$Input$UpdateRoomTypeInput<TRes>
    implements CopyWith$Input$UpdateRoomTypeInput<TRes> {
  _CopyWithStubImpl$Input$UpdateRoomTypeInput(this._res);

  TRes _res;

  call({
    String? name,
    int? capacity,
    double? defaultPrice,
  }) =>
      _res;
}

class Input$UpdateRoomInput {
  factory Input$UpdateRoomInput({
    String? roomNumber,
    String? roomTypeId,
    Enum$RoomStatus? status,
    Enum$HousekeepingStatus? housekeepingStatus,
    bool? priorityCleaning,
  }) =>
      Input$UpdateRoomInput._({
        if (roomNumber != null) r'roomNumber': roomNumber,
        if (roomTypeId != null) r'roomTypeId': roomTypeId,
        if (status != null) r'status': status,
        if (housekeepingStatus != null)
          r'housekeepingStatus': housekeepingStatus,
        if (priorityCleaning != null) r'priorityCleaning': priorityCleaning,
      });

  Input$UpdateRoomInput._(this._$data);

  factory Input$UpdateRoomInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('roomNumber')) {
      final l$roomNumber = data['roomNumber'];
      result$data['roomNumber'] = (l$roomNumber as String?);
    }
    if (data.containsKey('roomTypeId')) {
      final l$roomTypeId = data['roomTypeId'];
      result$data['roomTypeId'] = (l$roomTypeId as String?);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$RoomStatus((l$status as String));
    }
    if (data.containsKey('housekeepingStatus')) {
      final l$housekeepingStatus = data['housekeepingStatus'];
      result$data['housekeepingStatus'] = l$housekeepingStatus == null
          ? null
          : fromJson$Enum$HousekeepingStatus((l$housekeepingStatus as String));
    }
    if (data.containsKey('priorityCleaning')) {
      final l$priorityCleaning = data['priorityCleaning'];
      result$data['priorityCleaning'] = (l$priorityCleaning as bool?);
    }
    return Input$UpdateRoomInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get roomNumber => (_$data['roomNumber'] as String?);

  String? get roomTypeId => (_$data['roomTypeId'] as String?);

  Enum$RoomStatus? get status => (_$data['status'] as Enum$RoomStatus?);

  Enum$HousekeepingStatus? get housekeepingStatus =>
      (_$data['housekeepingStatus'] as Enum$HousekeepingStatus?);

  bool? get priorityCleaning => (_$data['priorityCleaning'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('roomNumber')) {
      final l$roomNumber = roomNumber;
      result$data['roomNumber'] = l$roomNumber;
    }
    if (_$data.containsKey('roomTypeId')) {
      final l$roomTypeId = roomTypeId;
      result$data['roomTypeId'] = l$roomTypeId;
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] =
          l$status == null ? null : toJson$Enum$RoomStatus(l$status);
    }
    if (_$data.containsKey('housekeepingStatus')) {
      final l$housekeepingStatus = housekeepingStatus;
      result$data['housekeepingStatus'] = l$housekeepingStatus == null
          ? null
          : toJson$Enum$HousekeepingStatus(l$housekeepingStatus);
    }
    if (_$data.containsKey('priorityCleaning')) {
      final l$priorityCleaning = priorityCleaning;
      result$data['priorityCleaning'] = l$priorityCleaning;
    }
    return result$data;
  }

  CopyWith$Input$UpdateRoomInput<Input$UpdateRoomInput> get copyWith =>
      CopyWith$Input$UpdateRoomInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$UpdateRoomInput) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$roomNumber = roomNumber;
    final lOther$roomNumber = other.roomNumber;
    if (_$data.containsKey('roomNumber') !=
        other._$data.containsKey('roomNumber')) {
      return false;
    }
    if (l$roomNumber != lOther$roomNumber) {
      return false;
    }
    final l$roomTypeId = roomTypeId;
    final lOther$roomTypeId = other.roomTypeId;
    if (_$data.containsKey('roomTypeId') !=
        other._$data.containsKey('roomTypeId')) {
      return false;
    }
    if (l$roomTypeId != lOther$roomTypeId) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    final l$housekeepingStatus = housekeepingStatus;
    final lOther$housekeepingStatus = other.housekeepingStatus;
    if (_$data.containsKey('housekeepingStatus') !=
        other._$data.containsKey('housekeepingStatus')) {
      return false;
    }
    if (l$housekeepingStatus != lOther$housekeepingStatus) {
      return false;
    }
    final l$priorityCleaning = priorityCleaning;
    final lOther$priorityCleaning = other.priorityCleaning;
    if (_$data.containsKey('priorityCleaning') !=
        other._$data.containsKey('priorityCleaning')) {
      return false;
    }
    if (l$priorityCleaning != lOther$priorityCleaning) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$roomNumber = roomNumber;
    final l$roomTypeId = roomTypeId;
    final l$status = status;
    final l$housekeepingStatus = housekeepingStatus;
    final l$priorityCleaning = priorityCleaning;
    return Object.hashAll([
      _$data.containsKey('roomNumber') ? l$roomNumber : const {},
      _$data.containsKey('roomTypeId') ? l$roomTypeId : const {},
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('housekeepingStatus')
          ? l$housekeepingStatus
          : const {},
      _$data.containsKey('priorityCleaning') ? l$priorityCleaning : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateRoomInput<TRes> {
  factory CopyWith$Input$UpdateRoomInput(
    Input$UpdateRoomInput instance,
    TRes Function(Input$UpdateRoomInput) then,
  ) = _CopyWithImpl$Input$UpdateRoomInput;

  factory CopyWith$Input$UpdateRoomInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateRoomInput;

  TRes call({
    String? roomNumber,
    String? roomTypeId,
    Enum$RoomStatus? status,
    Enum$HousekeepingStatus? housekeepingStatus,
    bool? priorityCleaning,
  });
}

class _CopyWithImpl$Input$UpdateRoomInput<TRes>
    implements CopyWith$Input$UpdateRoomInput<TRes> {
  _CopyWithImpl$Input$UpdateRoomInput(
    this._instance,
    this._then,
  );

  final Input$UpdateRoomInput _instance;

  final TRes Function(Input$UpdateRoomInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? roomNumber = _undefined,
    Object? roomTypeId = _undefined,
    Object? status = _undefined,
    Object? housekeepingStatus = _undefined,
    Object? priorityCleaning = _undefined,
  }) =>
      _then(Input$UpdateRoomInput._({
        ..._instance._$data,
        if (roomNumber != _undefined) 'roomNumber': (roomNumber as String?),
        if (roomTypeId != _undefined) 'roomTypeId': (roomTypeId as String?),
        if (status != _undefined) 'status': (status as Enum$RoomStatus?),
        if (housekeepingStatus != _undefined)
          'housekeepingStatus':
              (housekeepingStatus as Enum$HousekeepingStatus?),
        if (priorityCleaning != _undefined)
          'priorityCleaning': (priorityCleaning as bool?),
      }));
}

class _CopyWithStubImpl$Input$UpdateRoomInput<TRes>
    implements CopyWith$Input$UpdateRoomInput<TRes> {
  _CopyWithStubImpl$Input$UpdateRoomInput(this._res);

  TRes _res;

  call({
    String? roomNumber,
    String? roomTypeId,
    Enum$RoomStatus? status,
    Enum$HousekeepingStatus? housekeepingStatus,
    bool? priorityCleaning,
  }) =>
      _res;
}

class Input$CreateBookingInput {
  factory Input$CreateBookingInput({
    required String guestId,
    required String propertyId,
    Enum$BookingSource? source,
    required String checkInDate,
    required String checkOutDate,
    required List<Input$BookingRoomInput> rooms,
    int? adults,
    int? children,
    String? notes,
    bool? waiveLastDayCharge,
    double? advanceAmount,
    String? advanceMethod,
  }) =>
      Input$CreateBookingInput._({
        r'guestId': guestId,
        r'propertyId': propertyId,
        if (source != null) r'source': source,
        r'checkInDate': checkInDate,
        r'checkOutDate': checkOutDate,
        r'rooms': rooms,
        if (adults != null) r'adults': adults,
        if (children != null) r'children': children,
        if (notes != null) r'notes': notes,
        if (waiveLastDayCharge != null)
          r'waiveLastDayCharge': waiveLastDayCharge,
        if (advanceAmount != null) r'advanceAmount': advanceAmount,
        if (advanceMethod != null) r'advanceMethod': advanceMethod,
      });

  Input$CreateBookingInput._(this._$data);

  factory Input$CreateBookingInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$guestId = data['guestId'];
    result$data['guestId'] = (l$guestId as String);
    final l$propertyId = data['propertyId'];
    result$data['propertyId'] = (l$propertyId as String);
    if (data.containsKey('source')) {
      final l$source = data['source'];
      result$data['source'] = fromJson$Enum$BookingSource((l$source as String));
    }
    final l$checkInDate = data['checkInDate'];
    result$data['checkInDate'] = (l$checkInDate as String);
    final l$checkOutDate = data['checkOutDate'];
    result$data['checkOutDate'] = (l$checkOutDate as String);
    final l$rooms = data['rooms'];
    result$data['rooms'] = (l$rooms as List<dynamic>)
        .map(
            (e) => Input$BookingRoomInput.fromJson((e as Map<String, dynamic>)))
        .toList();
    if (data.containsKey('adults')) {
      final l$adults = data['adults'];
      result$data['adults'] = (l$adults as int?);
    }
    if (data.containsKey('children')) {
      final l$children = data['children'];
      result$data['children'] = (l$children as int?);
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    if (data.containsKey('waiveLastDayCharge')) {
      final l$waiveLastDayCharge = data['waiveLastDayCharge'];
      result$data['waiveLastDayCharge'] = (l$waiveLastDayCharge as bool?);
    }
    if (data.containsKey('advanceAmount')) {
      final l$advanceAmount = data['advanceAmount'];
      result$data['advanceAmount'] = (l$advanceAmount as num?)?.toDouble();
    }
    if (data.containsKey('advanceMethod')) {
      final l$advanceMethod = data['advanceMethod'];
      result$data['advanceMethod'] = (l$advanceMethod as String?);
    }
    return Input$CreateBookingInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get guestId => (_$data['guestId'] as String);

  String get propertyId => (_$data['propertyId'] as String);

  Enum$BookingSource? get source => (_$data['source'] as Enum$BookingSource?);

  String get checkInDate => (_$data['checkInDate'] as String);

  String get checkOutDate => (_$data['checkOutDate'] as String);

  List<Input$BookingRoomInput> get rooms =>
      (_$data['rooms'] as List<Input$BookingRoomInput>);

  int? get adults => (_$data['adults'] as int?);

  int? get children => (_$data['children'] as int?);

  String? get notes => (_$data['notes'] as String?);

  bool? get waiveLastDayCharge => (_$data['waiveLastDayCharge'] as bool?);

  double? get advanceAmount => (_$data['advanceAmount'] as double?);

  String? get advanceMethod => (_$data['advanceMethod'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$guestId = guestId;
    result$data['guestId'] = l$guestId;
    final l$propertyId = propertyId;
    result$data['propertyId'] = l$propertyId;
    if (_$data.containsKey('source')) {
      final l$source = source;
      result$data['source'] =
          toJson$Enum$BookingSource((l$source as Enum$BookingSource));
    }
    final l$checkInDate = checkInDate;
    result$data['checkInDate'] = l$checkInDate;
    final l$checkOutDate = checkOutDate;
    result$data['checkOutDate'] = l$checkOutDate;
    final l$rooms = rooms;
    result$data['rooms'] = l$rooms.map((e) => e.toJson()).toList();
    if (_$data.containsKey('adults')) {
      final l$adults = adults;
      result$data['adults'] = l$adults;
    }
    if (_$data.containsKey('children')) {
      final l$children = children;
      result$data['children'] = l$children;
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
    if (_$data.containsKey('waiveLastDayCharge')) {
      final l$waiveLastDayCharge = waiveLastDayCharge;
      result$data['waiveLastDayCharge'] = l$waiveLastDayCharge;
    }
    if (_$data.containsKey('advanceAmount')) {
      final l$advanceAmount = advanceAmount;
      result$data['advanceAmount'] = l$advanceAmount;
    }
    if (_$data.containsKey('advanceMethod')) {
      final l$advanceMethod = advanceMethod;
      result$data['advanceMethod'] = l$advanceMethod;
    }
    return result$data;
  }

  CopyWith$Input$CreateBookingInput<Input$CreateBookingInput> get copyWith =>
      CopyWith$Input$CreateBookingInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CreateBookingInput) ||
        runtimeType != other.runtimeType) {
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
    final l$source = source;
    final lOther$source = other.source;
    if (_$data.containsKey('source') != other._$data.containsKey('source')) {
      return false;
    }
    if (l$source != lOther$source) {
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
    final l$adults = adults;
    final lOther$adults = other.adults;
    if (_$data.containsKey('adults') != other._$data.containsKey('adults')) {
      return false;
    }
    if (l$adults != lOther$adults) {
      return false;
    }
    final l$children = children;
    final lOther$children = other.children;
    if (_$data.containsKey('children') !=
        other._$data.containsKey('children')) {
      return false;
    }
    if (l$children != lOther$children) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (_$data.containsKey('notes') != other._$data.containsKey('notes')) {
      return false;
    }
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$waiveLastDayCharge = waiveLastDayCharge;
    final lOther$waiveLastDayCharge = other.waiveLastDayCharge;
    if (_$data.containsKey('waiveLastDayCharge') !=
        other._$data.containsKey('waiveLastDayCharge')) {
      return false;
    }
    if (l$waiveLastDayCharge != lOther$waiveLastDayCharge) {
      return false;
    }
    final l$advanceAmount = advanceAmount;
    final lOther$advanceAmount = other.advanceAmount;
    if (_$data.containsKey('advanceAmount') !=
        other._$data.containsKey('advanceAmount')) {
      return false;
    }
    if (l$advanceAmount != lOther$advanceAmount) {
      return false;
    }
    final l$advanceMethod = advanceMethod;
    final lOther$advanceMethod = other.advanceMethod;
    if (_$data.containsKey('advanceMethod') !=
        other._$data.containsKey('advanceMethod')) {
      return false;
    }
    if (l$advanceMethod != lOther$advanceMethod) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$guestId = guestId;
    final l$propertyId = propertyId;
    final l$source = source;
    final l$checkInDate = checkInDate;
    final l$checkOutDate = checkOutDate;
    final l$rooms = rooms;
    final l$adults = adults;
    final l$children = children;
    final l$notes = notes;
    final l$waiveLastDayCharge = waiveLastDayCharge;
    final l$advanceAmount = advanceAmount;
    final l$advanceMethod = advanceMethod;
    return Object.hashAll([
      l$guestId,
      l$propertyId,
      _$data.containsKey('source') ? l$source : const {},
      l$checkInDate,
      l$checkOutDate,
      Object.hashAll(l$rooms.map((v) => v)),
      _$data.containsKey('adults') ? l$adults : const {},
      _$data.containsKey('children') ? l$children : const {},
      _$data.containsKey('notes') ? l$notes : const {},
      _$data.containsKey('waiveLastDayCharge')
          ? l$waiveLastDayCharge
          : const {},
      _$data.containsKey('advanceAmount') ? l$advanceAmount : const {},
      _$data.containsKey('advanceMethod') ? l$advanceMethod : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreateBookingInput<TRes> {
  factory CopyWith$Input$CreateBookingInput(
    Input$CreateBookingInput instance,
    TRes Function(Input$CreateBookingInput) then,
  ) = _CopyWithImpl$Input$CreateBookingInput;

  factory CopyWith$Input$CreateBookingInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateBookingInput;

  TRes call({
    String? guestId,
    String? propertyId,
    Enum$BookingSource? source,
    String? checkInDate,
    String? checkOutDate,
    List<Input$BookingRoomInput>? rooms,
    int? adults,
    int? children,
    String? notes,
    bool? waiveLastDayCharge,
    double? advanceAmount,
    String? advanceMethod,
  });
  TRes rooms(
      Iterable<Input$BookingRoomInput> Function(
              Iterable<CopyWith$Input$BookingRoomInput<Input$BookingRoomInput>>)
          _fn);
}

class _CopyWithImpl$Input$CreateBookingInput<TRes>
    implements CopyWith$Input$CreateBookingInput<TRes> {
  _CopyWithImpl$Input$CreateBookingInput(
    this._instance,
    this._then,
  );

  final Input$CreateBookingInput _instance;

  final TRes Function(Input$CreateBookingInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? guestId = _undefined,
    Object? propertyId = _undefined,
    Object? source = _undefined,
    Object? checkInDate = _undefined,
    Object? checkOutDate = _undefined,
    Object? rooms = _undefined,
    Object? adults = _undefined,
    Object? children = _undefined,
    Object? notes = _undefined,
    Object? waiveLastDayCharge = _undefined,
    Object? advanceAmount = _undefined,
    Object? advanceMethod = _undefined,
  }) =>
      _then(Input$CreateBookingInput._({
        ..._instance._$data,
        if (guestId != _undefined && guestId != null)
          'guestId': (guestId as String),
        if (propertyId != _undefined && propertyId != null)
          'propertyId': (propertyId as String),
        if (source != _undefined && source != null)
          'source': (source as Enum$BookingSource),
        if (checkInDate != _undefined && checkInDate != null)
          'checkInDate': (checkInDate as String),
        if (checkOutDate != _undefined && checkOutDate != null)
          'checkOutDate': (checkOutDate as String),
        if (rooms != _undefined && rooms != null)
          'rooms': (rooms as List<Input$BookingRoomInput>),
        if (adults != _undefined) 'adults': (adults as int?),
        if (children != _undefined) 'children': (children as int?),
        if (notes != _undefined) 'notes': (notes as String?),
        if (waiveLastDayCharge != _undefined)
          'waiveLastDayCharge': (waiveLastDayCharge as bool?),
        if (advanceAmount != _undefined)
          'advanceAmount': (advanceAmount as double?),
        if (advanceMethod != _undefined)
          'advanceMethod': (advanceMethod as String?),
      }));

  TRes rooms(
          Iterable<Input$BookingRoomInput> Function(
                  Iterable<
                      CopyWith$Input$BookingRoomInput<Input$BookingRoomInput>>)
              _fn) =>
      call(
          rooms: _fn(_instance.rooms.map((e) => CopyWith$Input$BookingRoomInput(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Input$CreateBookingInput<TRes>
    implements CopyWith$Input$CreateBookingInput<TRes> {
  _CopyWithStubImpl$Input$CreateBookingInput(this._res);

  TRes _res;

  call({
    String? guestId,
    String? propertyId,
    Enum$BookingSource? source,
    String? checkInDate,
    String? checkOutDate,
    List<Input$BookingRoomInput>? rooms,
    int? adults,
    int? children,
    String? notes,
    bool? waiveLastDayCharge,
    double? advanceAmount,
    String? advanceMethod,
  }) =>
      _res;

  rooms(_fn) => _res;
}

class Input$BookingRoomInput {
  factory Input$BookingRoomInput({
    required String roomTypeId,
    required int quantity,
    String? roomId,
    double? priceOverride,
  }) =>
      Input$BookingRoomInput._({
        r'roomTypeId': roomTypeId,
        r'quantity': quantity,
        if (roomId != null) r'roomId': roomId,
        if (priceOverride != null) r'priceOverride': priceOverride,
      });

  Input$BookingRoomInput._(this._$data);

  factory Input$BookingRoomInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$roomTypeId = data['roomTypeId'];
    result$data['roomTypeId'] = (l$roomTypeId as String);
    final l$quantity = data['quantity'];
    result$data['quantity'] = (l$quantity as int);
    if (data.containsKey('roomId')) {
      final l$roomId = data['roomId'];
      result$data['roomId'] = (l$roomId as String?);
    }
    if (data.containsKey('priceOverride')) {
      final l$priceOverride = data['priceOverride'];
      result$data['priceOverride'] = (l$priceOverride as num?)?.toDouble();
    }
    return Input$BookingRoomInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get roomTypeId => (_$data['roomTypeId'] as String);

  int get quantity => (_$data['quantity'] as int);

  String? get roomId => (_$data['roomId'] as String?);

  double? get priceOverride => (_$data['priceOverride'] as double?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$roomTypeId = roomTypeId;
    result$data['roomTypeId'] = l$roomTypeId;
    final l$quantity = quantity;
    result$data['quantity'] = l$quantity;
    if (_$data.containsKey('roomId')) {
      final l$roomId = roomId;
      result$data['roomId'] = l$roomId;
    }
    if (_$data.containsKey('priceOverride')) {
      final l$priceOverride = priceOverride;
      result$data['priceOverride'] = l$priceOverride;
    }
    return result$data;
  }

  CopyWith$Input$BookingRoomInput<Input$BookingRoomInput> get copyWith =>
      CopyWith$Input$BookingRoomInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$BookingRoomInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$roomTypeId = roomTypeId;
    final lOther$roomTypeId = other.roomTypeId;
    if (l$roomTypeId != lOther$roomTypeId) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) {
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
    final l$priceOverride = priceOverride;
    final lOther$priceOverride = other.priceOverride;
    if (_$data.containsKey('priceOverride') !=
        other._$data.containsKey('priceOverride')) {
      return false;
    }
    if (l$priceOverride != lOther$priceOverride) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$roomTypeId = roomTypeId;
    final l$quantity = quantity;
    final l$roomId = roomId;
    final l$priceOverride = priceOverride;
    return Object.hashAll([
      l$roomTypeId,
      l$quantity,
      _$data.containsKey('roomId') ? l$roomId : const {},
      _$data.containsKey('priceOverride') ? l$priceOverride : const {},
    ]);
  }
}

abstract class CopyWith$Input$BookingRoomInput<TRes> {
  factory CopyWith$Input$BookingRoomInput(
    Input$BookingRoomInput instance,
    TRes Function(Input$BookingRoomInput) then,
  ) = _CopyWithImpl$Input$BookingRoomInput;

  factory CopyWith$Input$BookingRoomInput.stub(TRes res) =
      _CopyWithStubImpl$Input$BookingRoomInput;

  TRes call({
    String? roomTypeId,
    int? quantity,
    String? roomId,
    double? priceOverride,
  });
}

class _CopyWithImpl$Input$BookingRoomInput<TRes>
    implements CopyWith$Input$BookingRoomInput<TRes> {
  _CopyWithImpl$Input$BookingRoomInput(
    this._instance,
    this._then,
  );

  final Input$BookingRoomInput _instance;

  final TRes Function(Input$BookingRoomInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? roomTypeId = _undefined,
    Object? quantity = _undefined,
    Object? roomId = _undefined,
    Object? priceOverride = _undefined,
  }) =>
      _then(Input$BookingRoomInput._({
        ..._instance._$data,
        if (roomTypeId != _undefined && roomTypeId != null)
          'roomTypeId': (roomTypeId as String),
        if (quantity != _undefined && quantity != null)
          'quantity': (quantity as int),
        if (roomId != _undefined) 'roomId': (roomId as String?),
        if (priceOverride != _undefined)
          'priceOverride': (priceOverride as double?),
      }));
}

class _CopyWithStubImpl$Input$BookingRoomInput<TRes>
    implements CopyWith$Input$BookingRoomInput<TRes> {
  _CopyWithStubImpl$Input$BookingRoomInput(this._res);

  TRes _res;

  call({
    String? roomTypeId,
    int? quantity,
    String? roomId,
    double? priceOverride,
  }) =>
      _res;
}

class Input$UpdateBookingInput {
  factory Input$UpdateBookingInput({
    Enum$BookingStatus? status,
    String? checkInDate,
    String? checkOutDate,
    int? adults,
    int? children,
    double? discountAmount,
    String? discountType,
    String? notes,
    bool? waiveLastDayCharge,
    String? actualCheckOut,
    double? totalAmount,
  }) =>
      Input$UpdateBookingInput._({
        if (status != null) r'status': status,
        if (checkInDate != null) r'checkInDate': checkInDate,
        if (checkOutDate != null) r'checkOutDate': checkOutDate,
        if (adults != null) r'adults': adults,
        if (children != null) r'children': children,
        if (discountAmount != null) r'discountAmount': discountAmount,
        if (discountType != null) r'discountType': discountType,
        if (notes != null) r'notes': notes,
        if (waiveLastDayCharge != null)
          r'waiveLastDayCharge': waiveLastDayCharge,
        if (actualCheckOut != null) r'actualCheckOut': actualCheckOut,
        if (totalAmount != null) r'totalAmount': totalAmount,
      });

  Input$UpdateBookingInput._(this._$data);

  factory Input$UpdateBookingInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$BookingStatus((l$status as String));
    }
    if (data.containsKey('checkInDate')) {
      final l$checkInDate = data['checkInDate'];
      result$data['checkInDate'] = (l$checkInDate as String?);
    }
    if (data.containsKey('checkOutDate')) {
      final l$checkOutDate = data['checkOutDate'];
      result$data['checkOutDate'] = (l$checkOutDate as String?);
    }
    if (data.containsKey('adults')) {
      final l$adults = data['adults'];
      result$data['adults'] = (l$adults as int?);
    }
    if (data.containsKey('children')) {
      final l$children = data['children'];
      result$data['children'] = (l$children as int?);
    }
    if (data.containsKey('discountAmount')) {
      final l$discountAmount = data['discountAmount'];
      result$data['discountAmount'] = (l$discountAmount as num?)?.toDouble();
    }
    if (data.containsKey('discountType')) {
      final l$discountType = data['discountType'];
      result$data['discountType'] = (l$discountType as String?);
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    if (data.containsKey('waiveLastDayCharge')) {
      final l$waiveLastDayCharge = data['waiveLastDayCharge'];
      result$data['waiveLastDayCharge'] = (l$waiveLastDayCharge as bool?);
    }
    if (data.containsKey('actualCheckOut')) {
      final l$actualCheckOut = data['actualCheckOut'];
      result$data['actualCheckOut'] = (l$actualCheckOut as String?);
    }
    if (data.containsKey('totalAmount')) {
      final l$totalAmount = data['totalAmount'];
      result$data['totalAmount'] = (l$totalAmount as num?)?.toDouble();
    }
    return Input$UpdateBookingInput._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$BookingStatus? get status => (_$data['status'] as Enum$BookingStatus?);

  String? get checkInDate => (_$data['checkInDate'] as String?);

  String? get checkOutDate => (_$data['checkOutDate'] as String?);

  int? get adults => (_$data['adults'] as int?);

  int? get children => (_$data['children'] as int?);

  double? get discountAmount => (_$data['discountAmount'] as double?);

  String? get discountType => (_$data['discountType'] as String?);

  String? get notes => (_$data['notes'] as String?);

  bool? get waiveLastDayCharge => (_$data['waiveLastDayCharge'] as bool?);

  String? get actualCheckOut => (_$data['actualCheckOut'] as String?);

  double? get totalAmount => (_$data['totalAmount'] as double?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] =
          l$status == null ? null : toJson$Enum$BookingStatus(l$status);
    }
    if (_$data.containsKey('checkInDate')) {
      final l$checkInDate = checkInDate;
      result$data['checkInDate'] = l$checkInDate;
    }
    if (_$data.containsKey('checkOutDate')) {
      final l$checkOutDate = checkOutDate;
      result$data['checkOutDate'] = l$checkOutDate;
    }
    if (_$data.containsKey('adults')) {
      final l$adults = adults;
      result$data['adults'] = l$adults;
    }
    if (_$data.containsKey('children')) {
      final l$children = children;
      result$data['children'] = l$children;
    }
    if (_$data.containsKey('discountAmount')) {
      final l$discountAmount = discountAmount;
      result$data['discountAmount'] = l$discountAmount;
    }
    if (_$data.containsKey('discountType')) {
      final l$discountType = discountType;
      result$data['discountType'] = l$discountType;
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
    if (_$data.containsKey('waiveLastDayCharge')) {
      final l$waiveLastDayCharge = waiveLastDayCharge;
      result$data['waiveLastDayCharge'] = l$waiveLastDayCharge;
    }
    if (_$data.containsKey('actualCheckOut')) {
      final l$actualCheckOut = actualCheckOut;
      result$data['actualCheckOut'] = l$actualCheckOut;
    }
    if (_$data.containsKey('totalAmount')) {
      final l$totalAmount = totalAmount;
      result$data['totalAmount'] = l$totalAmount;
    }
    return result$data;
  }

  CopyWith$Input$UpdateBookingInput<Input$UpdateBookingInput> get copyWith =>
      CopyWith$Input$UpdateBookingInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$UpdateBookingInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
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
    final l$adults = adults;
    final lOther$adults = other.adults;
    if (_$data.containsKey('adults') != other._$data.containsKey('adults')) {
      return false;
    }
    if (l$adults != lOther$adults) {
      return false;
    }
    final l$children = children;
    final lOther$children = other.children;
    if (_$data.containsKey('children') !=
        other._$data.containsKey('children')) {
      return false;
    }
    if (l$children != lOther$children) {
      return false;
    }
    final l$discountAmount = discountAmount;
    final lOther$discountAmount = other.discountAmount;
    if (_$data.containsKey('discountAmount') !=
        other._$data.containsKey('discountAmount')) {
      return false;
    }
    if (l$discountAmount != lOther$discountAmount) {
      return false;
    }
    final l$discountType = discountType;
    final lOther$discountType = other.discountType;
    if (_$data.containsKey('discountType') !=
        other._$data.containsKey('discountType')) {
      return false;
    }
    if (l$discountType != lOther$discountType) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (_$data.containsKey('notes') != other._$data.containsKey('notes')) {
      return false;
    }
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$waiveLastDayCharge = waiveLastDayCharge;
    final lOther$waiveLastDayCharge = other.waiveLastDayCharge;
    if (_$data.containsKey('waiveLastDayCharge') !=
        other._$data.containsKey('waiveLastDayCharge')) {
      return false;
    }
    if (l$waiveLastDayCharge != lOther$waiveLastDayCharge) {
      return false;
    }
    final l$actualCheckOut = actualCheckOut;
    final lOther$actualCheckOut = other.actualCheckOut;
    if (_$data.containsKey('actualCheckOut') !=
        other._$data.containsKey('actualCheckOut')) {
      return false;
    }
    if (l$actualCheckOut != lOther$actualCheckOut) {
      return false;
    }
    final l$totalAmount = totalAmount;
    final lOther$totalAmount = other.totalAmount;
    if (_$data.containsKey('totalAmount') !=
        other._$data.containsKey('totalAmount')) {
      return false;
    }
    if (l$totalAmount != lOther$totalAmount) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$status = status;
    final l$checkInDate = checkInDate;
    final l$checkOutDate = checkOutDate;
    final l$adults = adults;
    final l$children = children;
    final l$discountAmount = discountAmount;
    final l$discountType = discountType;
    final l$notes = notes;
    final l$waiveLastDayCharge = waiveLastDayCharge;
    final l$actualCheckOut = actualCheckOut;
    final l$totalAmount = totalAmount;
    return Object.hashAll([
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('checkInDate') ? l$checkInDate : const {},
      _$data.containsKey('checkOutDate') ? l$checkOutDate : const {},
      _$data.containsKey('adults') ? l$adults : const {},
      _$data.containsKey('children') ? l$children : const {},
      _$data.containsKey('discountAmount') ? l$discountAmount : const {},
      _$data.containsKey('discountType') ? l$discountType : const {},
      _$data.containsKey('notes') ? l$notes : const {},
      _$data.containsKey('waiveLastDayCharge')
          ? l$waiveLastDayCharge
          : const {},
      _$data.containsKey('actualCheckOut') ? l$actualCheckOut : const {},
      _$data.containsKey('totalAmount') ? l$totalAmount : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateBookingInput<TRes> {
  factory CopyWith$Input$UpdateBookingInput(
    Input$UpdateBookingInput instance,
    TRes Function(Input$UpdateBookingInput) then,
  ) = _CopyWithImpl$Input$UpdateBookingInput;

  factory CopyWith$Input$UpdateBookingInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateBookingInput;

  TRes call({
    Enum$BookingStatus? status,
    String? checkInDate,
    String? checkOutDate,
    int? adults,
    int? children,
    double? discountAmount,
    String? discountType,
    String? notes,
    bool? waiveLastDayCharge,
    String? actualCheckOut,
    double? totalAmount,
  });
}

class _CopyWithImpl$Input$UpdateBookingInput<TRes>
    implements CopyWith$Input$UpdateBookingInput<TRes> {
  _CopyWithImpl$Input$UpdateBookingInput(
    this._instance,
    this._then,
  );

  final Input$UpdateBookingInput _instance;

  final TRes Function(Input$UpdateBookingInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? status = _undefined,
    Object? checkInDate = _undefined,
    Object? checkOutDate = _undefined,
    Object? adults = _undefined,
    Object? children = _undefined,
    Object? discountAmount = _undefined,
    Object? discountType = _undefined,
    Object? notes = _undefined,
    Object? waiveLastDayCharge = _undefined,
    Object? actualCheckOut = _undefined,
    Object? totalAmount = _undefined,
  }) =>
      _then(Input$UpdateBookingInput._({
        ..._instance._$data,
        if (status != _undefined) 'status': (status as Enum$BookingStatus?),
        if (checkInDate != _undefined) 'checkInDate': (checkInDate as String?),
        if (checkOutDate != _undefined)
          'checkOutDate': (checkOutDate as String?),
        if (adults != _undefined) 'adults': (adults as int?),
        if (children != _undefined) 'children': (children as int?),
        if (discountAmount != _undefined)
          'discountAmount': (discountAmount as double?),
        if (discountType != _undefined)
          'discountType': (discountType as String?),
        if (notes != _undefined) 'notes': (notes as String?),
        if (waiveLastDayCharge != _undefined)
          'waiveLastDayCharge': (waiveLastDayCharge as bool?),
        if (actualCheckOut != _undefined)
          'actualCheckOut': (actualCheckOut as String?),
        if (totalAmount != _undefined) 'totalAmount': (totalAmount as double?),
      }));
}

class _CopyWithStubImpl$Input$UpdateBookingInput<TRes>
    implements CopyWith$Input$UpdateBookingInput<TRes> {
  _CopyWithStubImpl$Input$UpdateBookingInput(this._res);

  TRes _res;

  call({
    Enum$BookingStatus? status,
    String? checkInDate,
    String? checkOutDate,
    int? adults,
    int? children,
    double? discountAmount,
    String? discountType,
    String? notes,
    bool? waiveLastDayCharge,
    String? actualCheckOut,
    double? totalAmount,
  }) =>
      _res;
}

class Input$UpdateBookingRoomInput {
  factory Input$UpdateBookingRoomInput({
    String? roomId,
    String? roomTypeId,
    double? priceOverride,
    String? checkInDate,
    String? checkOutDate,
  }) =>
      Input$UpdateBookingRoomInput._({
        if (roomId != null) r'roomId': roomId,
        if (roomTypeId != null) r'roomTypeId': roomTypeId,
        if (priceOverride != null) r'priceOverride': priceOverride,
        if (checkInDate != null) r'checkInDate': checkInDate,
        if (checkOutDate != null) r'checkOutDate': checkOutDate,
      });

  Input$UpdateBookingRoomInput._(this._$data);

  factory Input$UpdateBookingRoomInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('roomId')) {
      final l$roomId = data['roomId'];
      result$data['roomId'] = (l$roomId as String?);
    }
    if (data.containsKey('roomTypeId')) {
      final l$roomTypeId = data['roomTypeId'];
      result$data['roomTypeId'] = (l$roomTypeId as String?);
    }
    if (data.containsKey('priceOverride')) {
      final l$priceOverride = data['priceOverride'];
      result$data['priceOverride'] = (l$priceOverride as num?)?.toDouble();
    }
    if (data.containsKey('checkInDate')) {
      final l$checkInDate = data['checkInDate'];
      result$data['checkInDate'] = (l$checkInDate as String?);
    }
    if (data.containsKey('checkOutDate')) {
      final l$checkOutDate = data['checkOutDate'];
      result$data['checkOutDate'] = (l$checkOutDate as String?);
    }
    return Input$UpdateBookingRoomInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get roomId => (_$data['roomId'] as String?);

  String? get roomTypeId => (_$data['roomTypeId'] as String?);

  double? get priceOverride => (_$data['priceOverride'] as double?);

  String? get checkInDate => (_$data['checkInDate'] as String?);

  String? get checkOutDate => (_$data['checkOutDate'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('roomId')) {
      final l$roomId = roomId;
      result$data['roomId'] = l$roomId;
    }
    if (_$data.containsKey('roomTypeId')) {
      final l$roomTypeId = roomTypeId;
      result$data['roomTypeId'] = l$roomTypeId;
    }
    if (_$data.containsKey('priceOverride')) {
      final l$priceOverride = priceOverride;
      result$data['priceOverride'] = l$priceOverride;
    }
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

  CopyWith$Input$UpdateBookingRoomInput<Input$UpdateBookingRoomInput>
      get copyWith => CopyWith$Input$UpdateBookingRoomInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$UpdateBookingRoomInput) ||
        runtimeType != other.runtimeType) {
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
    if (_$data.containsKey('roomTypeId') !=
        other._$data.containsKey('roomTypeId')) {
      return false;
    }
    if (l$roomTypeId != lOther$roomTypeId) {
      return false;
    }
    final l$priceOverride = priceOverride;
    final lOther$priceOverride = other.priceOverride;
    if (_$data.containsKey('priceOverride') !=
        other._$data.containsKey('priceOverride')) {
      return false;
    }
    if (l$priceOverride != lOther$priceOverride) {
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
    final l$roomId = roomId;
    final l$roomTypeId = roomTypeId;
    final l$priceOverride = priceOverride;
    final l$checkInDate = checkInDate;
    final l$checkOutDate = checkOutDate;
    return Object.hashAll([
      _$data.containsKey('roomId') ? l$roomId : const {},
      _$data.containsKey('roomTypeId') ? l$roomTypeId : const {},
      _$data.containsKey('priceOverride') ? l$priceOverride : const {},
      _$data.containsKey('checkInDate') ? l$checkInDate : const {},
      _$data.containsKey('checkOutDate') ? l$checkOutDate : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateBookingRoomInput<TRes> {
  factory CopyWith$Input$UpdateBookingRoomInput(
    Input$UpdateBookingRoomInput instance,
    TRes Function(Input$UpdateBookingRoomInput) then,
  ) = _CopyWithImpl$Input$UpdateBookingRoomInput;

  factory CopyWith$Input$UpdateBookingRoomInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateBookingRoomInput;

  TRes call({
    String? roomId,
    String? roomTypeId,
    double? priceOverride,
    String? checkInDate,
    String? checkOutDate,
  });
}

class _CopyWithImpl$Input$UpdateBookingRoomInput<TRes>
    implements CopyWith$Input$UpdateBookingRoomInput<TRes> {
  _CopyWithImpl$Input$UpdateBookingRoomInput(
    this._instance,
    this._then,
  );

  final Input$UpdateBookingRoomInput _instance;

  final TRes Function(Input$UpdateBookingRoomInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? roomId = _undefined,
    Object? roomTypeId = _undefined,
    Object? priceOverride = _undefined,
    Object? checkInDate = _undefined,
    Object? checkOutDate = _undefined,
  }) =>
      _then(Input$UpdateBookingRoomInput._({
        ..._instance._$data,
        if (roomId != _undefined) 'roomId': (roomId as String?),
        if (roomTypeId != _undefined) 'roomTypeId': (roomTypeId as String?),
        if (priceOverride != _undefined)
          'priceOverride': (priceOverride as double?),
        if (checkInDate != _undefined) 'checkInDate': (checkInDate as String?),
        if (checkOutDate != _undefined)
          'checkOutDate': (checkOutDate as String?),
      }));
}

class _CopyWithStubImpl$Input$UpdateBookingRoomInput<TRes>
    implements CopyWith$Input$UpdateBookingRoomInput<TRes> {
  _CopyWithStubImpl$Input$UpdateBookingRoomInput(this._res);

  TRes _res;

  call({
    String? roomId,
    String? roomTypeId,
    double? priceOverride,
    String? checkInDate,
    String? checkOutDate,
  }) =>
      _res;
}

class Input$UpdateBookingServiceInput {
  factory Input$UpdateBookingServiceInput({
    int? quantity,
    double? totalPrice,
  }) =>
      Input$UpdateBookingServiceInput._({
        if (quantity != null) r'quantity': quantity,
        if (totalPrice != null) r'totalPrice': totalPrice,
      });

  Input$UpdateBookingServiceInput._(this._$data);

  factory Input$UpdateBookingServiceInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('quantity')) {
      final l$quantity = data['quantity'];
      result$data['quantity'] = (l$quantity as int?);
    }
    if (data.containsKey('totalPrice')) {
      final l$totalPrice = data['totalPrice'];
      result$data['totalPrice'] = (l$totalPrice as num?)?.toDouble();
    }
    return Input$UpdateBookingServiceInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get quantity => (_$data['quantity'] as int?);

  double? get totalPrice => (_$data['totalPrice'] as double?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('quantity')) {
      final l$quantity = quantity;
      result$data['quantity'] = l$quantity;
    }
    if (_$data.containsKey('totalPrice')) {
      final l$totalPrice = totalPrice;
      result$data['totalPrice'] = l$totalPrice;
    }
    return result$data;
  }

  CopyWith$Input$UpdateBookingServiceInput<Input$UpdateBookingServiceInput>
      get copyWith => CopyWith$Input$UpdateBookingServiceInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$UpdateBookingServiceInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (_$data.containsKey('quantity') !=
        other._$data.containsKey('quantity')) {
      return false;
    }
    if (l$quantity != lOther$quantity) {
      return false;
    }
    final l$totalPrice = totalPrice;
    final lOther$totalPrice = other.totalPrice;
    if (_$data.containsKey('totalPrice') !=
        other._$data.containsKey('totalPrice')) {
      return false;
    }
    if (l$totalPrice != lOther$totalPrice) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$quantity = quantity;
    final l$totalPrice = totalPrice;
    return Object.hashAll([
      _$data.containsKey('quantity') ? l$quantity : const {},
      _$data.containsKey('totalPrice') ? l$totalPrice : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateBookingServiceInput<TRes> {
  factory CopyWith$Input$UpdateBookingServiceInput(
    Input$UpdateBookingServiceInput instance,
    TRes Function(Input$UpdateBookingServiceInput) then,
  ) = _CopyWithImpl$Input$UpdateBookingServiceInput;

  factory CopyWith$Input$UpdateBookingServiceInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateBookingServiceInput;

  TRes call({
    int? quantity,
    double? totalPrice,
  });
}

class _CopyWithImpl$Input$UpdateBookingServiceInput<TRes>
    implements CopyWith$Input$UpdateBookingServiceInput<TRes> {
  _CopyWithImpl$Input$UpdateBookingServiceInput(
    this._instance,
    this._then,
  );

  final Input$UpdateBookingServiceInput _instance;

  final TRes Function(Input$UpdateBookingServiceInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? quantity = _undefined,
    Object? totalPrice = _undefined,
  }) =>
      _then(Input$UpdateBookingServiceInput._({
        ..._instance._$data,
        if (quantity != _undefined) 'quantity': (quantity as int?),
        if (totalPrice != _undefined) 'totalPrice': (totalPrice as double?),
      }));
}

class _CopyWithStubImpl$Input$UpdateBookingServiceInput<TRes>
    implements CopyWith$Input$UpdateBookingServiceInput<TRes> {
  _CopyWithStubImpl$Input$UpdateBookingServiceInput(this._res);

  TRes _res;

  call({
    int? quantity,
    double? totalPrice,
  }) =>
      _res;
}

class Input$CreateRateOverrideInput {
  factory Input$CreateRateOverrideInput({
    required String roomTypeId,
    required String startDate,
    required String endDate,
    required double rate,
  }) =>
      Input$CreateRateOverrideInput._({
        r'roomTypeId': roomTypeId,
        r'startDate': startDate,
        r'endDate': endDate,
        r'rate': rate,
      });

  Input$CreateRateOverrideInput._(this._$data);

  factory Input$CreateRateOverrideInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$roomTypeId = data['roomTypeId'];
    result$data['roomTypeId'] = (l$roomTypeId as String);
    final l$startDate = data['startDate'];
    result$data['startDate'] = (l$startDate as String);
    final l$endDate = data['endDate'];
    result$data['endDate'] = (l$endDate as String);
    final l$rate = data['rate'];
    result$data['rate'] = (l$rate as num).toDouble();
    return Input$CreateRateOverrideInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get roomTypeId => (_$data['roomTypeId'] as String);

  String get startDate => (_$data['startDate'] as String);

  String get endDate => (_$data['endDate'] as String);

  double get rate => (_$data['rate'] as double);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$roomTypeId = roomTypeId;
    result$data['roomTypeId'] = l$roomTypeId;
    final l$startDate = startDate;
    result$data['startDate'] = l$startDate;
    final l$endDate = endDate;
    result$data['endDate'] = l$endDate;
    final l$rate = rate;
    result$data['rate'] = l$rate;
    return result$data;
  }

  CopyWith$Input$CreateRateOverrideInput<Input$CreateRateOverrideInput>
      get copyWith => CopyWith$Input$CreateRateOverrideInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CreateRateOverrideInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$roomTypeId = roomTypeId;
    final lOther$roomTypeId = other.roomTypeId;
    if (l$roomTypeId != lOther$roomTypeId) {
      return false;
    }
    final l$startDate = startDate;
    final lOther$startDate = other.startDate;
    if (l$startDate != lOther$startDate) {
      return false;
    }
    final l$endDate = endDate;
    final lOther$endDate = other.endDate;
    if (l$endDate != lOther$endDate) {
      return false;
    }
    final l$rate = rate;
    final lOther$rate = other.rate;
    if (l$rate != lOther$rate) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$roomTypeId = roomTypeId;
    final l$startDate = startDate;
    final l$endDate = endDate;
    final l$rate = rate;
    return Object.hashAll([
      l$roomTypeId,
      l$startDate,
      l$endDate,
      l$rate,
    ]);
  }
}

abstract class CopyWith$Input$CreateRateOverrideInput<TRes> {
  factory CopyWith$Input$CreateRateOverrideInput(
    Input$CreateRateOverrideInput instance,
    TRes Function(Input$CreateRateOverrideInput) then,
  ) = _CopyWithImpl$Input$CreateRateOverrideInput;

  factory CopyWith$Input$CreateRateOverrideInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateRateOverrideInput;

  TRes call({
    String? roomTypeId,
    String? startDate,
    String? endDate,
    double? rate,
  });
}

class _CopyWithImpl$Input$CreateRateOverrideInput<TRes>
    implements CopyWith$Input$CreateRateOverrideInput<TRes> {
  _CopyWithImpl$Input$CreateRateOverrideInput(
    this._instance,
    this._then,
  );

  final Input$CreateRateOverrideInput _instance;

  final TRes Function(Input$CreateRateOverrideInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? roomTypeId = _undefined,
    Object? startDate = _undefined,
    Object? endDate = _undefined,
    Object? rate = _undefined,
  }) =>
      _then(Input$CreateRateOverrideInput._({
        ..._instance._$data,
        if (roomTypeId != _undefined && roomTypeId != null)
          'roomTypeId': (roomTypeId as String),
        if (startDate != _undefined && startDate != null)
          'startDate': (startDate as String),
        if (endDate != _undefined && endDate != null)
          'endDate': (endDate as String),
        if (rate != _undefined && rate != null) 'rate': (rate as double),
      }));
}

class _CopyWithStubImpl$Input$CreateRateOverrideInput<TRes>
    implements CopyWith$Input$CreateRateOverrideInput<TRes> {
  _CopyWithStubImpl$Input$CreateRateOverrideInput(this._res);

  TRes _res;

  call({
    String? roomTypeId,
    String? startDate,
    String? endDate,
    double? rate,
  }) =>
      _res;
}

class Input$CreateGuestInput {
  factory Input$CreateGuestInput({
    required String name,
    required String phone,
    String? email,
    String? idProofType,
    String? idProofNumber,
    required String tenantId,
    String? address,
    String? idProofUrl,
    String? gstin,
    String? grNumber,
    String? preferences,
    String? notes,
  }) =>
      Input$CreateGuestInput._({
        r'name': name,
        r'phone': phone,
        if (email != null) r'email': email,
        if (idProofType != null) r'idProofType': idProofType,
        if (idProofNumber != null) r'idProofNumber': idProofNumber,
        r'tenantId': tenantId,
        if (address != null) r'address': address,
        if (idProofUrl != null) r'idProofUrl': idProofUrl,
        if (gstin != null) r'gstin': gstin,
        if (grNumber != null) r'grNumber': grNumber,
        if (preferences != null) r'preferences': preferences,
        if (notes != null) r'notes': notes,
      });

  Input$CreateGuestInput._(this._$data);

  factory Input$CreateGuestInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$phone = data['phone'];
    result$data['phone'] = (l$phone as String);
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('idProofType')) {
      final l$idProofType = data['idProofType'];
      result$data['idProofType'] = (l$idProofType as String?);
    }
    if (data.containsKey('idProofNumber')) {
      final l$idProofNumber = data['idProofNumber'];
      result$data['idProofNumber'] = (l$idProofNumber as String?);
    }
    final l$tenantId = data['tenantId'];
    result$data['tenantId'] = (l$tenantId as String);
    if (data.containsKey('address')) {
      final l$address = data['address'];
      result$data['address'] = (l$address as String?);
    }
    if (data.containsKey('idProofUrl')) {
      final l$idProofUrl = data['idProofUrl'];
      result$data['idProofUrl'] = (l$idProofUrl as String?);
    }
    if (data.containsKey('gstin')) {
      final l$gstin = data['gstin'];
      result$data['gstin'] = (l$gstin as String?);
    }
    if (data.containsKey('grNumber')) {
      final l$grNumber = data['grNumber'];
      result$data['grNumber'] = (l$grNumber as String?);
    }
    if (data.containsKey('preferences')) {
      final l$preferences = data['preferences'];
      result$data['preferences'] = (l$preferences as String?);
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    return Input$CreateGuestInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String get phone => (_$data['phone'] as String);

  String? get email => (_$data['email'] as String?);

  String? get idProofType => (_$data['idProofType'] as String?);

  String? get idProofNumber => (_$data['idProofNumber'] as String?);

  String get tenantId => (_$data['tenantId'] as String);

  String? get address => (_$data['address'] as String?);

  String? get idProofUrl => (_$data['idProofUrl'] as String?);

  String? get gstin => (_$data['gstin'] as String?);

  String? get grNumber => (_$data['grNumber'] as String?);

  String? get preferences => (_$data['preferences'] as String?);

  String? get notes => (_$data['notes'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$phone = phone;
    result$data['phone'] = l$phone;
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('idProofType')) {
      final l$idProofType = idProofType;
      result$data['idProofType'] = l$idProofType;
    }
    if (_$data.containsKey('idProofNumber')) {
      final l$idProofNumber = idProofNumber;
      result$data['idProofNumber'] = l$idProofNumber;
    }
    final l$tenantId = tenantId;
    result$data['tenantId'] = l$tenantId;
    if (_$data.containsKey('address')) {
      final l$address = address;
      result$data['address'] = l$address;
    }
    if (_$data.containsKey('idProofUrl')) {
      final l$idProofUrl = idProofUrl;
      result$data['idProofUrl'] = l$idProofUrl;
    }
    if (_$data.containsKey('gstin')) {
      final l$gstin = gstin;
      result$data['gstin'] = l$gstin;
    }
    if (_$data.containsKey('grNumber')) {
      final l$grNumber = grNumber;
      result$data['grNumber'] = l$grNumber;
    }
    if (_$data.containsKey('preferences')) {
      final l$preferences = preferences;
      result$data['preferences'] = l$preferences;
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
    return result$data;
  }

  CopyWith$Input$CreateGuestInput<Input$CreateGuestInput> get copyWith =>
      CopyWith$Input$CreateGuestInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CreateGuestInput) ||
        runtimeType != other.runtimeType) {
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
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$idProofType = idProofType;
    final lOther$idProofType = other.idProofType;
    if (_$data.containsKey('idProofType') !=
        other._$data.containsKey('idProofType')) {
      return false;
    }
    if (l$idProofType != lOther$idProofType) {
      return false;
    }
    final l$idProofNumber = idProofNumber;
    final lOther$idProofNumber = other.idProofNumber;
    if (_$data.containsKey('idProofNumber') !=
        other._$data.containsKey('idProofNumber')) {
      return false;
    }
    if (l$idProofNumber != lOther$idProofNumber) {
      return false;
    }
    final l$tenantId = tenantId;
    final lOther$tenantId = other.tenantId;
    if (l$tenantId != lOther$tenantId) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (_$data.containsKey('address') != other._$data.containsKey('address')) {
      return false;
    }
    if (l$address != lOther$address) {
      return false;
    }
    final l$idProofUrl = idProofUrl;
    final lOther$idProofUrl = other.idProofUrl;
    if (_$data.containsKey('idProofUrl') !=
        other._$data.containsKey('idProofUrl')) {
      return false;
    }
    if (l$idProofUrl != lOther$idProofUrl) {
      return false;
    }
    final l$gstin = gstin;
    final lOther$gstin = other.gstin;
    if (_$data.containsKey('gstin') != other._$data.containsKey('gstin')) {
      return false;
    }
    if (l$gstin != lOther$gstin) {
      return false;
    }
    final l$grNumber = grNumber;
    final lOther$grNumber = other.grNumber;
    if (_$data.containsKey('grNumber') !=
        other._$data.containsKey('grNumber')) {
      return false;
    }
    if (l$grNumber != lOther$grNumber) {
      return false;
    }
    final l$preferences = preferences;
    final lOther$preferences = other.preferences;
    if (_$data.containsKey('preferences') !=
        other._$data.containsKey('preferences')) {
      return false;
    }
    if (l$preferences != lOther$preferences) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (_$data.containsKey('notes') != other._$data.containsKey('notes')) {
      return false;
    }
    if (l$notes != lOther$notes) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$phone = phone;
    final l$email = email;
    final l$idProofType = idProofType;
    final l$idProofNumber = idProofNumber;
    final l$tenantId = tenantId;
    final l$address = address;
    final l$idProofUrl = idProofUrl;
    final l$gstin = gstin;
    final l$grNumber = grNumber;
    final l$preferences = preferences;
    final l$notes = notes;
    return Object.hashAll([
      l$name,
      l$phone,
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('idProofType') ? l$idProofType : const {},
      _$data.containsKey('idProofNumber') ? l$idProofNumber : const {},
      l$tenantId,
      _$data.containsKey('address') ? l$address : const {},
      _$data.containsKey('idProofUrl') ? l$idProofUrl : const {},
      _$data.containsKey('gstin') ? l$gstin : const {},
      _$data.containsKey('grNumber') ? l$grNumber : const {},
      _$data.containsKey('preferences') ? l$preferences : const {},
      _$data.containsKey('notes') ? l$notes : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreateGuestInput<TRes> {
  factory CopyWith$Input$CreateGuestInput(
    Input$CreateGuestInput instance,
    TRes Function(Input$CreateGuestInput) then,
  ) = _CopyWithImpl$Input$CreateGuestInput;

  factory CopyWith$Input$CreateGuestInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateGuestInput;

  TRes call({
    String? name,
    String? phone,
    String? email,
    String? idProofType,
    String? idProofNumber,
    String? tenantId,
    String? address,
    String? idProofUrl,
    String? gstin,
    String? grNumber,
    String? preferences,
    String? notes,
  });
}

class _CopyWithImpl$Input$CreateGuestInput<TRes>
    implements CopyWith$Input$CreateGuestInput<TRes> {
  _CopyWithImpl$Input$CreateGuestInput(
    this._instance,
    this._then,
  );

  final Input$CreateGuestInput _instance;

  final TRes Function(Input$CreateGuestInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? phone = _undefined,
    Object? email = _undefined,
    Object? idProofType = _undefined,
    Object? idProofNumber = _undefined,
    Object? tenantId = _undefined,
    Object? address = _undefined,
    Object? idProofUrl = _undefined,
    Object? gstin = _undefined,
    Object? grNumber = _undefined,
    Object? preferences = _undefined,
    Object? notes = _undefined,
  }) =>
      _then(Input$CreateGuestInput._({
        ..._instance._$data,
        if (name != _undefined && name != null) 'name': (name as String),
        if (phone != _undefined && phone != null) 'phone': (phone as String),
        if (email != _undefined) 'email': (email as String?),
        if (idProofType != _undefined) 'idProofType': (idProofType as String?),
        if (idProofNumber != _undefined)
          'idProofNumber': (idProofNumber as String?),
        if (tenantId != _undefined && tenantId != null)
          'tenantId': (tenantId as String),
        if (address != _undefined) 'address': (address as String?),
        if (idProofUrl != _undefined) 'idProofUrl': (idProofUrl as String?),
        if (gstin != _undefined) 'gstin': (gstin as String?),
        if (grNumber != _undefined) 'grNumber': (grNumber as String?),
        if (preferences != _undefined) 'preferences': (preferences as String?),
        if (notes != _undefined) 'notes': (notes as String?),
      }));
}

class _CopyWithStubImpl$Input$CreateGuestInput<TRes>
    implements CopyWith$Input$CreateGuestInput<TRes> {
  _CopyWithStubImpl$Input$CreateGuestInput(this._res);

  TRes _res;

  call({
    String? name,
    String? phone,
    String? email,
    String? idProofType,
    String? idProofNumber,
    String? tenantId,
    String? address,
    String? idProofUrl,
    String? gstin,
    String? grNumber,
    String? preferences,
    String? notes,
  }) =>
      _res;
}

class Input$UpdateGuestInput {
  factory Input$UpdateGuestInput({
    String? name,
    String? phone,
    String? email,
    String? idProofType,
    String? idProofNumber,
    String? address,
    String? idProofUrl,
    String? gstin,
    String? grNumber,
    String? preferences,
    String? notes,
  }) =>
      Input$UpdateGuestInput._({
        if (name != null) r'name': name,
        if (phone != null) r'phone': phone,
        if (email != null) r'email': email,
        if (idProofType != null) r'idProofType': idProofType,
        if (idProofNumber != null) r'idProofNumber': idProofNumber,
        if (address != null) r'address': address,
        if (idProofUrl != null) r'idProofUrl': idProofUrl,
        if (gstin != null) r'gstin': gstin,
        if (grNumber != null) r'grNumber': grNumber,
        if (preferences != null) r'preferences': preferences,
        if (notes != null) r'notes': notes,
      });

  Input$UpdateGuestInput._(this._$data);

  factory Input$UpdateGuestInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('phone')) {
      final l$phone = data['phone'];
      result$data['phone'] = (l$phone as String?);
    }
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('idProofType')) {
      final l$idProofType = data['idProofType'];
      result$data['idProofType'] = (l$idProofType as String?);
    }
    if (data.containsKey('idProofNumber')) {
      final l$idProofNumber = data['idProofNumber'];
      result$data['idProofNumber'] = (l$idProofNumber as String?);
    }
    if (data.containsKey('address')) {
      final l$address = data['address'];
      result$data['address'] = (l$address as String?);
    }
    if (data.containsKey('idProofUrl')) {
      final l$idProofUrl = data['idProofUrl'];
      result$data['idProofUrl'] = (l$idProofUrl as String?);
    }
    if (data.containsKey('gstin')) {
      final l$gstin = data['gstin'];
      result$data['gstin'] = (l$gstin as String?);
    }
    if (data.containsKey('grNumber')) {
      final l$grNumber = data['grNumber'];
      result$data['grNumber'] = (l$grNumber as String?);
    }
    if (data.containsKey('preferences')) {
      final l$preferences = data['preferences'];
      result$data['preferences'] = (l$preferences as String?);
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    return Input$UpdateGuestInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  String? get phone => (_$data['phone'] as String?);

  String? get email => (_$data['email'] as String?);

  String? get idProofType => (_$data['idProofType'] as String?);

  String? get idProofNumber => (_$data['idProofNumber'] as String?);

  String? get address => (_$data['address'] as String?);

  String? get idProofUrl => (_$data['idProofUrl'] as String?);

  String? get gstin => (_$data['gstin'] as String?);

  String? get grNumber => (_$data['grNumber'] as String?);

  String? get preferences => (_$data['preferences'] as String?);

  String? get notes => (_$data['notes'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('phone')) {
      final l$phone = phone;
      result$data['phone'] = l$phone;
    }
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('idProofType')) {
      final l$idProofType = idProofType;
      result$data['idProofType'] = l$idProofType;
    }
    if (_$data.containsKey('idProofNumber')) {
      final l$idProofNumber = idProofNumber;
      result$data['idProofNumber'] = l$idProofNumber;
    }
    if (_$data.containsKey('address')) {
      final l$address = address;
      result$data['address'] = l$address;
    }
    if (_$data.containsKey('idProofUrl')) {
      final l$idProofUrl = idProofUrl;
      result$data['idProofUrl'] = l$idProofUrl;
    }
    if (_$data.containsKey('gstin')) {
      final l$gstin = gstin;
      result$data['gstin'] = l$gstin;
    }
    if (_$data.containsKey('grNumber')) {
      final l$grNumber = grNumber;
      result$data['grNumber'] = l$grNumber;
    }
    if (_$data.containsKey('preferences')) {
      final l$preferences = preferences;
      result$data['preferences'] = l$preferences;
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
    return result$data;
  }

  CopyWith$Input$UpdateGuestInput<Input$UpdateGuestInput> get copyWith =>
      CopyWith$Input$UpdateGuestInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$UpdateGuestInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (_$data.containsKey('phone') != other._$data.containsKey('phone')) {
      return false;
    }
    if (l$phone != lOther$phone) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$idProofType = idProofType;
    final lOther$idProofType = other.idProofType;
    if (_$data.containsKey('idProofType') !=
        other._$data.containsKey('idProofType')) {
      return false;
    }
    if (l$idProofType != lOther$idProofType) {
      return false;
    }
    final l$idProofNumber = idProofNumber;
    final lOther$idProofNumber = other.idProofNumber;
    if (_$data.containsKey('idProofNumber') !=
        other._$data.containsKey('idProofNumber')) {
      return false;
    }
    if (l$idProofNumber != lOther$idProofNumber) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (_$data.containsKey('address') != other._$data.containsKey('address')) {
      return false;
    }
    if (l$address != lOther$address) {
      return false;
    }
    final l$idProofUrl = idProofUrl;
    final lOther$idProofUrl = other.idProofUrl;
    if (_$data.containsKey('idProofUrl') !=
        other._$data.containsKey('idProofUrl')) {
      return false;
    }
    if (l$idProofUrl != lOther$idProofUrl) {
      return false;
    }
    final l$gstin = gstin;
    final lOther$gstin = other.gstin;
    if (_$data.containsKey('gstin') != other._$data.containsKey('gstin')) {
      return false;
    }
    if (l$gstin != lOther$gstin) {
      return false;
    }
    final l$grNumber = grNumber;
    final lOther$grNumber = other.grNumber;
    if (_$data.containsKey('grNumber') !=
        other._$data.containsKey('grNumber')) {
      return false;
    }
    if (l$grNumber != lOther$grNumber) {
      return false;
    }
    final l$preferences = preferences;
    final lOther$preferences = other.preferences;
    if (_$data.containsKey('preferences') !=
        other._$data.containsKey('preferences')) {
      return false;
    }
    if (l$preferences != lOther$preferences) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (_$data.containsKey('notes') != other._$data.containsKey('notes')) {
      return false;
    }
    if (l$notes != lOther$notes) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$phone = phone;
    final l$email = email;
    final l$idProofType = idProofType;
    final l$idProofNumber = idProofNumber;
    final l$address = address;
    final l$idProofUrl = idProofUrl;
    final l$gstin = gstin;
    final l$grNumber = grNumber;
    final l$preferences = preferences;
    final l$notes = notes;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('phone') ? l$phone : const {},
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('idProofType') ? l$idProofType : const {},
      _$data.containsKey('idProofNumber') ? l$idProofNumber : const {},
      _$data.containsKey('address') ? l$address : const {},
      _$data.containsKey('idProofUrl') ? l$idProofUrl : const {},
      _$data.containsKey('gstin') ? l$gstin : const {},
      _$data.containsKey('grNumber') ? l$grNumber : const {},
      _$data.containsKey('preferences') ? l$preferences : const {},
      _$data.containsKey('notes') ? l$notes : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateGuestInput<TRes> {
  factory CopyWith$Input$UpdateGuestInput(
    Input$UpdateGuestInput instance,
    TRes Function(Input$UpdateGuestInput) then,
  ) = _CopyWithImpl$Input$UpdateGuestInput;

  factory CopyWith$Input$UpdateGuestInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateGuestInput;

  TRes call({
    String? name,
    String? phone,
    String? email,
    String? idProofType,
    String? idProofNumber,
    String? address,
    String? idProofUrl,
    String? gstin,
    String? grNumber,
    String? preferences,
    String? notes,
  });
}

class _CopyWithImpl$Input$UpdateGuestInput<TRes>
    implements CopyWith$Input$UpdateGuestInput<TRes> {
  _CopyWithImpl$Input$UpdateGuestInput(
    this._instance,
    this._then,
  );

  final Input$UpdateGuestInput _instance;

  final TRes Function(Input$UpdateGuestInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? phone = _undefined,
    Object? email = _undefined,
    Object? idProofType = _undefined,
    Object? idProofNumber = _undefined,
    Object? address = _undefined,
    Object? idProofUrl = _undefined,
    Object? gstin = _undefined,
    Object? grNumber = _undefined,
    Object? preferences = _undefined,
    Object? notes = _undefined,
  }) =>
      _then(Input$UpdateGuestInput._({
        ..._instance._$data,
        if (name != _undefined) 'name': (name as String?),
        if (phone != _undefined) 'phone': (phone as String?),
        if (email != _undefined) 'email': (email as String?),
        if (idProofType != _undefined) 'idProofType': (idProofType as String?),
        if (idProofNumber != _undefined)
          'idProofNumber': (idProofNumber as String?),
        if (address != _undefined) 'address': (address as String?),
        if (idProofUrl != _undefined) 'idProofUrl': (idProofUrl as String?),
        if (gstin != _undefined) 'gstin': (gstin as String?),
        if (grNumber != _undefined) 'grNumber': (grNumber as String?),
        if (preferences != _undefined) 'preferences': (preferences as String?),
        if (notes != _undefined) 'notes': (notes as String?),
      }));
}

class _CopyWithStubImpl$Input$UpdateGuestInput<TRes>
    implements CopyWith$Input$UpdateGuestInput<TRes> {
  _CopyWithStubImpl$Input$UpdateGuestInput(this._res);

  TRes _res;

  call({
    String? name,
    String? phone,
    String? email,
    String? idProofType,
    String? idProofNumber,
    String? address,
    String? idProofUrl,
    String? gstin,
    String? grNumber,
    String? preferences,
    String? notes,
  }) =>
      _res;
}

class Input$CreatePaymentInput {
  factory Input$CreatePaymentInput({
    required String bookingId,
    required String tenantId,
    required double amount,
    required String method,
    Enum$PaymentStatus? status,
    String? notes,
  }) =>
      Input$CreatePaymentInput._({
        r'bookingId': bookingId,
        r'tenantId': tenantId,
        r'amount': amount,
        r'method': method,
        if (status != null) r'status': status,
        if (notes != null) r'notes': notes,
      });

  Input$CreatePaymentInput._(this._$data);

  factory Input$CreatePaymentInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$bookingId = data['bookingId'];
    result$data['bookingId'] = (l$bookingId as String);
    final l$tenantId = data['tenantId'];
    result$data['tenantId'] = (l$tenantId as String);
    final l$amount = data['amount'];
    result$data['amount'] = (l$amount as num).toDouble();
    final l$method = data['method'];
    result$data['method'] = (l$method as String);
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$PaymentStatus((l$status as String));
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    return Input$CreatePaymentInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get bookingId => (_$data['bookingId'] as String);

  String get tenantId => (_$data['tenantId'] as String);

  double get amount => (_$data['amount'] as double);

  String get method => (_$data['method'] as String);

  Enum$PaymentStatus? get status => (_$data['status'] as Enum$PaymentStatus?);

  String? get notes => (_$data['notes'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$bookingId = bookingId;
    result$data['bookingId'] = l$bookingId;
    final l$tenantId = tenantId;
    result$data['tenantId'] = l$tenantId;
    final l$amount = amount;
    result$data['amount'] = l$amount;
    final l$method = method;
    result$data['method'] = l$method;
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] =
          l$status == null ? null : toJson$Enum$PaymentStatus(l$status);
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
    return result$data;
  }

  CopyWith$Input$CreatePaymentInput<Input$CreatePaymentInput> get copyWith =>
      CopyWith$Input$CreatePaymentInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CreatePaymentInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$bookingId = bookingId;
    final lOther$bookingId = other.bookingId;
    if (l$bookingId != lOther$bookingId) {
      return false;
    }
    final l$tenantId = tenantId;
    final lOther$tenantId = other.tenantId;
    if (l$tenantId != lOther$tenantId) {
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
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (_$data.containsKey('notes') != other._$data.containsKey('notes')) {
      return false;
    }
    if (l$notes != lOther$notes) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$bookingId = bookingId;
    final l$tenantId = tenantId;
    final l$amount = amount;
    final l$method = method;
    final l$status = status;
    final l$notes = notes;
    return Object.hashAll([
      l$bookingId,
      l$tenantId,
      l$amount,
      l$method,
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('notes') ? l$notes : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreatePaymentInput<TRes> {
  factory CopyWith$Input$CreatePaymentInput(
    Input$CreatePaymentInput instance,
    TRes Function(Input$CreatePaymentInput) then,
  ) = _CopyWithImpl$Input$CreatePaymentInput;

  factory CopyWith$Input$CreatePaymentInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreatePaymentInput;

  TRes call({
    String? bookingId,
    String? tenantId,
    double? amount,
    String? method,
    Enum$PaymentStatus? status,
    String? notes,
  });
}

class _CopyWithImpl$Input$CreatePaymentInput<TRes>
    implements CopyWith$Input$CreatePaymentInput<TRes> {
  _CopyWithImpl$Input$CreatePaymentInput(
    this._instance,
    this._then,
  );

  final Input$CreatePaymentInput _instance;

  final TRes Function(Input$CreatePaymentInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? bookingId = _undefined,
    Object? tenantId = _undefined,
    Object? amount = _undefined,
    Object? method = _undefined,
    Object? status = _undefined,
    Object? notes = _undefined,
  }) =>
      _then(Input$CreatePaymentInput._({
        ..._instance._$data,
        if (bookingId != _undefined && bookingId != null)
          'bookingId': (bookingId as String),
        if (tenantId != _undefined && tenantId != null)
          'tenantId': (tenantId as String),
        if (amount != _undefined && amount != null)
          'amount': (amount as double),
        if (method != _undefined && method != null)
          'method': (method as String),
        if (status != _undefined) 'status': (status as Enum$PaymentStatus?),
        if (notes != _undefined) 'notes': (notes as String?),
      }));
}

class _CopyWithStubImpl$Input$CreatePaymentInput<TRes>
    implements CopyWith$Input$CreatePaymentInput<TRes> {
  _CopyWithStubImpl$Input$CreatePaymentInput(this._res);

  TRes _res;

  call({
    String? bookingId,
    String? tenantId,
    double? amount,
    String? method,
    Enum$PaymentStatus? status,
    String? notes,
  }) =>
      _res;
}

class Input$UpdatePaymentInput {
  factory Input$UpdatePaymentInput({
    double? amount,
    String? method,
    Enum$PaymentStatus? status,
    String? notes,
  }) =>
      Input$UpdatePaymentInput._({
        if (amount != null) r'amount': amount,
        if (method != null) r'method': method,
        if (status != null) r'status': status,
        if (notes != null) r'notes': notes,
      });

  Input$UpdatePaymentInput._(this._$data);

  factory Input$UpdatePaymentInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('amount')) {
      final l$amount = data['amount'];
      result$data['amount'] = (l$amount as num?)?.toDouble();
    }
    if (data.containsKey('method')) {
      final l$method = data['method'];
      result$data['method'] = (l$method as String?);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$PaymentStatus((l$status as String));
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    return Input$UpdatePaymentInput._(result$data);
  }

  Map<String, dynamic> _$data;

  double? get amount => (_$data['amount'] as double?);

  String? get method => (_$data['method'] as String?);

  Enum$PaymentStatus? get status => (_$data['status'] as Enum$PaymentStatus?);

  String? get notes => (_$data['notes'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('amount')) {
      final l$amount = amount;
      result$data['amount'] = l$amount;
    }
    if (_$data.containsKey('method')) {
      final l$method = method;
      result$data['method'] = l$method;
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] =
          l$status == null ? null : toJson$Enum$PaymentStatus(l$status);
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
    return result$data;
  }

  CopyWith$Input$UpdatePaymentInput<Input$UpdatePaymentInput> get copyWith =>
      CopyWith$Input$UpdatePaymentInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$UpdatePaymentInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$amount = amount;
    final lOther$amount = other.amount;
    if (_$data.containsKey('amount') != other._$data.containsKey('amount')) {
      return false;
    }
    if (l$amount != lOther$amount) {
      return false;
    }
    final l$method = method;
    final lOther$method = other.method;
    if (_$data.containsKey('method') != other._$data.containsKey('method')) {
      return false;
    }
    if (l$method != lOther$method) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (_$data.containsKey('notes') != other._$data.containsKey('notes')) {
      return false;
    }
    if (l$notes != lOther$notes) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$amount = amount;
    final l$method = method;
    final l$status = status;
    final l$notes = notes;
    return Object.hashAll([
      _$data.containsKey('amount') ? l$amount : const {},
      _$data.containsKey('method') ? l$method : const {},
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('notes') ? l$notes : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdatePaymentInput<TRes> {
  factory CopyWith$Input$UpdatePaymentInput(
    Input$UpdatePaymentInput instance,
    TRes Function(Input$UpdatePaymentInput) then,
  ) = _CopyWithImpl$Input$UpdatePaymentInput;

  factory CopyWith$Input$UpdatePaymentInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdatePaymentInput;

  TRes call({
    double? amount,
    String? method,
    Enum$PaymentStatus? status,
    String? notes,
  });
}

class _CopyWithImpl$Input$UpdatePaymentInput<TRes>
    implements CopyWith$Input$UpdatePaymentInput<TRes> {
  _CopyWithImpl$Input$UpdatePaymentInput(
    this._instance,
    this._then,
  );

  final Input$UpdatePaymentInput _instance;

  final TRes Function(Input$UpdatePaymentInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? amount = _undefined,
    Object? method = _undefined,
    Object? status = _undefined,
    Object? notes = _undefined,
  }) =>
      _then(Input$UpdatePaymentInput._({
        ..._instance._$data,
        if (amount != _undefined) 'amount': (amount as double?),
        if (method != _undefined) 'method': (method as String?),
        if (status != _undefined) 'status': (status as Enum$PaymentStatus?),
        if (notes != _undefined) 'notes': (notes as String?),
      }));
}

class _CopyWithStubImpl$Input$UpdatePaymentInput<TRes>
    implements CopyWith$Input$UpdatePaymentInput<TRes> {
  _CopyWithStubImpl$Input$UpdatePaymentInput(this._res);

  TRes _res;

  call({
    double? amount,
    String? method,
    Enum$PaymentStatus? status,
    String? notes,
  }) =>
      _res;
}

class Input$CreateTenantInput {
  factory Input$CreateTenantInput({
    required String name,
    String? email,
    String? featureFlags,
    required String adminEmail,
    required String adminPassword,
    String? adminName,
  }) =>
      Input$CreateTenantInput._({
        r'name': name,
        if (email != null) r'email': email,
        if (featureFlags != null) r'featureFlags': featureFlags,
        r'adminEmail': adminEmail,
        r'adminPassword': adminPassword,
        if (adminName != null) r'adminName': adminName,
      });

  Input$CreateTenantInput._(this._$data);

  factory Input$CreateTenantInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('featureFlags')) {
      final l$featureFlags = data['featureFlags'];
      result$data['featureFlags'] = (l$featureFlags as String?);
    }
    final l$adminEmail = data['adminEmail'];
    result$data['adminEmail'] = (l$adminEmail as String);
    final l$adminPassword = data['adminPassword'];
    result$data['adminPassword'] = (l$adminPassword as String);
    if (data.containsKey('adminName')) {
      final l$adminName = data['adminName'];
      result$data['adminName'] = (l$adminName as String?);
    }
    return Input$CreateTenantInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String? get email => (_$data['email'] as String?);

  String? get featureFlags => (_$data['featureFlags'] as String?);

  String get adminEmail => (_$data['adminEmail'] as String);

  String get adminPassword => (_$data['adminPassword'] as String);

  String? get adminName => (_$data['adminName'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('featureFlags')) {
      final l$featureFlags = featureFlags;
      result$data['featureFlags'] = l$featureFlags;
    }
    final l$adminEmail = adminEmail;
    result$data['adminEmail'] = l$adminEmail;
    final l$adminPassword = adminPassword;
    result$data['adminPassword'] = l$adminPassword;
    if (_$data.containsKey('adminName')) {
      final l$adminName = adminName;
      result$data['adminName'] = l$adminName;
    }
    return result$data;
  }

  CopyWith$Input$CreateTenantInput<Input$CreateTenantInput> get copyWith =>
      CopyWith$Input$CreateTenantInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CreateTenantInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$featureFlags = featureFlags;
    final lOther$featureFlags = other.featureFlags;
    if (_$data.containsKey('featureFlags') !=
        other._$data.containsKey('featureFlags')) {
      return false;
    }
    if (l$featureFlags != lOther$featureFlags) {
      return false;
    }
    final l$adminEmail = adminEmail;
    final lOther$adminEmail = other.adminEmail;
    if (l$adminEmail != lOther$adminEmail) {
      return false;
    }
    final l$adminPassword = adminPassword;
    final lOther$adminPassword = other.adminPassword;
    if (l$adminPassword != lOther$adminPassword) {
      return false;
    }
    final l$adminName = adminName;
    final lOther$adminName = other.adminName;
    if (_$data.containsKey('adminName') !=
        other._$data.containsKey('adminName')) {
      return false;
    }
    if (l$adminName != lOther$adminName) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$email = email;
    final l$featureFlags = featureFlags;
    final l$adminEmail = adminEmail;
    final l$adminPassword = adminPassword;
    final l$adminName = adminName;
    return Object.hashAll([
      l$name,
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('featureFlags') ? l$featureFlags : const {},
      l$adminEmail,
      l$adminPassword,
      _$data.containsKey('adminName') ? l$adminName : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreateTenantInput<TRes> {
  factory CopyWith$Input$CreateTenantInput(
    Input$CreateTenantInput instance,
    TRes Function(Input$CreateTenantInput) then,
  ) = _CopyWithImpl$Input$CreateTenantInput;

  factory CopyWith$Input$CreateTenantInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateTenantInput;

  TRes call({
    String? name,
    String? email,
    String? featureFlags,
    String? adminEmail,
    String? adminPassword,
    String? adminName,
  });
}

class _CopyWithImpl$Input$CreateTenantInput<TRes>
    implements CopyWith$Input$CreateTenantInput<TRes> {
  _CopyWithImpl$Input$CreateTenantInput(
    this._instance,
    this._then,
  );

  final Input$CreateTenantInput _instance;

  final TRes Function(Input$CreateTenantInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? email = _undefined,
    Object? featureFlags = _undefined,
    Object? adminEmail = _undefined,
    Object? adminPassword = _undefined,
    Object? adminName = _undefined,
  }) =>
      _then(Input$CreateTenantInput._({
        ..._instance._$data,
        if (name != _undefined && name != null) 'name': (name as String),
        if (email != _undefined) 'email': (email as String?),
        if (featureFlags != _undefined)
          'featureFlags': (featureFlags as String?),
        if (adminEmail != _undefined && adminEmail != null)
          'adminEmail': (adminEmail as String),
        if (adminPassword != _undefined && adminPassword != null)
          'adminPassword': (adminPassword as String),
        if (adminName != _undefined) 'adminName': (adminName as String?),
      }));
}

class _CopyWithStubImpl$Input$CreateTenantInput<TRes>
    implements CopyWith$Input$CreateTenantInput<TRes> {
  _CopyWithStubImpl$Input$CreateTenantInput(this._res);

  TRes _res;

  call({
    String? name,
    String? email,
    String? featureFlags,
    String? adminEmail,
    String? adminPassword,
    String? adminName,
  }) =>
      _res;
}

class Input$CreateUserInput {
  factory Input$CreateUserInput({
    required String email,
    required String password,
    required String name,
    Enum$UserRole? role,
    String? tenantId,
  }) =>
      Input$CreateUserInput._({
        r'email': email,
        r'password': password,
        r'name': name,
        if (role != null) r'role': role,
        if (tenantId != null) r'tenantId': tenantId,
      });

  Input$CreateUserInput._(this._$data);

  factory Input$CreateUserInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('role')) {
      final l$role = data['role'];
      result$data['role'] = fromJson$Enum$UserRole((l$role as String));
    }
    if (data.containsKey('tenantId')) {
      final l$tenantId = data['tenantId'];
      result$data['tenantId'] = (l$tenantId as String?);
    }
    return Input$CreateUserInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  String get password => (_$data['password'] as String);

  String get name => (_$data['name'] as String);

  Enum$UserRole? get role => (_$data['role'] as Enum$UserRole?);

  String? get tenantId => (_$data['tenantId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    final l$password = password;
    result$data['password'] = l$password;
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('role')) {
      final l$role = role;
      result$data['role'] = toJson$Enum$UserRole((l$role as Enum$UserRole));
    }
    if (_$data.containsKey('tenantId')) {
      final l$tenantId = tenantId;
      result$data['tenantId'] = l$tenantId;
    }
    return result$data;
  }

  CopyWith$Input$CreateUserInput<Input$CreateUserInput> get copyWith =>
      CopyWith$Input$CreateUserInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CreateUserInput) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$role = role;
    final lOther$role = other.role;
    if (_$data.containsKey('role') != other._$data.containsKey('role')) {
      return false;
    }
    if (l$role != lOther$role) {
      return false;
    }
    final l$tenantId = tenantId;
    final lOther$tenantId = other.tenantId;
    if (_$data.containsKey('tenantId') !=
        other._$data.containsKey('tenantId')) {
      return false;
    }
    if (l$tenantId != lOther$tenantId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$password = password;
    final l$name = name;
    final l$role = role;
    final l$tenantId = tenantId;
    return Object.hashAll([
      l$email,
      l$password,
      l$name,
      _$data.containsKey('role') ? l$role : const {},
      _$data.containsKey('tenantId') ? l$tenantId : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreateUserInput<TRes> {
  factory CopyWith$Input$CreateUserInput(
    Input$CreateUserInput instance,
    TRes Function(Input$CreateUserInput) then,
  ) = _CopyWithImpl$Input$CreateUserInput;

  factory CopyWith$Input$CreateUserInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateUserInput;

  TRes call({
    String? email,
    String? password,
    String? name,
    Enum$UserRole? role,
    String? tenantId,
  });
}

class _CopyWithImpl$Input$CreateUserInput<TRes>
    implements CopyWith$Input$CreateUserInput<TRes> {
  _CopyWithImpl$Input$CreateUserInput(
    this._instance,
    this._then,
  );

  final Input$CreateUserInput _instance;

  final TRes Function(Input$CreateUserInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? email = _undefined,
    Object? password = _undefined,
    Object? name = _undefined,
    Object? role = _undefined,
    Object? tenantId = _undefined,
  }) =>
      _then(Input$CreateUserInput._({
        ..._instance._$data,
        if (email != _undefined && email != null) 'email': (email as String),
        if (password != _undefined && password != null)
          'password': (password as String),
        if (name != _undefined && name != null) 'name': (name as String),
        if (role != _undefined && role != null) 'role': (role as Enum$UserRole),
        if (tenantId != _undefined) 'tenantId': (tenantId as String?),
      }));
}

class _CopyWithStubImpl$Input$CreateUserInput<TRes>
    implements CopyWith$Input$CreateUserInput<TRes> {
  _CopyWithStubImpl$Input$CreateUserInput(this._res);

  TRes _res;

  call({
    String? email,
    String? password,
    String? name,
    Enum$UserRole? role,
    String? tenantId,
  }) =>
      _res;
}

class Input$CreateExpenseInput {
  factory Input$CreateExpenseInput({
    required double amount,
    required String category,
    String? description,
    String? date,
    required String propertyId,
  }) =>
      Input$CreateExpenseInput._({
        r'amount': amount,
        r'category': category,
        if (description != null) r'description': description,
        if (date != null) r'date': date,
        r'propertyId': propertyId,
      });

  Input$CreateExpenseInput._(this._$data);

  factory Input$CreateExpenseInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$amount = data['amount'];
    result$data['amount'] = (l$amount as num).toDouble();
    final l$category = data['category'];
    result$data['category'] = (l$category as String);
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('date')) {
      final l$date = data['date'];
      result$data['date'] = (l$date as String?);
    }
    final l$propertyId = data['propertyId'];
    result$data['propertyId'] = (l$propertyId as String);
    return Input$CreateExpenseInput._(result$data);
  }

  Map<String, dynamic> _$data;

  double get amount => (_$data['amount'] as double);

  String get category => (_$data['category'] as String);

  String? get description => (_$data['description'] as String?);

  String? get date => (_$data['date'] as String?);

  String get propertyId => (_$data['propertyId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$amount = amount;
    result$data['amount'] = l$amount;
    final l$category = category;
    result$data['category'] = l$category;
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('date')) {
      final l$date = date;
      result$data['date'] = l$date;
    }
    final l$propertyId = propertyId;
    result$data['propertyId'] = l$propertyId;
    return result$data;
  }

  CopyWith$Input$CreateExpenseInput<Input$CreateExpenseInput> get copyWith =>
      CopyWith$Input$CreateExpenseInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CreateExpenseInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$amount = amount;
    final lOther$amount = other.amount;
    if (l$amount != lOther$amount) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$date = date;
    final lOther$date = other.date;
    if (_$data.containsKey('date') != other._$data.containsKey('date')) {
      return false;
    }
    if (l$date != lOther$date) {
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
    final l$amount = amount;
    final l$category = category;
    final l$description = description;
    final l$date = date;
    final l$propertyId = propertyId;
    return Object.hashAll([
      l$amount,
      l$category,
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('date') ? l$date : const {},
      l$propertyId,
    ]);
  }
}

abstract class CopyWith$Input$CreateExpenseInput<TRes> {
  factory CopyWith$Input$CreateExpenseInput(
    Input$CreateExpenseInput instance,
    TRes Function(Input$CreateExpenseInput) then,
  ) = _CopyWithImpl$Input$CreateExpenseInput;

  factory CopyWith$Input$CreateExpenseInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateExpenseInput;

  TRes call({
    double? amount,
    String? category,
    String? description,
    String? date,
    String? propertyId,
  });
}

class _CopyWithImpl$Input$CreateExpenseInput<TRes>
    implements CopyWith$Input$CreateExpenseInput<TRes> {
  _CopyWithImpl$Input$CreateExpenseInput(
    this._instance,
    this._then,
  );

  final Input$CreateExpenseInput _instance;

  final TRes Function(Input$CreateExpenseInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? amount = _undefined,
    Object? category = _undefined,
    Object? description = _undefined,
    Object? date = _undefined,
    Object? propertyId = _undefined,
  }) =>
      _then(Input$CreateExpenseInput._({
        ..._instance._$data,
        if (amount != _undefined && amount != null)
          'amount': (amount as double),
        if (category != _undefined && category != null)
          'category': (category as String),
        if (description != _undefined) 'description': (description as String?),
        if (date != _undefined) 'date': (date as String?),
        if (propertyId != _undefined && propertyId != null)
          'propertyId': (propertyId as String),
      }));
}

class _CopyWithStubImpl$Input$CreateExpenseInput<TRes>
    implements CopyWith$Input$CreateExpenseInput<TRes> {
  _CopyWithStubImpl$Input$CreateExpenseInput(this._res);

  TRes _res;

  call({
    double? amount,
    String? category,
    String? description,
    String? date,
    String? propertyId,
  }) =>
      _res;
}

class Input$UpdateExpenseInput {
  factory Input$UpdateExpenseInput({
    double? amount,
    String? category,
    String? description,
    String? date,
  }) =>
      Input$UpdateExpenseInput._({
        if (amount != null) r'amount': amount,
        if (category != null) r'category': category,
        if (description != null) r'description': description,
        if (date != null) r'date': date,
      });

  Input$UpdateExpenseInput._(this._$data);

  factory Input$UpdateExpenseInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('amount')) {
      final l$amount = data['amount'];
      result$data['amount'] = (l$amount as num?)?.toDouble();
    }
    if (data.containsKey('category')) {
      final l$category = data['category'];
      result$data['category'] = (l$category as String?);
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('date')) {
      final l$date = data['date'];
      result$data['date'] = (l$date as String?);
    }
    return Input$UpdateExpenseInput._(result$data);
  }

  Map<String, dynamic> _$data;

  double? get amount => (_$data['amount'] as double?);

  String? get category => (_$data['category'] as String?);

  String? get description => (_$data['description'] as String?);

  String? get date => (_$data['date'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('amount')) {
      final l$amount = amount;
      result$data['amount'] = l$amount;
    }
    if (_$data.containsKey('category')) {
      final l$category = category;
      result$data['category'] = l$category;
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('date')) {
      final l$date = date;
      result$data['date'] = l$date;
    }
    return result$data;
  }

  CopyWith$Input$UpdateExpenseInput<Input$UpdateExpenseInput> get copyWith =>
      CopyWith$Input$UpdateExpenseInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$UpdateExpenseInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$amount = amount;
    final lOther$amount = other.amount;
    if (_$data.containsKey('amount') != other._$data.containsKey('amount')) {
      return false;
    }
    if (l$amount != lOther$amount) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (_$data.containsKey('category') !=
        other._$data.containsKey('category')) {
      return false;
    }
    if (l$category != lOther$category) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$date = date;
    final lOther$date = other.date;
    if (_$data.containsKey('date') != other._$data.containsKey('date')) {
      return false;
    }
    if (l$date != lOther$date) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$amount = amount;
    final l$category = category;
    final l$description = description;
    final l$date = date;
    return Object.hashAll([
      _$data.containsKey('amount') ? l$amount : const {},
      _$data.containsKey('category') ? l$category : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('date') ? l$date : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateExpenseInput<TRes> {
  factory CopyWith$Input$UpdateExpenseInput(
    Input$UpdateExpenseInput instance,
    TRes Function(Input$UpdateExpenseInput) then,
  ) = _CopyWithImpl$Input$UpdateExpenseInput;

  factory CopyWith$Input$UpdateExpenseInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateExpenseInput;

  TRes call({
    double? amount,
    String? category,
    String? description,
    String? date,
  });
}

class _CopyWithImpl$Input$UpdateExpenseInput<TRes>
    implements CopyWith$Input$UpdateExpenseInput<TRes> {
  _CopyWithImpl$Input$UpdateExpenseInput(
    this._instance,
    this._then,
  );

  final Input$UpdateExpenseInput _instance;

  final TRes Function(Input$UpdateExpenseInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? amount = _undefined,
    Object? category = _undefined,
    Object? description = _undefined,
    Object? date = _undefined,
  }) =>
      _then(Input$UpdateExpenseInput._({
        ..._instance._$data,
        if (amount != _undefined) 'amount': (amount as double?),
        if (category != _undefined) 'category': (category as String?),
        if (description != _undefined) 'description': (description as String?),
        if (date != _undefined) 'date': (date as String?),
      }));
}

class _CopyWithStubImpl$Input$UpdateExpenseInput<TRes>
    implements CopyWith$Input$UpdateExpenseInput<TRes> {
  _CopyWithStubImpl$Input$UpdateExpenseInput(this._res);

  TRes _res;

  call({
    double? amount,
    String? category,
    String? description,
    String? date,
  }) =>
      _res;
}

class Input$CreateMessageInput {
  factory Input$CreateMessageInput({
    String? bookingId,
    required String guestId,
    required String content,
    String? direction,
    String? status,
    String? channel,
  }) =>
      Input$CreateMessageInput._({
        if (bookingId != null) r'bookingId': bookingId,
        r'guestId': guestId,
        r'content': content,
        if (direction != null) r'direction': direction,
        if (status != null) r'status': status,
        if (channel != null) r'channel': channel,
      });

  Input$CreateMessageInput._(this._$data);

  factory Input$CreateMessageInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('bookingId')) {
      final l$bookingId = data['bookingId'];
      result$data['bookingId'] = (l$bookingId as String?);
    }
    final l$guestId = data['guestId'];
    result$data['guestId'] = (l$guestId as String);
    final l$content = data['content'];
    result$data['content'] = (l$content as String);
    if (data.containsKey('direction')) {
      final l$direction = data['direction'];
      result$data['direction'] = (l$direction as String);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = (l$status as String);
    }
    if (data.containsKey('channel')) {
      final l$channel = data['channel'];
      result$data['channel'] = (l$channel as String);
    }
    return Input$CreateMessageInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get bookingId => (_$data['bookingId'] as String?);

  String get guestId => (_$data['guestId'] as String);

  String get content => (_$data['content'] as String);

  String? get direction => (_$data['direction'] as String?);

  String? get status => (_$data['status'] as String?);

  String? get channel => (_$data['channel'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('bookingId')) {
      final l$bookingId = bookingId;
      result$data['bookingId'] = l$bookingId;
    }
    final l$guestId = guestId;
    result$data['guestId'] = l$guestId;
    final l$content = content;
    result$data['content'] = l$content;
    if (_$data.containsKey('direction')) {
      final l$direction = direction;
      result$data['direction'] = (l$direction as String);
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = (l$status as String);
    }
    if (_$data.containsKey('channel')) {
      final l$channel = channel;
      result$data['channel'] = (l$channel as String);
    }
    return result$data;
  }

  CopyWith$Input$CreateMessageInput<Input$CreateMessageInput> get copyWith =>
      CopyWith$Input$CreateMessageInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CreateMessageInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$bookingId = bookingId;
    final lOther$bookingId = other.bookingId;
    if (_$data.containsKey('bookingId') !=
        other._$data.containsKey('bookingId')) {
      return false;
    }
    if (l$bookingId != lOther$bookingId) {
      return false;
    }
    final l$guestId = guestId;
    final lOther$guestId = other.guestId;
    if (l$guestId != lOther$guestId) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (_$data.containsKey('direction') !=
        other._$data.containsKey('direction')) {
      return false;
    }
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    final l$channel = channel;
    final lOther$channel = other.channel;
    if (_$data.containsKey('channel') != other._$data.containsKey('channel')) {
      return false;
    }
    if (l$channel != lOther$channel) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$bookingId = bookingId;
    final l$guestId = guestId;
    final l$content = content;
    final l$direction = direction;
    final l$status = status;
    final l$channel = channel;
    return Object.hashAll([
      _$data.containsKey('bookingId') ? l$bookingId : const {},
      l$guestId,
      l$content,
      _$data.containsKey('direction') ? l$direction : const {},
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('channel') ? l$channel : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreateMessageInput<TRes> {
  factory CopyWith$Input$CreateMessageInput(
    Input$CreateMessageInput instance,
    TRes Function(Input$CreateMessageInput) then,
  ) = _CopyWithImpl$Input$CreateMessageInput;

  factory CopyWith$Input$CreateMessageInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateMessageInput;

  TRes call({
    String? bookingId,
    String? guestId,
    String? content,
    String? direction,
    String? status,
    String? channel,
  });
}

class _CopyWithImpl$Input$CreateMessageInput<TRes>
    implements CopyWith$Input$CreateMessageInput<TRes> {
  _CopyWithImpl$Input$CreateMessageInput(
    this._instance,
    this._then,
  );

  final Input$CreateMessageInput _instance;

  final TRes Function(Input$CreateMessageInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? bookingId = _undefined,
    Object? guestId = _undefined,
    Object? content = _undefined,
    Object? direction = _undefined,
    Object? status = _undefined,
    Object? channel = _undefined,
  }) =>
      _then(Input$CreateMessageInput._({
        ..._instance._$data,
        if (bookingId != _undefined) 'bookingId': (bookingId as String?),
        if (guestId != _undefined && guestId != null)
          'guestId': (guestId as String),
        if (content != _undefined && content != null)
          'content': (content as String),
        if (direction != _undefined && direction != null)
          'direction': (direction as String),
        if (status != _undefined && status != null)
          'status': (status as String),
        if (channel != _undefined && channel != null)
          'channel': (channel as String),
      }));
}

class _CopyWithStubImpl$Input$CreateMessageInput<TRes>
    implements CopyWith$Input$CreateMessageInput<TRes> {
  _CopyWithStubImpl$Input$CreateMessageInput(this._res);

  TRes _res;

  call({
    String? bookingId,
    String? guestId,
    String? content,
    String? direction,
    String? status,
    String? channel,
  }) =>
      _res;
}

enum Enum$RoomStatus { AVAILABLE, MAINTENANCE, OCCUPIED, DIRTY, $unknown }

String toJson$Enum$RoomStatus(Enum$RoomStatus e) {
  switch (e) {
    case Enum$RoomStatus.AVAILABLE:
      return r'AVAILABLE';
    case Enum$RoomStatus.MAINTENANCE:
      return r'MAINTENANCE';
    case Enum$RoomStatus.OCCUPIED:
      return r'OCCUPIED';
    case Enum$RoomStatus.DIRTY:
      return r'DIRTY';
    case Enum$RoomStatus.$unknown:
      return r'$unknown';
  }
}

Enum$RoomStatus fromJson$Enum$RoomStatus(String value) {
  switch (value) {
    case r'AVAILABLE':
      return Enum$RoomStatus.AVAILABLE;
    case r'MAINTENANCE':
      return Enum$RoomStatus.MAINTENANCE;
    case r'OCCUPIED':
      return Enum$RoomStatus.OCCUPIED;
    case r'DIRTY':
      return Enum$RoomStatus.DIRTY;
    default:
      return Enum$RoomStatus.$unknown;
  }
}

enum Enum$HousekeepingStatus { READY, DIRTY, CLEANING, INSPECTING, $unknown }

String toJson$Enum$HousekeepingStatus(Enum$HousekeepingStatus e) {
  switch (e) {
    case Enum$HousekeepingStatus.READY:
      return r'READY';
    case Enum$HousekeepingStatus.DIRTY:
      return r'DIRTY';
    case Enum$HousekeepingStatus.CLEANING:
      return r'CLEANING';
    case Enum$HousekeepingStatus.INSPECTING:
      return r'INSPECTING';
    case Enum$HousekeepingStatus.$unknown:
      return r'$unknown';
  }
}

Enum$HousekeepingStatus fromJson$Enum$HousekeepingStatus(String value) {
  switch (value) {
    case r'READY':
      return Enum$HousekeepingStatus.READY;
    case r'DIRTY':
      return Enum$HousekeepingStatus.DIRTY;
    case r'CLEANING':
      return Enum$HousekeepingStatus.CLEANING;
    case r'INSPECTING':
      return Enum$HousekeepingStatus.INSPECTING;
    default:
      return Enum$HousekeepingStatus.$unknown;
  }
}

enum Enum$BookingStatus {
  CONFIRMED,
  CHECKED_IN,
  CHECKED_OUT,
  CANCELLED,
  NO_SHOW,
  $unknown
}

String toJson$Enum$BookingStatus(Enum$BookingStatus e) {
  switch (e) {
    case Enum$BookingStatus.CONFIRMED:
      return r'CONFIRMED';
    case Enum$BookingStatus.CHECKED_IN:
      return r'CHECKED_IN';
    case Enum$BookingStatus.CHECKED_OUT:
      return r'CHECKED_OUT';
    case Enum$BookingStatus.CANCELLED:
      return r'CANCELLED';
    case Enum$BookingStatus.NO_SHOW:
      return r'NO_SHOW';
    case Enum$BookingStatus.$unknown:
      return r'$unknown';
  }
}

Enum$BookingStatus fromJson$Enum$BookingStatus(String value) {
  switch (value) {
    case r'CONFIRMED':
      return Enum$BookingStatus.CONFIRMED;
    case r'CHECKED_IN':
      return Enum$BookingStatus.CHECKED_IN;
    case r'CHECKED_OUT':
      return Enum$BookingStatus.CHECKED_OUT;
    case r'CANCELLED':
      return Enum$BookingStatus.CANCELLED;
    case r'NO_SHOW':
      return Enum$BookingStatus.NO_SHOW;
    default:
      return Enum$BookingStatus.$unknown;
  }
}

enum Enum$BookingSource { DIRECT, OTA, BOOKING_ENGINE, $unknown }

String toJson$Enum$BookingSource(Enum$BookingSource e) {
  switch (e) {
    case Enum$BookingSource.DIRECT:
      return r'DIRECT';
    case Enum$BookingSource.OTA:
      return r'OTA';
    case Enum$BookingSource.BOOKING_ENGINE:
      return r'BOOKING_ENGINE';
    case Enum$BookingSource.$unknown:
      return r'$unknown';
  }
}

Enum$BookingSource fromJson$Enum$BookingSource(String value) {
  switch (value) {
    case r'DIRECT':
      return Enum$BookingSource.DIRECT;
    case r'OTA':
      return Enum$BookingSource.OTA;
    case r'BOOKING_ENGINE':
      return Enum$BookingSource.BOOKING_ENGINE;
    default:
      return Enum$BookingSource.$unknown;
  }
}

enum Enum$PaymentStatus { PENDING, PAID, PARTIAL, REFUNDED, $unknown }

String toJson$Enum$PaymentStatus(Enum$PaymentStatus e) {
  switch (e) {
    case Enum$PaymentStatus.PENDING:
      return r'PENDING';
    case Enum$PaymentStatus.PAID:
      return r'PAID';
    case Enum$PaymentStatus.PARTIAL:
      return r'PARTIAL';
    case Enum$PaymentStatus.REFUNDED:
      return r'REFUNDED';
    case Enum$PaymentStatus.$unknown:
      return r'$unknown';
  }
}

Enum$PaymentStatus fromJson$Enum$PaymentStatus(String value) {
  switch (value) {
    case r'PENDING':
      return Enum$PaymentStatus.PENDING;
    case r'PAID':
      return Enum$PaymentStatus.PAID;
    case r'PARTIAL':
      return Enum$PaymentStatus.PARTIAL;
    case r'REFUNDED':
      return Enum$PaymentStatus.REFUNDED;
    default:
      return Enum$PaymentStatus.$unknown;
  }
}

enum Enum$UserRole {
  SUPER_ADMIN,
  TENANT_ADMIN,
  PROPERTY_MANAGER,
  STAFF,
  $unknown
}

String toJson$Enum$UserRole(Enum$UserRole e) {
  switch (e) {
    case Enum$UserRole.SUPER_ADMIN:
      return r'SUPER_ADMIN';
    case Enum$UserRole.TENANT_ADMIN:
      return r'TENANT_ADMIN';
    case Enum$UserRole.PROPERTY_MANAGER:
      return r'PROPERTY_MANAGER';
    case Enum$UserRole.STAFF:
      return r'STAFF';
    case Enum$UserRole.$unknown:
      return r'$unknown';
  }
}

Enum$UserRole fromJson$Enum$UserRole(String value) {
  switch (value) {
    case r'SUPER_ADMIN':
      return Enum$UserRole.SUPER_ADMIN;
    case r'TENANT_ADMIN':
      return Enum$UserRole.TENANT_ADMIN;
    case r'PROPERTY_MANAGER':
      return Enum$UserRole.PROPERTY_MANAGER;
    case r'STAFF':
      return Enum$UserRole.STAFF;
    default:
      return Enum$UserRole.$unknown;
  }
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
