String formatEpisode(String episode) {
  final episodeSplit = episode.split('/');
  final episodeNumber = "Episode ${episodeSplit[episodeSplit.length - 1]}";
  return episodeNumber;
}
