class LevelModel {
  final String difficultyIcon;
  final String difficulty;
  bool isActive;
  int minutes;
  int seconds;
  int coins;

  LevelModel({
    required this.difficultyIcon,
    required this.difficulty,
    required this.isActive,
    required this.coins,
    required this.minutes,
    required this.seconds,
  });
}
