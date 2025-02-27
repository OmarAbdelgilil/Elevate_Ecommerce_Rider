// Mocks generated by Mockito 5.4.5 from annotations
// in elevate_ecommerce_driver/test/features/home/domain/usecases/set_order_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:elevate_ecommerce_driver/core/common/result.dart' as _i4;
import 'package:elevate_ecommerce_driver/features/home/data/models/response/firebase_orders_response.dart/firebase_orders_response.dart'
    as _i9;
import 'package:elevate_ecommerce_driver/features/home/data/models/response/start_order_response/start_order_response.dart'
    as _i8;
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/order_entity.dart'
    as _i7;
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/orders_entity.dart'
    as _i5;
import 'package:elevate_ecommerce_driver/features/home/domain/repositories/home_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [HomeRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeRepository extends _i1.Mock implements _i2.HomeRepository {
  MockHomeRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i5.OrdersEntity>> getOrders() => (super.noSuchMethod(
        Invocation.method(
          #getOrders,
          [],
        ),
        returnValue: _i3.Future<_i4.Result<_i5.OrdersEntity>>.value(
            _i6.dummyValue<_i4.Result<_i5.OrdersEntity>>(
          this,
          Invocation.method(
            #getOrders,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i5.OrdersEntity>>);

  @override
  _i3.Future<_i4.Result<bool>> setOngoingOrder(_i7.OrderEntity? order) =>
      (super.noSuchMethod(
        Invocation.method(
          #setOngoingOrder,
          [order],
        ),
        returnValue:
            _i3.Future<_i4.Result<bool>>.value(_i6.dummyValue<_i4.Result<bool>>(
          this,
          Invocation.method(
            #setOngoingOrder,
            [order],
          ),
        )),
      ) as _i3.Future<_i4.Result<bool>>);

  @override
  _i3.Future<_i4.Result<bool>> clearOngoingOrder() => (super.noSuchMethod(
        Invocation.method(
          #clearOngoingOrder,
          [],
        ),
        returnValue:
            _i3.Future<_i4.Result<bool>>.value(_i6.dummyValue<_i4.Result<bool>>(
          this,
          Invocation.method(
            #clearOngoingOrder,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<bool>>);

  @override
  _i3.Future<_i4.Result<bool>> checkOngoingOrder() => (super.noSuchMethod(
        Invocation.method(
          #checkOngoingOrder,
          [],
        ),
        returnValue:
            _i3.Future<_i4.Result<bool>>.value(_i6.dummyValue<_i4.Result<bool>>(
          this,
          Invocation.method(
            #checkOngoingOrder,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<bool>>);

  @override
  _i3.Future<_i4.Result<_i7.OrderEntity>> getOrder() => (super.noSuchMethod(
        Invocation.method(
          #getOrder,
          [],
        ),
        returnValue: _i3.Future<_i4.Result<_i7.OrderEntity>>.value(
            _i6.dummyValue<_i4.Result<_i7.OrderEntity>>(
          this,
          Invocation.method(
            #getOrder,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i7.OrderEntity>>);

  @override
  _i3.Future<_i4.Result<_i8.StartOrderResponse>> startOrder(String? orderId) =>
      (super.noSuchMethod(
        Invocation.method(
          #startOrder,
          [orderId],
        ),
        returnValue: _i3.Future<_i4.Result<_i8.StartOrderResponse>>.value(
            _i6.dummyValue<_i4.Result<_i8.StartOrderResponse>>(
          this,
          Invocation.method(
            #startOrder,
            [orderId],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i8.StartOrderResponse>>);

  @override
  _i3.Future<_i4.Result<_i9.FirebaseOrdersResponse>> getFirebaseOrders() =>
      (super.noSuchMethod(
        Invocation.method(
          #getFirebaseOrders,
          [],
        ),
        returnValue: _i3.Future<_i4.Result<_i9.FirebaseOrdersResponse>>.value(
            _i6.dummyValue<_i4.Result<_i9.FirebaseOrdersResponse>>(
          this,
          Invocation.method(
            #getFirebaseOrders,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i9.FirebaseOrdersResponse>>);

  @override
  _i3.Future<_i4.Result<void>> updateOrderData(
    String? orderStatus,
    String? orderId, {
    String? driverDeviceToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateOrderData,
          [
            orderStatus,
            orderId,
          ],
          {#driverDeviceToken: driverDeviceToken},
        ),
        returnValue:
            _i3.Future<_i4.Result<void>>.value(_i6.dummyValue<_i4.Result<void>>(
          this,
          Invocation.method(
            #updateOrderData,
            [
              orderStatus,
              orderId,
            ],
            {#driverDeviceToken: driverDeviceToken},
          ),
        )),
      ) as _i3.Future<_i4.Result<void>>);

  @override
  _i3.Future<_i4.Result<void>> updateDriverLoc(
    String? orderId,
    double? driverLat,
    double? driverLong,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateDriverLoc,
          [
            orderId,
            driverLat,
            driverLong,
          ],
        ),
        returnValue:
            _i3.Future<_i4.Result<void>>.value(_i6.dummyValue<_i4.Result<void>>(
          this,
          Invocation.method(
            #updateDriverLoc,
            [
              orderId,
              driverLat,
              driverLong,
            ],
          ),
        )),
      ) as _i3.Future<_i4.Result<void>>);

  @override
  _i3.Future<_i4.Result<void>> completeOrder(String? orderId) =>
      (super.noSuchMethod(
        Invocation.method(
          #completeOrder,
          [orderId],
        ),
        returnValue:
            _i3.Future<_i4.Result<void>>.value(_i6.dummyValue<_i4.Result<void>>(
          this,
          Invocation.method(
            #completeOrder,
            [orderId],
          ),
        )),
      ) as _i3.Future<_i4.Result<void>>);
}
