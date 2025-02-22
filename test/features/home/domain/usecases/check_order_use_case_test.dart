import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/repositories/home_repository.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/check_order_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'check_order_use_case_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late CheckOrderUseCase checkOrderUseCase;
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    checkOrderUseCase = CheckOrderUseCase(mockHomeRepository);
    provideDummy<Result<bool>>(Success(true));
    provideDummy<Result<bool>>(Fail(Exception("No ongoing order found")));
  });

  group('CheckOrderUseCase Tests', () {
    test('checkOngoingOrder calls checkOngoingOrder on HomeRepository',
        () async {
      final successResult = Success<bool>(true);

      when(mockHomeRepository.checkOngoingOrder())
          .thenAnswer((_) async => successResult);

      final result = await checkOrderUseCase.checkOngoingOrder();

      expect(result, successResult);
      verify(mockHomeRepository.checkOngoingOrder()).called(1);
    });

    test('checkOngoingOrder returns Fail when HomeRepository fails', () async {
      final exception = Exception("No ongoing order found");
      final failResult = Fail<bool>(exception);

      when(mockHomeRepository.checkOngoingOrder())
          .thenAnswer((_) async => failResult);

      final result = await checkOrderUseCase.checkOngoingOrder();

      expect(result, failResult);
      verify(mockHomeRepository.checkOngoingOrder()).called(1);
    });
  });
}
