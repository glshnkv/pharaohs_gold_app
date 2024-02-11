import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharaohs_gold_app/models/level_model.dart';
import 'package:pharaohs_gold_app/repository/levels_repository.dart';
import 'package:pharaohs_gold_app/router/router.dart';
import 'package:pharaohs_gold_app/theme/colors.dart';
import 'package:pharaohs_gold_app/widgets/action_button_widget.dart';
import 'package:pharaohs_gold_app/widgets/menu_button.dart';

@RoutePage()
class GameScreen extends StatefulWidget {
  final LevelModel level;

  const GameScreen({super.key, required this.level});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<List<String>> board = List.generate(6, (i) => List.filled(11, ""));
  int startGameTime = DateTime.now().millisecondsSinceEpoch;

  int selectedRow = -1;
  int selectedColumn = -1;

  List<String> elements = [
    'assets/images/game/blue-1.png',
    'assets/images/game/blue-2.png',
    'assets/images/game/green-1.png',
    'assets/images/game/green-2.png',
    'assets/images/game/red-1.png',
    'assets/images/game/red-2.png',
    'assets/images/game/grey-1.png',
    'assets/images/game/purple-1.png',
    'assets/images/game/purple-2.png',
    'assets/images/game/purple-3.png',
  ];

  int coins = 0;

  @override
  void initState() {
    super.initState();
    initializeBoard();
  }

  void initializeBoard() {
    for (int i = 0; i < 6; i++) {
      for (int j = 0; j < 11; j++) {
        board[i][j] = elements[Random().nextInt(4)];
      }
    }
  }

  void checkForMatchesAndSwapBack() {
    bool matchesFound = false;

    // Check for horizontal matches
    for (int i = 0; i < 6; i++) {
      for (int j = 0; j < 9; j++) {
        if (board[i][j] == board[i][j + 1] && board[i][j] == board[i][j + 2]) {
          switch (board[i][j]) {
            case 'assets/images/game/blue-1.png':
              coins += 500;
            case 'assets/images/game/blue-2.png':
              coins += 500;
            case 'assets/images/game/green-1.png':
              coins += 1000;
            case 'assets/images/game/green-2.png':
              coins += 1000;
            case 'assets/images/game/grey-1.png':
              coins += 1000;
            case 'assets/images/game/purple-1.png':
              coins += 250;
            case 'assets/images/game/purple-2.png':
              coins += 250;
            case 'assets/images/game/purple-3.png':
              coins += 250;
            case 'assets/images/game/red-1.png':
              coins += 500;
            case 'assets/images/game/red-2.png':
              coins += 500;
          }
          ;
          board[i][j] = elements[Random().nextInt(4)];
          board[i][j + 1] = elements[Random().nextInt(4)];
          board[i][j + 2] = elements[Random().nextInt(4)];
          setState(() {});
          matchesFound = true;
          checkWin();
        }
      }
    }

    // Check for vertical matches
    for (int j = 0; j < 11; j++) {
      for (int i = 0; i < 4; i++) {
        if (board[i][j] == board[i + 1][j] && board[i][j] == board[i + 2][j]) {
          switch (board[i][j]) {
            case 'assets/images/game/blue-1.png':
              coins += 500;
            case 'assets/images/game/blue-2.png':
              coins += 500;
            case 'assets/images/game/green-1.png':
              coins += 1000;
            case 'assets/images/game/green-2.png':
              coins += 1000;
            case 'assets/images/game/grey-1.png':
              coins += 1000;
            case 'assets/images/game/purple-1.png':
              coins += 250;
            case 'assets/images/game/purple-2.png':
              coins += 250;
            case 'assets/images/game/purple-3.png':
              coins += 250;
            case 'assets/images/game/red-1.png':
              coins += 500;
            case 'assets/images/game/red-2.png':
              coins += 500;
          }
          ;
          board[i][j] = elements[Random().nextInt(4)];
          board[i + 1][j] = elements[Random().nextInt(4)];
          board[i + 2][j] = elements[Random().nextInt(4)];
          setState(() {});
          matchesFound = true;
          checkWin();
        }
      }
    }
  }

  void checkWin() {
    if (coins >= widget.level.coins) {
      switch (widget.level.difficulty) {
        case 'Easy':
          levelsRepository[1].isActive = true;
        case 'Normal':
          levelsRepository[2].isActive = true;
      }
      ;
      _showCompleteLevelDialog();
    }
  }

  int endTime() {
    final int levelCountdownTimer =
        widget.level.minutes * 60 * 1000 + widget.level.seconds * 1000;
    final int timeLeft = levelCountdownTimer -
        (DateTime.now().millisecondsSinceEpoch - startGameTime);
    return DateTime.now().millisecondsSinceEpoch + timeLeft;
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.gradientBackground,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 50),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Text(
                            'Coins: ',
                            style: TextStyle(
                                color: AppColors.yellow,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Image.asset('assets/images/elements/coin.png'),
                          Text(
                            '$coins/${widget.level.coins}',
                            style: TextStyle(
                                color: AppColors.ivory,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border:
                            Border.all(color: AppColors.lightBrown, width: 2),
                      ),
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/images/elements/timer.svg'),
                          SizedBox(width: 5),
                          CountdownTimer(
                            endWidget: Center(
                              child: Text(
                                '00 : 00 : 00',
                                style: TextStyle(
                                    color: AppColors.ivory,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            textStyle: TextStyle(
                                color: AppColors.ivory,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            endTime: endTime(),
                            onEnd: () {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      backgroundColor: Colors.transparent,
                                      shape:
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                                      child: Container(
                                        height: 340,
                                        width: 340,
                                        decoration: BoxDecoration(
                                          gradient: AppColors.gradientBackground,
                                          border: Border.all(color: AppColors.lightBrown, width: 2),
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(widget.level.difficultyIcon,
                                                  width: 200, opacity: AlwaysStoppedAnimation(.5)),
                                              Text(
                                                'Time left'.toUpperCase(),
                                                style: TextStyle(
                                                    color: AppColors.lightBrown,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Roboto Serif'),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  ActionButtonWidget(
                                                      onTap: () {
                                                        context.router.popAndPush(HomeRoute());
                                                      },
                                                      verticalPadding: 10,
                                                      horizontalPadding: 12,
                                                      text: 'Back to menu',
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400),
                                                  SizedBox(width: 10),
                                                  ActionButtonWidget(
                                                      onTap: () {
                                                        context.router
                                                            .popAndPush(GameRoute(level: widget.level));
                                                      },
                                                      verticalPadding: 10,
                                                      horizontalPadding: 12,
                                                      text: 'Try Again',
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Text(
                            'Level: ',
                            style: TextStyle(
                                color: AppColors.yellow,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Image.asset(
                            widget.level.difficultyIcon,
                            width: 37,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '${widget.level.difficulty}',
                            style: TextStyle(
                                color: AppColors.ivory,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    MenuButton(onTap: () {
                      context.router.popAndPush(PauseRoute(level: widget.level));
                    }),
                  ],
                ),
                Spacer(),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(4, (i) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(11, (j) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedRow == -1 && selectedColumn == -1) {
                                  selectedRow = i;
                                  selectedColumn = j;
                                } else {
                                  if ((i == selectedRow &&
                                          j == selectedColumn - 1) ||
                                      (i == selectedRow &&
                                          j == selectedColumn + 1) ||
                                      (i == selectedRow - 1 &&
                                          j == selectedColumn) ||
                                      (i == selectedRow + 1 &&
                                          j == selectedColumn)) {
                                    // Swap elements
                                    String temp =
                                        board[selectedRow][selectedColumn];
                                    board[selectedRow][selectedColumn] =
                                        board[i][j];
                                    board[i][j] = temp;
                                    checkForMatchesAndSwapBack();
                                  } else {
                                    selectedRow = i;
                                    selectedColumn = j;
                                  }
                                }
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: AppColors.lightBrown, width: 2),
                                ), // Change color based on element type
                                child: Center(
                                  child: Image.asset(
                                    board[i][j],
                                    width: 55,
                                  ),
                                ),
                                width: 55,
                                height: 55,
                              ),
                            ),
                          );
                        }),
                      );
                    }),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCompleteLevelDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            child: Container(
              height: 340,
              width: 340,
              decoration: BoxDecoration(
                gradient: AppColors.gradientBackground,
                border: Border.all(color: AppColors.lightBrown, width: 2),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(widget.level.difficultyIcon, width: 150),
                    Text(
                      'Level complete'.toUpperCase(),
                      style: TextStyle(
                          color: AppColors.lightBrown,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto Serif'),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'You’ve passed the ',
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${widget.level.difficulty}',
                              style: TextStyle(
                                color: AppColors.ivory,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'level difficulty level.',
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ActionButtonWidget(
                            onTap: () {
                              context.router.popAndPush(HomeRoute());
                            },
                            verticalPadding: 10,
                            horizontalPadding: 12,
                            text: 'Back to menu',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        SizedBox(width: 10),
                        ActionButtonWidget(
                            onTap: () {
                              switch (widget.level.difficulty) {
                                case 'Easy':
                                  context.router.popAndPush(
                                      GameRoute(level: levelsRepository[1]));
                                case 'Normal':
                                  context.router.popAndPush(
                                      GameRoute(level: levelsRepository[2]));
                                case 'Hard':
                                  context.router.popAndPush(
                                      GameRoute(level: levelsRepository[0]));
                              }
                            },
                            verticalPadding: 10,
                            horizontalPadding: 12,
                            text: widget.level.difficulty == 'Hard'
                                ? 'Start Over'
                                : 'The next lvl difficulty',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  // void _showTimeLeftDialog() {
  //   showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (BuildContext context) {
  //         return Dialog(
  //           backgroundColor: Colors.transparent,
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
  //           child: Container(
  //             height: 340,
  //             width: 340,
  //             decoration: BoxDecoration(
  //               gradient: AppColors.gradientBackground,
  //               border: Border.all(color: AppColors.lightBrown, width: 2),
  //             ),
  //             child: Center(
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   Image.asset(widget.level.difficultyIcon,
  //                       width: 200, opacity: AlwaysStoppedAnimation(.5)),
  //                   Text(
  //                     'Time left'.toUpperCase(),
  //                     style: TextStyle(
  //                         color: AppColors.lightBrown,
  //                         fontSize: 24,
  //                         fontWeight: FontWeight.w400,
  //                         fontFamily: 'Roboto Serif'),
  //                   ),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       ActionButtonWidget(
  //                           onTap: () {
  //                             context.router.popAndPush(HomeRoute());
  //                           },
  //                           verticalPadding: 10,
  //                           horizontalPadding: 12,
  //                           text: 'Back to menu',
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.w400),
  //                       SizedBox(width: 10),
  //                       ActionButtonWidget(
  //                           onTap: () {
  //                             context.router
  //                                 .popAndPush(GameRoute(level: widget.level));
  //                           },
  //                           verticalPadding: 10,
  //                           horizontalPadding: 12,
  //                           text: 'Try Again',
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.w400),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }
}
