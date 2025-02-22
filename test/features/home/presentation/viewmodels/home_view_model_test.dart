import 'package:elevate_ecommerce_driver/features/home/data/models/response/firebase_orders_response.dart/firebase_order.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/firebase_orders_response.dart/firebase_orders_response.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/start_order_response/start_order_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/order_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/orders_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/check_firebase_orders_use_case.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/check_order_use_case.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/get_pending_orders_use_case.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/set_order_use_case.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/start_order_use_case.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/update_firebase_order_data_use_case.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/home_screen/viewmodels/home_view_model.dart';
import 'home_view_model_test.mocks.dart';

@GenerateMocks([
  GetPendingOrdersUseCase,
  CheckOrderUseCase,
  SetOrderUseCase,
  StartOrderUseCase,
  CheckFirebaseOrdersUseCase,
  UpdateFirebaseOrderDataUseCase,
])
void main() {
  late HomeViewModel viewModel;
  late MockGetPendingOrdersUseCase mockGetPendingOrdersUseCase;
  late MockCheckOrderUseCase mockCheckOrderUseCase;
  late MockSetOrderUseCase mockSetOrderUseCase;
  late MockStartOrderUseCase mockStartOrderUseCase;
  late MockCheckFirebaseOrdersUseCase mockCheckFirebaseOrdersUseCase;
  late MockUpdateFirebaseOrderDataUseCase mockUpdateFirebaseOrderDataUseCase;

  setUp(() {
    mockGetPendingOrdersUseCase = MockGetPendingOrdersUseCase();
    mockCheckOrderUseCase = MockCheckOrderUseCase();
    mockSetOrderUseCase = MockSetOrderUseCase();
    mockStartOrderUseCase = MockStartOrderUseCase();
    mockCheckFirebaseOrdersUseCase = MockCheckFirebaseOrdersUseCase();
    mockUpdateFirebaseOrderDataUseCase = MockUpdateFirebaseOrderDataUseCase();

    provideDummy<Result<bool>>(Success(true));
    provideDummy<Result<bool>>(Fail(Exception()));
    provideDummy<Result<OrdersEntity>>(Success(OrdersEntity(orders: [])));
    provideDummy<Result<OrdersEntity>>(Fail(Exception()));
    provideDummy<Result<StartOrderResponse>>(Success(StartOrderResponse()));
    provideDummy<Result<StartOrderResponse>>(Fail(Exception()));
    provideDummy<Result<FirebaseOrdersResponse>>(
        Success(FirebaseOrdersResponse()));
    provideDummy<Result<FirebaseOrdersResponse>>(Fail(Exception()));
    provideDummy<Result<void>>(Success(null));
    provideDummy<Result<void>>(Fail(Exception()));

    viewModel = HomeViewModel(
      mockGetPendingOrdersUseCase,
      mockCheckOrderUseCase,
      mockSetOrderUseCase,
      mockStartOrderUseCase,
      mockCheckFirebaseOrdersUseCase,
      mockUpdateFirebaseOrderDataUseCase,
    );
  });

  test('Initial state is InitialState', () {
    expect(viewModel.state, isA<InitialState>());
  });

  test('GetOrdersIntent - emits LoadingState and SuccessState on success',
      () async {
    when(mockCheckOrderUseCase.checkOngoingOrder())
        .thenAnswer((_) async => Success<bool>(false));
    when(mockGetPendingOrdersUseCase.getPendingOrders()).thenAnswer(
        (_) async => Success<OrdersEntity>(OrdersEntity(orders: [])));
    when(mockCheckFirebaseOrdersUseCase.getFirebaseOrders()).thenAnswer(
        (_) async => Success<FirebaseOrdersResponse>(
            FirebaseOrdersResponse(orders: [FirebaseOrder()])));

    expectLater(
      viewModel.stream,
      emitsInOrder([isA<LoadingState>(), isA<SuccessState>()]),
    );

    viewModel.doIntent(GetOrdersIntent());
  });

  test('GetOrdersIntent - emits LoadingState and ErrorState on failure',
      () async {
    when(mockCheckOrderUseCase.checkOngoingOrder())
        .thenAnswer((_) async => Success<bool>(false));
    when(mockGetPendingOrdersUseCase.getPendingOrders())
        .thenAnswer((_) async => Fail<OrdersEntity>(Exception('Error')));

    expectLater(
      viewModel.stream,
      emitsInOrder([isA<LoadingState>(), isA<ErrorState>()]),
    );

    viewModel.doIntent(GetOrdersIntent());
  });

  test('RejectOrderIntent - emits LoadingState and SuccessState', () async {
    viewModel.orders = [OrderEntity(id: '1')];

    expectLater(
      viewModel.stream,
      emitsInOrder([isA<LoadingState>(), isA<SuccessState>()]),
    );

    viewModel.doIntent(RejectOrderIntent('1'));
  });

  test(
      'AcceptOrderIntent - emits LoadingState and OrderOngoingState on success',
      () async {
    final order = OrderEntity(id: '1');

    when(mockSetOrderUseCase.setOngoingOrder(order))
        .thenAnswer((_) async => Success<bool>(true));
    when(mockStartOrderUseCase.startOrder(order.id!)).thenAnswer(
        (_) async => Success<StartOrderResponse>(StartOrderResponse()));
    when(mockUpdateFirebaseOrderDataUseCase.updateOrderData(any, any))
        .thenAnswer((_) async => Success<void>(null));

    expectLater(
      viewModel.stream,
      emitsInOrder([isA<LoadingState>(), isA<OrderOngoingState>()]),
    );

    viewModel.doIntent(AcceptOrderIntent(order));
  });

  test('AcceptOrderIntent - emits LoadingState and ErrorState on failure',
      () async {
    final order = OrderEntity(id: '1');
    when(mockSetOrderUseCase.setOngoingOrder(order))
        .thenAnswer((_) async => Fail<bool>(Exception()));
    when(mockStartOrderUseCase.startOrder(order.id!))
        .thenAnswer((_) async => Fail<StartOrderResponse>(Exception()));
    when(mockUpdateFirebaseOrderDataUseCase.updateOrderData(any, any))
        .thenAnswer((_) async => Fail<void>(null));

    expectLater(
      viewModel.stream,
      emitsInOrder([isA<LoadingState>(), isA<ErrorState>()]),
    );

    viewModel.doIntent(AcceptOrderIntent(order));
  });
}
