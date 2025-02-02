import 'package:elevate_ecommerce_driver/features/auth/apply/domain_auth/usecases/apply_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/responses/ApplyResponse.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/domain_auth/repos/apply_repo.dart';
import 'apply_use_case_test.mocks.dart';

@GenerateMocks([ApplyRepo])
void main() {
  setUpAll(() {
    provideDummy<ApplyResponse>(ApplyResponse(message: 'test'));

    provideDummy<Result<ApplyResponse?>>(
      Success(ApplyResponse(message: 'success')),
    );

    provideDummy<Result<ApplyResponse?>>(
      Fail(Exception('error'), data: ApplyResponse(error: 'error')),
    );
  });

  late MockApplyRepo mockApplyRepo;
  late ApplyUseCase applyUseCase;

  setUp(() {
    mockApplyRepo = MockApplyRepo();
    applyUseCase = ApplyUseCase(mockApplyRepo);
  });

  group('ApplyUseCase Unit Tests', () {
    test(
      'Should return Success with ApplyResponse when repository call is successful',
          () async {
        const testMessage = 'Application submitted successfully';
        final testFormData = FormData();
        final successResponse = ApplyResponse(message: testMessage);

        when(mockApplyRepo.applyWithFiles(any))
            .thenAnswer((_) async => Success(successResponse));

        final result = await applyUseCase.applyWithFiles(testFormData);

        expect(result, isA<Success<ApplyResponse?>>());
        expect((result as Success).data?.message, testMessage);
        verify(mockApplyRepo.applyWithFiles(testFormData)).called(1);
      },
    );

    test(
      'Should return Fail with error message when repository call fails',
          () async {
        const errorMessage = 'Invalid file format';
        final testFormData = FormData();
        final errorResponse = ApplyResponse(error: errorMessage);

        when(mockApplyRepo.applyWithFiles(any))
            .thenAnswer((_) async => Fail(
          Exception('Server error'),
          data: errorResponse,
        ));

        final result = await applyUseCase.applyWithFiles(testFormData);

        expect(result, isA<Fail<ApplyResponse?>>());
        expect((result as Fail).data?.error, errorMessage);
        verify(mockApplyRepo.applyWithFiles(testFormData)).called(1);
      },
    );
  });
}