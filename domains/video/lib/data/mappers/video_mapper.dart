import 'package:video/data/models/test_dto.dart';
import 'package:video/domain/entities/test_entity.dart';

class VideoMapper {
  const VideoMapper();

  TestEntity mapTestDTOtoEntity(TestDTO? dto) {
    return TestEntity(
      userId: dto?.userId ?? 0,
      id: dto?.id ?? 0,
      title: dto?.title ?? '',
    );
  }

  TestDTO mapTestEntityToDTO(TestEntity entity) {
    return TestDTO(
      userId: entity.userId,
      id: entity.id,
      title: entity.title,
    );
  }
}
