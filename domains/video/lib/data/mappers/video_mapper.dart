import 'package:video/data/models/youtube_video_dto.dart';
import 'package:video/domain/entities/youtube_video_entity.dart';

class VideoMapper {
  const VideoMapper();

  YouTubeVideoEntity mapYouTubeVideoDTOtoEntity(YouTubeVideoDTO? dto) {
    final items = <ItemVideoEntity>[];
    for (ItemVideoDTO i in dto?.items ?? []) {
      items.add(mapItemVideoDTOtoEntity(i));
    }
    return YouTubeVideoEntity(
      kind: dto?.kind ?? '',
      etag: dto?.etag ?? '',
      items: items,
    );
  }

  ItemVideoEntity mapItemVideoDTOtoEntity(ItemVideoDTO? dto) {
    return ItemVideoEntity(
      kind: dto?.kind ?? '',
      etag: dto?.etag ?? '',
      id: mapIdVideoDTOtoEntity(dto?.id),
      snippet: mapSnippetVideoDTOtoEntity(dto?.snippet),
    );
  }

  IdVideoEntity mapIdVideoDTOtoEntity(IdVideoDTO? dto) {
    return IdVideoEntity(kind: dto?.kind ?? '', videoId: dto?.videoId ?? '');
  }

  SnippetVideoEntity mapSnippetVideoDTOtoEntity(SnippetVideoDTO? dto) {
    return SnippetVideoEntity(
      publishedAt: dto?.publishedAt ?? '',
      channelId: dto?.channelId ?? '',
      title: dto?.title ?? '',
      description: dto?.description ?? '',
      thumbnails: mapThumbnailsVideoDTOtoEntity(dto?.thumbnails),
      channelTitle: dto?.channelTitle ?? '',
      publishTime: dto?.publishTime ?? '',
    );
  }

  ThumbnailsVideoEntity mapThumbnailsVideoDTOtoEntity(ThumbnailsVideoDTO? dto) {
    return ThumbnailsVideoEntity(
        medium: mapMediumVideoDTOtoEntity(dto?.medium));
  }

  MediumVideoEntity mapMediumVideoDTOtoEntity(MediumVideoDTO? dto) {
    return MediumVideoEntity(
      url: dto?.url ?? '',
      width: dto?.width ?? 0,
      height: dto?.height ?? 0,
    );
  }

  YouTubeVideoDTO mapYouTubeVideoEntityToDTO(YouTubeVideoEntity entity) {
    final items = <ItemVideoDTO>[];
    for (ItemVideoEntity i in entity.items) {
      items.add(mapItemVideoEntityToDTO(i));
    }

    return YouTubeVideoDTO(
      kind: entity.kind,
      etag: entity.etag,
      items: items,
    );
  }

  ItemVideoDTO mapItemVideoEntityToDTO(ItemVideoEntity entity) {
    return ItemVideoDTO(
      kind: entity.kind,
      etag: entity.etag,
      id: mapIdVideoEntityToDTO(entity.id),
      snippet: mapSnippetVideoEntityToDTO(entity.snippet),
    );
  }

  IdVideoDTO mapIdVideoEntityToDTO(IdVideoEntity entity) {
    return IdVideoDTO(kind: entity.kind, videoId: entity.videoId);
  }

  SnippetVideoDTO mapSnippetVideoEntityToDTO(SnippetVideoEntity entity) {
    return SnippetVideoDTO(
      publishedAt: entity.publishedAt,
      channelId: entity.channelId,
      title: entity.title,
      description: entity.description,
      thumbnails: mapThumbnailsVideoEntityToDTO(entity.thumbnails),
      channelTitle: entity.channelTitle,
      publishTime: entity.publishTime,
    );
  }

  ThumbnailsVideoDTO mapThumbnailsVideoEntityToDTO(
      ThumbnailsVideoEntity entity) {
    return ThumbnailsVideoDTO(medium: mapMediumVideoEntityToDTO(entity.medium));
  }

  MediumVideoDTO mapMediumVideoEntityToDTO(MediumVideoEntity entity) {
    return MediumVideoDTO(
      url: entity.url,
      width: entity.width,
      height: entity.height,
    );
  }
}
