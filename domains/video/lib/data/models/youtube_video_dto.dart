class YouTubeVideoDTO {
  YouTubeVideoDTO({
    required this.kind,
    required this.etag,
    required this.items,
  });

  final String? kind;
  final String? etag;
  final List<ItemVideoDTO>? items;

  factory YouTubeVideoDTO.fromJson(Map<String, dynamic> json) =>
      YouTubeVideoDTO(
        kind: json["kind"],
        etag: json["etag"],
        items: json["items"] == null
            ? null
            : List<ItemVideoDTO>.from(
                json["items"].map((x) => ItemVideoDTO.fromJson(x))),
      );
}

class ItemVideoDTO {
  ItemVideoDTO({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });

  final String? kind;
  final String? etag;
  final IdVideoDTO? id;
  final SnippetVideoDTO? snippet;

  factory ItemVideoDTO.fromJson(Map<String, dynamic> json) => ItemVideoDTO(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"] == null ? null : IdVideoDTO.fromJson(json["id"]),
        snippet: json["snippet"] == null
            ? null
            : SnippetVideoDTO.fromJson(json["snippet"]),
      );
}

class IdVideoDTO {
  IdVideoDTO({
    required this.kind,
    required this.videoId,
  });

  final String? kind;
  final String? videoId;

  factory IdVideoDTO.fromJson(Map<String, dynamic> json) => IdVideoDTO(
        kind: json["kind"],
        videoId: json["videoId"],
      );
}

class SnippetVideoDTO {
  SnippetVideoDTO({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.publishTime,
  });

  final String publishedAt;
  final String? channelId;
  final String? title;
  final String? description;
  final ThumbnailsVideoDTO? thumbnails;
  final String? channelTitle;
  final String publishTime;

  factory SnippetVideoDTO.fromJson(Map<String, dynamic> json) =>
      SnippetVideoDTO(
        publishedAt: json["publishedAt"],
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: json["thumbnails"] == null
            ? null
            : ThumbnailsVideoDTO.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        publishTime: json["publishTime"],
      );
}

class ThumbnailsVideoDTO {
  ThumbnailsVideoDTO({
    required this.medium,
  });

  final MediumVideoDTO? medium;

  factory ThumbnailsVideoDTO.fromJson(Map<String, dynamic> json) =>
      ThumbnailsVideoDTO(
        medium: json["medium"] == null
            ? null
            : MediumVideoDTO.fromJson(json["medium"]),
      );
}

class MediumVideoDTO {
  MediumVideoDTO({
    required this.url,
    required this.width,
    required this.height,
  });

  final String? url;
  final int? width;
  final int? height;

  factory MediumVideoDTO.fromJson(Map<String, dynamic> json) => MediumVideoDTO(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );
}
