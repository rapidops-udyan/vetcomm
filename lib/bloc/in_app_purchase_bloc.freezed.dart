// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'in_app_purchase_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InAppPurchaseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() fetchProducts,
    required TResult Function() restorePurchases,
    required TResult Function(
            ProductDetails product, PurchaseDetails? oldPurchaseDetails)
        buyProduct,
    required TResult Function(List<PurchaseDetails> purchaseDetailsList)
        updatePurchases,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? fetchProducts,
    TResult? Function()? restorePurchases,
    TResult? Function(
            ProductDetails product, PurchaseDetails? oldPurchaseDetails)?
        buyProduct,
    TResult? Function(List<PurchaseDetails> purchaseDetailsList)?
        updatePurchases,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? fetchProducts,
    TResult Function()? restorePurchases,
    TResult Function(
            ProductDetails product, PurchaseDetails? oldPurchaseDetails)?
        buyProduct,
    TResult Function(List<PurchaseDetails> purchaseDetailsList)?
        updatePurchases,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InAppPurchaseInitializeEvent value) initialize,
    required TResult Function(_InAppPurchaseFetchProductsEvent value)
        fetchProducts,
    required TResult Function(_InAppPurchaseRestorePurchasesEvent value)
        restorePurchases,
    required TResult Function(_InAppPurchaseBuyProductEvent value) buyProduct,
    required TResult Function(_InAppPurchaseUpdatePurchasesEvent value)
        updatePurchases,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InAppPurchaseInitializeEvent value)? initialize,
    TResult? Function(_InAppPurchaseFetchProductsEvent value)? fetchProducts,
    TResult? Function(_InAppPurchaseRestorePurchasesEvent value)?
        restorePurchases,
    TResult? Function(_InAppPurchaseBuyProductEvent value)? buyProduct,
    TResult? Function(_InAppPurchaseUpdatePurchasesEvent value)?
        updatePurchases,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InAppPurchaseInitializeEvent value)? initialize,
    TResult Function(_InAppPurchaseFetchProductsEvent value)? fetchProducts,
    TResult Function(_InAppPurchaseRestorePurchasesEvent value)?
        restorePurchases,
    TResult Function(_InAppPurchaseBuyProductEvent value)? buyProduct,
    TResult Function(_InAppPurchaseUpdatePurchasesEvent value)? updatePurchases,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InAppPurchaseEventCopyWith<$Res> {
  factory $InAppPurchaseEventCopyWith(
          InAppPurchaseEvent value, $Res Function(InAppPurchaseEvent) then) =
      _$InAppPurchaseEventCopyWithImpl<$Res, InAppPurchaseEvent>;
}

/// @nodoc
class _$InAppPurchaseEventCopyWithImpl<$Res, $Val extends InAppPurchaseEvent>
    implements $InAppPurchaseEventCopyWith<$Res> {
  _$InAppPurchaseEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InAppPurchaseInitializeEventImplCopyWith<$Res> {
  factory _$$InAppPurchaseInitializeEventImplCopyWith(
          _$InAppPurchaseInitializeEventImpl value,
          $Res Function(_$InAppPurchaseInitializeEventImpl) then) =
      __$$InAppPurchaseInitializeEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InAppPurchaseInitializeEventImplCopyWithImpl<$Res>
    extends _$InAppPurchaseEventCopyWithImpl<$Res,
        _$InAppPurchaseInitializeEventImpl>
    implements _$$InAppPurchaseInitializeEventImplCopyWith<$Res> {
  __$$InAppPurchaseInitializeEventImplCopyWithImpl(
      _$InAppPurchaseInitializeEventImpl _value,
      $Res Function(_$InAppPurchaseInitializeEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InAppPurchaseInitializeEventImpl
    implements _InAppPurchaseInitializeEvent {
  const _$InAppPurchaseInitializeEventImpl();

  @override
  String toString() {
    return 'InAppPurchaseEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InAppPurchaseInitializeEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() fetchProducts,
    required TResult Function() restorePurchases,
    required TResult Function(
            ProductDetails product, PurchaseDetails? oldPurchaseDetails)
        buyProduct,
    required TResult Function(List<PurchaseDetails> purchaseDetailsList)
        updatePurchases,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? fetchProducts,
    TResult? Function()? restorePurchases,
    TResult? Function(
            ProductDetails product, PurchaseDetails? oldPurchaseDetails)?
        buyProduct,
    TResult? Function(List<PurchaseDetails> purchaseDetailsList)?
        updatePurchases,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? fetchProducts,
    TResult Function()? restorePurchases,
    TResult Function(
            ProductDetails product, PurchaseDetails? oldPurchaseDetails)?
        buyProduct,
    TResult Function(List<PurchaseDetails> purchaseDetailsList)?
        updatePurchases,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InAppPurchaseInitializeEvent value) initialize,
    required TResult Function(_InAppPurchaseFetchProductsEvent value)
        fetchProducts,
    required TResult Function(_InAppPurchaseRestorePurchasesEvent value)
        restorePurchases,
    required TResult Function(_InAppPurchaseBuyProductEvent value) buyProduct,
    required TResult Function(_InAppPurchaseUpdatePurchasesEvent value)
        updatePurchases,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InAppPurchaseInitializeEvent value)? initialize,
    TResult? Function(_InAppPurchaseFetchProductsEvent value)? fetchProducts,
    TResult? Function(_InAppPurchaseRestorePurchasesEvent value)?
        restorePurchases,
    TResult? Function(_InAppPurchaseBuyProductEvent value)? buyProduct,
    TResult? Function(_InAppPurchaseUpdatePurchasesEvent value)?
        updatePurchases,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InAppPurchaseInitializeEvent value)? initialize,
    TResult Function(_InAppPurchaseFetchProductsEvent value)? fetchProducts,
    TResult Function(_InAppPurchaseRestorePurchasesEvent value)?
        restorePurchases,
    TResult Function(_InAppPurchaseBuyProductEvent value)? buyProduct,
    TResult Function(_InAppPurchaseUpdatePurchasesEvent value)? updatePurchases,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _InAppPurchaseInitializeEvent implements InAppPurchaseEvent {
  const factory _InAppPurchaseInitializeEvent() =
      _$InAppPurchaseInitializeEventImpl;
}

/// @nodoc
abstract class _$$InAppPurchaseFetchProductsEventImplCopyWith<$Res> {
  factory _$$InAppPurchaseFetchProductsEventImplCopyWith(
          _$InAppPurchaseFetchProductsEventImpl value,
          $Res Function(_$InAppPurchaseFetchProductsEventImpl) then) =
      __$$InAppPurchaseFetchProductsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InAppPurchaseFetchProductsEventImplCopyWithImpl<$Res>
    extends _$InAppPurchaseEventCopyWithImpl<$Res,
        _$InAppPurchaseFetchProductsEventImpl>
    implements _$$InAppPurchaseFetchProductsEventImplCopyWith<$Res> {
  __$$InAppPurchaseFetchProductsEventImplCopyWithImpl(
      _$InAppPurchaseFetchProductsEventImpl _value,
      $Res Function(_$InAppPurchaseFetchProductsEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InAppPurchaseFetchProductsEventImpl
    implements _InAppPurchaseFetchProductsEvent {
  const _$InAppPurchaseFetchProductsEventImpl();

  @override
  String toString() {
    return 'InAppPurchaseEvent.fetchProducts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InAppPurchaseFetchProductsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() fetchProducts,
    required TResult Function() restorePurchases,
    required TResult Function(
            ProductDetails product, PurchaseDetails? oldPurchaseDetails)
        buyProduct,
    required TResult Function(List<PurchaseDetails> purchaseDetailsList)
        updatePurchases,
  }) {
    return fetchProducts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? fetchProducts,
    TResult? Function()? restorePurchases,
    TResult? Function(
            ProductDetails product, PurchaseDetails? oldPurchaseDetails)?
        buyProduct,
    TResult? Function(List<PurchaseDetails> purchaseDetailsList)?
        updatePurchases,
  }) {
    return fetchProducts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? fetchProducts,
    TResult Function()? restorePurchases,
    TResult Function(
            ProductDetails product, PurchaseDetails? oldPurchaseDetails)?
        buyProduct,
    TResult Function(List<PurchaseDetails> purchaseDetailsList)?
        updatePurchases,
    required TResult orElse(),
  }) {
    if (fetchProducts != null) {
      return fetchProducts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InAppPurchaseInitializeEvent value) initialize,
    required TResult Function(_InAppPurchaseFetchProductsEvent value)
        fetchProducts,
    required TResult Function(_InAppPurchaseRestorePurchasesEvent value)
        restorePurchases,
    required TResult Function(_InAppPurchaseBuyProductEvent value) buyProduct,
    required TResult Function(_InAppPurchaseUpdatePurchasesEvent value)
        updatePurchases,
  }) {
    return fetchProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InAppPurchaseInitializeEvent value)? initialize,
    TResult? Function(_InAppPurchaseFetchProductsEvent value)? fetchProducts,
    TResult? Function(_InAppPurchaseRestorePurchasesEvent value)?
        restorePurchases,
    TResult? Function(_InAppPurchaseBuyProductEvent value)? buyProduct,
    TResult? Function(_InAppPurchaseUpdatePurchasesEvent value)?
        updatePurchases,
  }) {
    return fetchProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InAppPurchaseInitializeEvent value)? initialize,
    TResult Function(_InAppPurchaseFetchProductsEvent value)? fetchProducts,
    TResult Function(_InAppPurchaseRestorePurchasesEvent value)?
        restorePurchases,
    TResult Function(_InAppPurchaseBuyProductEvent value)? buyProduct,
    TResult Function(_InAppPurchaseUpdatePurchasesEvent value)? updatePurchases,
    required TResult orElse(),
  }) {
    if (fetchProducts != null) {
      return fetchProducts(this);
    }
    return orElse();
  }
}

abstract class _InAppPurchaseFetchProductsEvent implements InAppPurchaseEvent {
  const factory _InAppPurchaseFetchProductsEvent() =
      _$InAppPurchaseFetchProductsEventImpl;
}

/// @nodoc
abstract class _$$InAppPurchaseRestorePurchasesEventImplCopyWith<$Res> {
  factory _$$InAppPurchaseRestorePurchasesEventImplCopyWith(
          _$InAppPurchaseRestorePurchasesEventImpl value,
          $Res Function(_$InAppPurchaseRestorePurchasesEventImpl) then) =
      __$$InAppPurchaseRestorePurchasesEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InAppPurchaseRestorePurchasesEventImplCopyWithImpl<$Res>
    extends _$InAppPurchaseEventCopyWithImpl<$Res,
        _$InAppPurchaseRestorePurchasesEventImpl>
    implements _$$InAppPurchaseRestorePurchasesEventImplCopyWith<$Res> {
  __$$InAppPurchaseRestorePurchasesEventImplCopyWithImpl(
      _$InAppPurchaseRestorePurchasesEventImpl _value,
      $Res Function(_$InAppPurchaseRestorePurchasesEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InAppPurchaseRestorePurchasesEventImpl
    implements _InAppPurchaseRestorePurchasesEvent {
  const _$InAppPurchaseRestorePurchasesEventImpl();

  @override
  String toString() {
    return 'InAppPurchaseEvent.restorePurchases()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InAppPurchaseRestorePurchasesEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() fetchProducts,
    required TResult Function() restorePurchases,
    required TResult Function(
            ProductDetails product, PurchaseDetails? oldPurchaseDetails)
        buyProduct,
    required TResult Function(List<PurchaseDetails> purchaseDetailsList)
        updatePurchases,
  }) {
    return restorePurchases();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? fetchProducts,
    TResult? Function()? restorePurchases,
    TResult? Function(
            ProductDetails product, PurchaseDetails? oldPurchaseDetails)?
        buyProduct,
    TResult? Function(List<PurchaseDetails> purchaseDetailsList)?
        updatePurchases,
  }) {
    return restorePurchases?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? fetchProducts,
    TResult Function()? restorePurchases,
    TResult Function(
            ProductDetails product, PurchaseDetails? oldPurchaseDetails)?
        buyProduct,
    TResult Function(List<PurchaseDetails> purchaseDetailsList)?
        updatePurchases,
    required TResult orElse(),
  }) {
    if (restorePurchases != null) {
      return restorePurchases();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InAppPurchaseInitializeEvent value) initialize,
    required TResult Function(_InAppPurchaseFetchProductsEvent value)
        fetchProducts,
    required TResult Function(_InAppPurchaseRestorePurchasesEvent value)
        restorePurchases,
    required TResult Function(_InAppPurchaseBuyProductEvent value) buyProduct,
    required TResult Function(_InAppPurchaseUpdatePurchasesEvent value)
        updatePurchases,
  }) {
    return restorePurchases(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InAppPurchaseInitializeEvent value)? initialize,
    TResult? Function(_InAppPurchaseFetchProductsEvent value)? fetchProducts,
    TResult? Function(_InAppPurchaseRestorePurchasesEvent value)?
        restorePurchases,
    TResult? Function(_InAppPurchaseBuyProductEvent value)? buyProduct,
    TResult? Function(_InAppPurchaseUpdatePurchasesEvent value)?
        updatePurchases,
  }) {
    return restorePurchases?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InAppPurchaseInitializeEvent value)? initialize,
    TResult Function(_InAppPurchaseFetchProductsEvent value)? fetchProducts,
    TResult Function(_InAppPurchaseRestorePurchasesEvent value)?
        restorePurchases,
    TResult Function(_InAppPurchaseBuyProductEvent value)? buyProduct,
    TResult Function(_InAppPurchaseUpdatePurchasesEvent value)? updatePurchases,
    required TResult orElse(),
  }) {
    if (restorePurchases != null) {
      return restorePurchases(this);
    }
    return orElse();
  }
}

abstract class _InAppPurchaseRestorePurchasesEvent
    implements InAppPurchaseEvent {
  const factory _InAppPurchaseRestorePurchasesEvent() =
      _$InAppPurchaseRestorePurchasesEventImpl;
}

/// @nodoc
abstract class _$$InAppPurchaseBuyProductEventImplCopyWith<$Res> {
  factory _$$InAppPurchaseBuyProductEventImplCopyWith(
          _$InAppPurchaseBuyProductEventImpl value,
          $Res Function(_$InAppPurchaseBuyProductEventImpl) then) =
      __$$InAppPurchaseBuyProductEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductDetails product, PurchaseDetails? oldPurchaseDetails});
}

/// @nodoc
class __$$InAppPurchaseBuyProductEventImplCopyWithImpl<$Res>
    extends _$InAppPurchaseEventCopyWithImpl<$Res,
        _$InAppPurchaseBuyProductEventImpl>
    implements _$$InAppPurchaseBuyProductEventImplCopyWith<$Res> {
  __$$InAppPurchaseBuyProductEventImplCopyWithImpl(
      _$InAppPurchaseBuyProductEventImpl _value,
      $Res Function(_$InAppPurchaseBuyProductEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? oldPurchaseDetails = freezed,
  }) {
    return _then(_$InAppPurchaseBuyProductEventImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductDetails,
      freezed == oldPurchaseDetails
          ? _value.oldPurchaseDetails
          : oldPurchaseDetails // ignore: cast_nullable_to_non_nullable
              as PurchaseDetails?,
    ));
  }
}

/// @nodoc

class _$InAppPurchaseBuyProductEventImpl
    implements _InAppPurchaseBuyProductEvent {
  const _$InAppPurchaseBuyProductEventImpl(this.product,
      [this.oldPurchaseDetails]);

  @override
  final ProductDetails product;
  @override
  final PurchaseDetails? oldPurchaseDetails;

  @override
  String toString() {
    return 'InAppPurchaseEvent.buyProduct(product: $product, oldPurchaseDetails: $oldPurchaseDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InAppPurchaseBuyProductEventImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.oldPurchaseDetails, oldPurchaseDetails) ||
                other.oldPurchaseDetails == oldPurchaseDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, oldPurchaseDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InAppPurchaseBuyProductEventImplCopyWith<
          _$InAppPurchaseBuyProductEventImpl>
      get copyWith => __$$InAppPurchaseBuyProductEventImplCopyWithImpl<
          _$InAppPurchaseBuyProductEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() fetchProducts,
    required TResult Function() restorePurchases,
    required TResult Function(
            ProductDetails product, PurchaseDetails? oldPurchaseDetails)
        buyProduct,
    required TResult Function(List<PurchaseDetails> purchaseDetailsList)
        updatePurchases,
  }) {
    return buyProduct(product, oldPurchaseDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? fetchProducts,
    TResult? Function()? restorePurchases,
    TResult? Function(
            ProductDetails product, PurchaseDetails? oldPurchaseDetails)?
        buyProduct,
    TResult? Function(List<PurchaseDetails> purchaseDetailsList)?
        updatePurchases,
  }) {
    return buyProduct?.call(product, oldPurchaseDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? fetchProducts,
    TResult Function()? restorePurchases,
    TResult Function(
            ProductDetails product, PurchaseDetails? oldPurchaseDetails)?
        buyProduct,
    TResult Function(List<PurchaseDetails> purchaseDetailsList)?
        updatePurchases,
    required TResult orElse(),
  }) {
    if (buyProduct != null) {
      return buyProduct(product, oldPurchaseDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InAppPurchaseInitializeEvent value) initialize,
    required TResult Function(_InAppPurchaseFetchProductsEvent value)
        fetchProducts,
    required TResult Function(_InAppPurchaseRestorePurchasesEvent value)
        restorePurchases,
    required TResult Function(_InAppPurchaseBuyProductEvent value) buyProduct,
    required TResult Function(_InAppPurchaseUpdatePurchasesEvent value)
        updatePurchases,
  }) {
    return buyProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InAppPurchaseInitializeEvent value)? initialize,
    TResult? Function(_InAppPurchaseFetchProductsEvent value)? fetchProducts,
    TResult? Function(_InAppPurchaseRestorePurchasesEvent value)?
        restorePurchases,
    TResult? Function(_InAppPurchaseBuyProductEvent value)? buyProduct,
    TResult? Function(_InAppPurchaseUpdatePurchasesEvent value)?
        updatePurchases,
  }) {
    return buyProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InAppPurchaseInitializeEvent value)? initialize,
    TResult Function(_InAppPurchaseFetchProductsEvent value)? fetchProducts,
    TResult Function(_InAppPurchaseRestorePurchasesEvent value)?
        restorePurchases,
    TResult Function(_InAppPurchaseBuyProductEvent value)? buyProduct,
    TResult Function(_InAppPurchaseUpdatePurchasesEvent value)? updatePurchases,
    required TResult orElse(),
  }) {
    if (buyProduct != null) {
      return buyProduct(this);
    }
    return orElse();
  }
}

abstract class _InAppPurchaseBuyProductEvent implements InAppPurchaseEvent {
  const factory _InAppPurchaseBuyProductEvent(final ProductDetails product,
          [final PurchaseDetails? oldPurchaseDetails]) =
      _$InAppPurchaseBuyProductEventImpl;

  ProductDetails get product;
  PurchaseDetails? get oldPurchaseDetails;
  @JsonKey(ignore: true)
  _$$InAppPurchaseBuyProductEventImplCopyWith<
          _$InAppPurchaseBuyProductEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InAppPurchaseUpdatePurchasesEventImplCopyWith<$Res> {
  factory _$$InAppPurchaseUpdatePurchasesEventImplCopyWith(
          _$InAppPurchaseUpdatePurchasesEventImpl value,
          $Res Function(_$InAppPurchaseUpdatePurchasesEventImpl) then) =
      __$$InAppPurchaseUpdatePurchasesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PurchaseDetails> purchaseDetailsList});
}

/// @nodoc
class __$$InAppPurchaseUpdatePurchasesEventImplCopyWithImpl<$Res>
    extends _$InAppPurchaseEventCopyWithImpl<$Res,
        _$InAppPurchaseUpdatePurchasesEventImpl>
    implements _$$InAppPurchaseUpdatePurchasesEventImplCopyWith<$Res> {
  __$$InAppPurchaseUpdatePurchasesEventImplCopyWithImpl(
      _$InAppPurchaseUpdatePurchasesEventImpl _value,
      $Res Function(_$InAppPurchaseUpdatePurchasesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseDetailsList = null,
  }) {
    return _then(_$InAppPurchaseUpdatePurchasesEventImpl(
      null == purchaseDetailsList
          ? _value._purchaseDetailsList
          : purchaseDetailsList // ignore: cast_nullable_to_non_nullable
              as List<PurchaseDetails>,
    ));
  }
}

/// @nodoc

class _$InAppPurchaseUpdatePurchasesEventImpl
    implements _InAppPurchaseUpdatePurchasesEvent {
  const _$InAppPurchaseUpdatePurchasesEventImpl(
      final List<PurchaseDetails> purchaseDetailsList)
      : _purchaseDetailsList = purchaseDetailsList;

  final List<PurchaseDetails> _purchaseDetailsList;
  @override
  List<PurchaseDetails> get purchaseDetailsList {
    if (_purchaseDetailsList is EqualUnmodifiableListView)
      return _purchaseDetailsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_purchaseDetailsList);
  }

  @override
  String toString() {
    return 'InAppPurchaseEvent.updatePurchases(purchaseDetailsList: $purchaseDetailsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InAppPurchaseUpdatePurchasesEventImpl &&
            const DeepCollectionEquality()
                .equals(other._purchaseDetailsList, _purchaseDetailsList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_purchaseDetailsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InAppPurchaseUpdatePurchasesEventImplCopyWith<
          _$InAppPurchaseUpdatePurchasesEventImpl>
      get copyWith => __$$InAppPurchaseUpdatePurchasesEventImplCopyWithImpl<
          _$InAppPurchaseUpdatePurchasesEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() fetchProducts,
    required TResult Function() restorePurchases,
    required TResult Function(
            ProductDetails product, PurchaseDetails? oldPurchaseDetails)
        buyProduct,
    required TResult Function(List<PurchaseDetails> purchaseDetailsList)
        updatePurchases,
  }) {
    return updatePurchases(purchaseDetailsList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? fetchProducts,
    TResult? Function()? restorePurchases,
    TResult? Function(
            ProductDetails product, PurchaseDetails? oldPurchaseDetails)?
        buyProduct,
    TResult? Function(List<PurchaseDetails> purchaseDetailsList)?
        updatePurchases,
  }) {
    return updatePurchases?.call(purchaseDetailsList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? fetchProducts,
    TResult Function()? restorePurchases,
    TResult Function(
            ProductDetails product, PurchaseDetails? oldPurchaseDetails)?
        buyProduct,
    TResult Function(List<PurchaseDetails> purchaseDetailsList)?
        updatePurchases,
    required TResult orElse(),
  }) {
    if (updatePurchases != null) {
      return updatePurchases(purchaseDetailsList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InAppPurchaseInitializeEvent value) initialize,
    required TResult Function(_InAppPurchaseFetchProductsEvent value)
        fetchProducts,
    required TResult Function(_InAppPurchaseRestorePurchasesEvent value)
        restorePurchases,
    required TResult Function(_InAppPurchaseBuyProductEvent value) buyProduct,
    required TResult Function(_InAppPurchaseUpdatePurchasesEvent value)
        updatePurchases,
  }) {
    return updatePurchases(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InAppPurchaseInitializeEvent value)? initialize,
    TResult? Function(_InAppPurchaseFetchProductsEvent value)? fetchProducts,
    TResult? Function(_InAppPurchaseRestorePurchasesEvent value)?
        restorePurchases,
    TResult? Function(_InAppPurchaseBuyProductEvent value)? buyProduct,
    TResult? Function(_InAppPurchaseUpdatePurchasesEvent value)?
        updatePurchases,
  }) {
    return updatePurchases?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InAppPurchaseInitializeEvent value)? initialize,
    TResult Function(_InAppPurchaseFetchProductsEvent value)? fetchProducts,
    TResult Function(_InAppPurchaseRestorePurchasesEvent value)?
        restorePurchases,
    TResult Function(_InAppPurchaseBuyProductEvent value)? buyProduct,
    TResult Function(_InAppPurchaseUpdatePurchasesEvent value)? updatePurchases,
    required TResult orElse(),
  }) {
    if (updatePurchases != null) {
      return updatePurchases(this);
    }
    return orElse();
  }
}

abstract class _InAppPurchaseUpdatePurchasesEvent
    implements InAppPurchaseEvent {
  const factory _InAppPurchaseUpdatePurchasesEvent(
          final List<PurchaseDetails> purchaseDetailsList) =
      _$InAppPurchaseUpdatePurchasesEventImpl;

  List<PurchaseDetails> get purchaseDetailsList;
  @JsonKey(ignore: true)
  _$$InAppPurchaseUpdatePurchasesEventImplCopyWith<
          _$InAppPurchaseUpdatePurchasesEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InAppPurchaseState {
  InAppPurchaseStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<ProductDetails> get products => throw _privateConstructorUsedError;
  PurchaseDetails? get activeSubscription => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InAppPurchaseStateCopyWith<InAppPurchaseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InAppPurchaseStateCopyWith<$Res> {
  factory $InAppPurchaseStateCopyWith(
          InAppPurchaseState value, $Res Function(InAppPurchaseState) then) =
      _$InAppPurchaseStateCopyWithImpl<$Res, InAppPurchaseState>;
  @useResult
  $Res call(
      {InAppPurchaseStatus status,
      String? error,
      List<ProductDetails> products,
      PurchaseDetails? activeSubscription});
}

/// @nodoc
class _$InAppPurchaseStateCopyWithImpl<$Res, $Val extends InAppPurchaseState>
    implements $InAppPurchaseStateCopyWith<$Res> {
  _$InAppPurchaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? products = null,
    Object? activeSubscription = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InAppPurchaseStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDetails>,
      activeSubscription: freezed == activeSubscription
          ? _value.activeSubscription
          : activeSubscription // ignore: cast_nullable_to_non_nullable
              as PurchaseDetails?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InAppPurchaseStateImplCopyWith<$Res>
    implements $InAppPurchaseStateCopyWith<$Res> {
  factory _$$InAppPurchaseStateImplCopyWith(_$InAppPurchaseStateImpl value,
          $Res Function(_$InAppPurchaseStateImpl) then) =
      __$$InAppPurchaseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {InAppPurchaseStatus status,
      String? error,
      List<ProductDetails> products,
      PurchaseDetails? activeSubscription});
}

/// @nodoc
class __$$InAppPurchaseStateImplCopyWithImpl<$Res>
    extends _$InAppPurchaseStateCopyWithImpl<$Res, _$InAppPurchaseStateImpl>
    implements _$$InAppPurchaseStateImplCopyWith<$Res> {
  __$$InAppPurchaseStateImplCopyWithImpl(_$InAppPurchaseStateImpl _value,
      $Res Function(_$InAppPurchaseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? products = null,
    Object? activeSubscription = freezed,
  }) {
    return _then(_$InAppPurchaseStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InAppPurchaseStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDetails>,
      activeSubscription: freezed == activeSubscription
          ? _value.activeSubscription
          : activeSubscription // ignore: cast_nullable_to_non_nullable
              as PurchaseDetails?,
    ));
  }
}

/// @nodoc

class _$InAppPurchaseStateImpl implements _InAppPurchaseState {
  const _$InAppPurchaseStateImpl(
      {this.status = InAppPurchaseStatus.initial,
      this.error,
      final List<ProductDetails> products = const [],
      this.activeSubscription})
      : _products = products;

  @override
  @JsonKey()
  final InAppPurchaseStatus status;
  @override
  final String? error;
  final List<ProductDetails> _products;
  @override
  @JsonKey()
  List<ProductDetails> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final PurchaseDetails? activeSubscription;

  @override
  String toString() {
    return 'InAppPurchaseState(status: $status, error: $error, products: $products, activeSubscription: $activeSubscription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InAppPurchaseStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.activeSubscription, activeSubscription) ||
                other.activeSubscription == activeSubscription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error,
      const DeepCollectionEquality().hash(_products), activeSubscription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InAppPurchaseStateImplCopyWith<_$InAppPurchaseStateImpl> get copyWith =>
      __$$InAppPurchaseStateImplCopyWithImpl<_$InAppPurchaseStateImpl>(
          this, _$identity);
}

abstract class _InAppPurchaseState implements InAppPurchaseState {
  const factory _InAppPurchaseState(
      {final InAppPurchaseStatus status,
      final String? error,
      final List<ProductDetails> products,
      final PurchaseDetails? activeSubscription}) = _$InAppPurchaseStateImpl;

  @override
  InAppPurchaseStatus get status;
  @override
  String? get error;
  @override
  List<ProductDetails> get products;
  @override
  PurchaseDetails? get activeSubscription;
  @override
  @JsonKey(ignore: true)
  _$$InAppPurchaseStateImplCopyWith<_$InAppPurchaseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
