void init_monster () { //monsterの初期値
  condition_mon = usually_mon;
  mon_x = 2;
  mon_y = 1;
  mon_speed_y_keep = 1.8;
  mon_speed_y = 1.8;
}

void release_monster() {
  /*------------------------------
   チャージボタン離した後のモンスターの挙動
   一定時間動かない、時間経過で再び動き出す
   -----------------------------------*/
  if (frameCount <= 70) {
    condition_mon = release_mon;
    mon_speed_y = 0;
  } else {
    condition_mon = usually_mon;
    mon_speed_y = mon_speed_y_keep;
  }
}

/*モンスターの描写*/
void image_monster() {
  condition_mon = usually_mon;
  mon_y += mon_speed_y;

  if (mon_y >= 190 || mon_y <= 0) {//モンスターの折り返しサイクル
    mon_speed_y = -mon_speed_y;
    mon_speed_y_keep = -mon_speed_y_keep;
  }

  if (charge_pressed == true) {
    condition_mon = charge_mon;
    mon_speed_y = 0;
    /*チャージのところをクリックしてるとモンスターの絵が変わる、モンスターは止まる*/
  } else {
    release_monster();
    /*離すと1秒もしないくらいでリリース画像→その後また自動で動き出す*/
  }

  fill(#B45D05);
  rect(0, 0, 5, height);
  image(condition_mon, mon_x, mon_y);
  rect(0, mon_y + 75, 75, 10);//モンスターの台
  fill(255);
}
