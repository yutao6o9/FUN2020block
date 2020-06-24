/*画像のダウンロード、格納*/
void image_download() {
  usually_mon = loadImage("usually_monster.png");
  charge_mon = loadImage("charge_monster.png");
  release_mon = loadImage("release_monster.png");
  title = loadImage("title.png");
  green = loadImage("green.png");
  charge_buttan = loadImage("charge_1.png");
  charge_buttan_press = loadImage("charge_2.png");
  back_title_buttan = loadImage("back_title_1.png");
  back_title_buttan_press = loadImage("back_title_2.png");
  end_screen = loadImage("end.png");
}

/*残り時間の描写*/
void game_timelimit() {
  int ms = (millis() - time_from_start)/1000;
  time_limit = 30; //制限時間

  countdown = time_limit - ms;
  fill(0);
  textSize(15);
  text("Time Limit", 460, 120);
  textSize(50);
  if (countdown > 9) { //枠の真ん中になるように調整
    text(countdown, 465, 180);
  } else if (countdown <= 9) {
    text(countdown, 485, 180);
  }
  if (countdown < 0) { //カウントダウン終了でゲーム終了
    ranking_save();
    game_mode = 2;
  }
  textSize(12);
}

/*自分のスコアを表示*/
void show_score() {
  fill(0);
  text("Your Score", 455, 215);
  textSize(24);
  if (score <= 0) { //スコアの表示を右に揃える
    text(score, 525, 245);
  } else if (score > 0 && score <= 999) {
    text(score, 495, 245);
  } else if (score > 999 && score <= 9999) {
    text(score, 480, 245);
  } else if (score > 9999 && score <= 99999) {
    text(score, 465, 245);
  }
  if (score > hi_score) {
    hi_score = score;
  }
  textSize(12); //ゲームプレイ中のランキングの表示
  text("Ranking", 455, 270);
  textSize(14);
  ranking_change();
  for (int i = 0; i < ranking_int.length; i++) { 
    text(i + 1, 468, 295 + (i * 20));
  }
  for (int i = 0; i < ranking_int.length; i++) {
    text(ranking_int[i], 485, 295 + (i * 20));
  }
  textSize(12);
  fill(255);
}

/*バックタイトル、タイム、スコア、チャージボタン、チャージメーターの外枠をそれぞれ描写*/
void show_etc() {
  fill(255, 255, 255, 0);

  if (mouseX >= 450 && mouseY <= 100) { //バックタイトルボタンの描写
    image(back_title_buttan_press, 450, 0);
  } else {
    image(back_title_buttan, 450, 0);
  }
  rect(450, 0, 99, 100);

  fill(255);
  rect(450, 100, 99, 100); //タイム
  rect(0, 380, width - 1, 69); //チャージメータの外枠
  fill(0);
  textSize(20);
  text("Power", 220, 425);
  textSize(12);

  fill(255, 255, 255, 0);
  if (charge_pressed) { //チャージボタンの描写
    image(charge_buttan_press, 450, 350);
  } else {
    image(charge_buttan, 450, 350);
  }
  rect(450, 350, 99, 99);

  fill(255);
  rect(450, 200, 99, 150); //スコアの枠
  show_score();
  image(green, 0, height - 200); //左下の草
}
