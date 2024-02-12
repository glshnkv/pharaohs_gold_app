import 'package:pharaohs_gold_app/models/level_model.dart';

final List<LevelModel> levelsRepository = [
  LevelModel(
    difficultyIcon: 'assets/images/difficulty/easy.png',
    difficulty: 'Easy',
    isActive: true,
    coins: 10000,
    minutes: 3,
    seconds: 0,
  ),
  LevelModel(
    difficultyIcon: 'assets/images/difficulty/normal.png',
    difficulty: 'Normal',
    isActive: false,
    coins: 15000,
    minutes: 3,
    seconds: 0,
  ),
  LevelModel(
    difficultyIcon: 'assets/images/difficulty/hard.png',
    difficulty: 'Hard',
    isActive: false,
    coins: 20000,
    minutes: 3,
    seconds: 0,
  ),
];
