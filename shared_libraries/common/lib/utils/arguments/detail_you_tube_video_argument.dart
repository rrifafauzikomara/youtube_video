import 'package:dependencies/equatable/equatable.dart';

class DetailYouTubeVideoArgument extends Equatable {
  final String youTubeTitle;
  final String youTubeId;

  const DetailYouTubeVideoArgument({
    required this.youTubeTitle,
    required this.youTubeId,
  });

  @override
  List<Object?> get props => [youTubeTitle, youTubeId];
}
