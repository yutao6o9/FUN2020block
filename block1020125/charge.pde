void show_charge_meter() {
  /*---------------------------------
   チャージボタンを押している間メーターが溜まる
   charge_countが５０超えるとリセット
   
   ここでボールの発射方向の数値も決めている
   -----------------------------------*/
  if (charge_pressed == true) {
    ball_y_direction -= 0.1;
    charge_count += 1;
    if (charge_count >= 51) {
      ball_y_direction = 5;
      charge_count = 0;
    }
  }
  fill(255);
  rect(290, 395, 150, 40);//チャージメーターの枠
  fill(#FF8408);
  rect(290, 395, charge_count * 3, 40);//チャージメーター
  fill(255);
}
