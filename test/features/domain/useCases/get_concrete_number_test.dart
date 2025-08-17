import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_example/Features/domain/entities/number.dart';
import 'package:flutter_clean_architecture_example/Features/domain/repository/number_repository.dart';
import 'package:flutter_clean_architecture_example/Features/domain/useCases/get_concrete_number.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_concrete_number_test.mocks.dart';

@GenerateMocks([NumberRepository])
void main() {
  late MockNumberRepository mockNumberRepository;
  late GetConcreteNumber getConcreteNumber;

  setUp(() {
    mockNumberRepository = MockNumberRepository();
    getConcreteNumber = GetConcreteNumber(
      numberRepository: mockNumberRepository,
    );
  });

  test('Должен вывести информацию о числе Number Entity', () async {
    final tNumber = 1;
    final tNumberEntity = Number(text: 'text', number: 1);
    // Подготовка
    when(
      mockNumberRepository.getConcreteNumber(any),
    ).thenAnswer((_) async => Right(tNumberEntity));

    // Действие
    final result = await getConcreteNumber.execute(tNumber);

    // Утверждение
    expect(result, Right(tNumberEntity));
    verify(mockNumberRepository.getConcreteNumber(tNumber));
    verifyNoMoreInteractions(mockNumberRepository);
  });
}
