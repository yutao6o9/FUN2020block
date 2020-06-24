/*ゲームタイトル画面*/
void game_title() {
  image(title, 0, 0);
  frameCount = 71;
  if (game_start) {
    game_mode = 1;
    time_from_start = millis(); //millisを初期化するため
    game_start = false;
  }
}

void game_end() {
  image(end_screen, 0, 0);
  textSize(40);
  /*スコアの表示、真ん中に揃えるように調整*/
  if (score <= 0) {
    text(score, 260, 250);
  } else if (score > 0 && score <= 999) {
    text(score, 230, 250);
  } else if (score > 999 && score <= 9999) {
    text(score, 220, 250);
  } else if (score > 9999 && score <= 99999) {
    text(score, 210, 250);
  }
  /*ランキングを出す*/
  String ranking[] = loadStrings("score_ranking.txt");
  textSize(23);
  for (int i = 0; i < ranking.length; i++) {
    text(i + 1, 111, 320 + (i * 33));
  }
  for (int i = 0; i < ranking.length; i++) {
    text(ranking[i], 140, 320 + (i * 33));
  }
  textSize(12);

  /*バックタイトルボタンの描写*/
  if (mouseX >= 350 && mouseX <= 450 && mouseY >= 280 && mouseY <= 380) {
    image(back_title_buttan_press, 350, 280);
  } else {
    image(back_title_buttan, 350, 280);
  }
}
