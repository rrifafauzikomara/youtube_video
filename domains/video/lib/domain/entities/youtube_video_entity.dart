import 'package:dependencies/equatable/equatable.dart';

class YouTubeVideoEntity extends Equatable {
  const YouTubeVideoEntity({
    required this.kind,
    required this.etag,
    required this.items,
  });

  final String kind;
  final String etag;
  final List<ItemVideoEntity> items;

  @override
  List<Object> get props => [kind, etag, items];
}

class ItemVideoEntity extends Equatable {
  const ItemVideoEntity({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });

  final String kind;
  final String etag;
  final IdVideoEntity id;
  final SnippetVideoEntity snippet;

  @override
  List<Object> get props => [kind, etag, id, snippet];
}

class IdVideoEntity extends Equatable {
  const IdVideoEntity({
    required this.kind,
    required this.videoId,
  });

  final String kind;
  final String videoId;

  @override
  List<Object> get props => [kind, videoId];
}

class SnippetVideoEntity extends Equatable {
  const SnippetVideoEntity({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.publishTime,
  });

  final String publishedAt;
  final String channelId;
  final String title;
  final String description;
  final ThumbnailsVideoEntity thumbnails;
  final String channelTitle;
  final String publishTime;

  @override
  List<Object> get props => [
        publishedAt,
        channelId,
        title,
        description,
        thumbnails,
        channelTitle,
        publishTime,
      ];
}

class ThumbnailsVideoEntity extends Equatable {
  const ThumbnailsVideoEntity({
    required this.medium,
  });

  final MediumVideoEntity medium;

  @override
  List<Object> get props => [medium];
}

class MediumVideoEntity extends Equatable {
  const MediumVideoEntity({
    required this.url,
    required this.width,
    required this.height,
  });

  final String url;
  final int width;
  final int height;

  @override
  List<Object> get props => [url, width, height];
}
