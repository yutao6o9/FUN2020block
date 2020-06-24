void init_ball () { //ballの初期値
  ball_x = mon_x + 60; 
  ball_y = mon_y + 37; 
  ball_radius = 16;
}

/*玉の発射方向の描写*/
void show_ball_direction() {
  ball_launch_y = mon_y + 37;
  if (charge_pressed || ball_release) { //チャージボタン押してボールが消えるまで
    for (int i = 0; i < direction.length; i++) {
      noStroke();
      fill(#FFB4B4);
      circle(i * 5 + 70, i * ball_y_direction + ball_launch_y, 5);
      fill(0);
      stroke(0);
    }
  }
}

/*ボールの描写*/
void show_ball () {
  if (ball_release) {
    noStroke();
    fill(#FA1B03);
    circle(ball_x, ball_y, ball_radius);
    fill(255);
    stroke(0);

    ball_x += ball_x_speed;
    ball_y += ball_y_direction;
    
    //ボールは画面端まで行ったら消える
    if (ball_x >= 440) {
      ball_release = false;
      ball_y_direction = 5;
    }
  }
}
