int game_mode = 0, target_mode = 1;
int countdown, time_limit, time_from_start, score = 0, hi_score = 0, ranking_int[] = new int[3];
int target [] = new int [5], target_x [] = new int[5], target_y [] = new int[5], target_w = 34, target_h = 60, target_y_num_1, target_y_num_2;
float mon_x, mon_y, mon_speed_y_keep, mon_speed_y;
float ball_x, ball_y, ball_radius, ball_x_speed = 5, ball_y_direction = 3, ball_launch_y; 
float direction[] = new float[15], charge_count = 0;
boolean game_start, charge_pressed, ball_release;
PImage condition_mon, usually_mon, charge_mon, release_mon;
PImage title, green, charge_buttan, charge_buttan_press, back_title_buttan, back_title_buttan_press, end_screen;
String ranking[], ranking_confirm[] = new String[3];

void setup() {
  frameRate(60);
  size(550, 450);
  image_download(); 
  init_monster();
  init_ball();
  init_target();
}

void draw() {
  switch(game_mode) {
  case 0: //タイトル
    game_title();
    break;
  case 1: //ゲーム
    background(#DEFCFB); //背景
    image_monster(); //モンスターの画像
    show_ball_direction(); //ボールの発射方向
    show_target(); //的の描写
    target_hit_check(); //的の当たり判定
    show_ball(); //ボールの描写
    show_etc(); //いろいろ描写
    show_charge_meter(); //チャージメータの描写
    game_timelimit(); //ゲーム時間
    break;
  case 2: //終わり
    game_end();
    break;
  }
}
