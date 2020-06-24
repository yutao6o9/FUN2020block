void target_appearance(int target_x, int target_y) { //的の模様
  fill(255);
  stroke(#076C05);
  rect(target_x, target_y, target_w, target_h);
  stroke(#034302);
  ellipse(target_x + 17, target_y + 30, target_w - 10, target_h - 15);
  fill(#076C05);
  stroke(#076C05);
  ellipse(target_x + 17, target_y + 30, target_w - 20, target_h - 30);
  fill(255);
  stroke(0);
}

/*target配列に１をいれる→的が現れる*/
void init_target() {
  for (int i = 0; i < target.length; i++) {
    target[i] = 1;
  }
}

/*的の最後が消えると的が切り替わる*/
void reset_target() {
  if (target[4] == 0 && ball_release == false) {
    target_y_num_1 = int(random(40, 211)); //的の高さランダム
    target_y_num_2 = int(random(70, 191)); 
    target_mode = int(random(2, 7)); //的のパターンランダム
    init_target();
  }
}

/*circleとrectが重なったらtrue*/
boolean circle_overlap(float circle_x, float circle_y, float rect_x, float rect_y, float rect_w, float rect_h) {
  return circle_x >= rect_x && circle_x <= rect_x + rect_w && circle_y >= rect_y && circle_y  <= rect_y + rect_h;
}

/*的と玉が重なったら２を返す*/
int circle_hit_check(float ball_x, float ball_x_speed, float ball_y, float ball_y_speed, 
  float target_x, float target_y, float target_w, float target_h) {
  if (!circle_overlap(ball_x + ball_x_speed, ball_y + ball_y_speed, target_x, target_y, target_w, target_h)) {
    return 0;
  } 
  if (circle_overlap(ball_x + ball_x_speed, ball_y + ball_y_speed, target_x, target_y, target_w, target_h)) {
    return 2;
  } else {
    return 0;
  }
}

/*------------------
 的に玉が当たったら消える
 的が消えたらスコア+100
 ---------------------*/
void target_hit_check() {
  for (int i = 0; i < target.length; i++) {
    if (target[i] > 0) {
      int hit = circle_hit_check(ball_x, ball_x_speed, ball_y, ball_y_direction, target_x[i], target_y[i], target_w, target_h);
      if (hit > 0) {
        if (hit == 2) {
          target[i]--;
          score += 100;
        }
      }
      return;
    }
  }
}

void show_target () {
  /*------------------------
   的のパターンをランダムに描写
   パターン１は最初に描写される的なので最初にしか描写されない
   ------------------------*/
  switch(target_mode) {
  case 1:
    show_target_pattern_1();
    reset_target();
    break;
  case 2:
    show_target_pattern_2();
    reset_target();
    break;
  case 3:
    show_target_pattern_3();
    reset_target();
    break;
  case 4:
    show_target_pattern_4();
    reset_target();
    break;
  case 5:
    show_target_pattern_5();
    reset_target();
  case 6:
    show_target_pattern_5();
    reset_target();
  }
}

void show_target_pattern_1() { //一番最初に描写されている的
  for (int i = 0; i < target.length; i++) {
    if (target[i] > 0) {
      target_x[i] = i * 60 + 161;
      target_y[i] = i * 0 + 130;
      target_appearance(target_x[i], target_y[i]);
    }
  }
}

void show_target_pattern_2() { //まっすぐ
  for (int i = 0; i < target.length; i++) {
    if (target[i] > 0) {
      target_x[i] = i * 60 + 161;
      target_y[i] = i * 0 + target_y_num_1;
      target_appearance(target_x[i], target_y[i]);
    }
  }
}

void show_target_pattern_3() { //ちょっと角度
  for (int i = 0; i < target.length; i++) {
    if (target[i] > 0) {
      target_x[i] = i * 60 + 161;
      target_y[i] = i * 10 + target_y_num_1;
      target_appearance(target_x[i], target_y[i]);
    }
  }
}

void show_target_pattern_4() { //まぁまぁ角度
  for (int i = 0; i < target.length; i++) {
    if (target[i] > 0) {
      target_x[i] = i * 60 + 161;
      target_y[i] = i * 20 + target_y_num_1;
      target_appearance(target_x[i], target_y[i]);
    }
  }
}

void show_target_pattern_5() { //それなりに角度
  for (int i = 0; i < target.length; i++) {
    if (target[i] > 0) {
      target_x[i] = i * 60 + 161;
      target_y[i] = i * 27 + target_y_num_2;
      target_appearance(target_x[i], target_y[i]);
    }
  }
}

void show_target_pattern_6() { //結構角度
  for (int i = 0; i < target.length; i++) {
    if (target[i] > 0) {
      target_x[i] = i * 60 + 161;
      target_y[i] = i * 38 + target_y_num_2;
      target_appearance(target_x[i], target_y[i]);
    }
  }
}
