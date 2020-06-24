void mousePressed() {
  //click here to stratを押すとゲーム開始
  if (game_mode == 0 && mouseX >= 180 && mouseX <= 350 && mouseY >= 240 && mouseY <= 270) {
    game_start = true;
  }
  //タイトルバックボタンを押すと
  if (game_mode == 1 && mouseX >= 450 && mouseY <= 100) {
    ball_release = false;
    game_mode = 0;
    score = 0;
    init_monster();
  }
   //チャージボタン押すと
  if (game_mode == 1 && mouseX >= 450 && mouseY >= 350) {
    charge_pressed = true;
    ball_y_direction = 5;
    ball_release = false;
  }
  //back to titleを押すと
  if (game_mode == 2 && mouseX >= 350 && mouseX <= 450 && mouseY >= 280 && mouseY <= 380) {
    game_mode = 0;
    score = 0;
    init_monster();
  }
}

void mouseReleased() {
   //チャージボタンから離すと
  if (game_mode == 1 && mouseX >= 450 && mouseY >= 350) {
    charge_pressed = false;
    init_ball();
    charge_count = 0;
    ball_release = true;
    frameCount = 0;
  }
}
