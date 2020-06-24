void ranking_change() {
  /*-----------------------
   ランキングのデータをintに変える
   ランキングの入れ替え
   -------------------------*/
  String ranking[] = loadStrings("score_ranking.txt");
  for (int i = 0; i < ranking.length; i++) {
    ranking_int[i] = int(ranking[i]);
  }
  if (hi_score > ranking_int[2]) {
    ranking_int[2] = hi_score;
  }
  if (ranking_int[2] > ranking_int[1]) {
    int hoge = ranking_int[2];
    ranking_int[2] = ranking_int[1];
    ranking_int[1] = hoge;
  }
  if (ranking_int[1] > ranking_int[0]) {
    int fuga = ranking_int[1];
    ranking_int[1] = ranking_int[0];
    ranking_int[0] = fuga;
  }
}

/*ランキングの値をstrにしてテキストファイルに書き出す*/
void ranking_save() {
  for (int i = 0; i < ranking_int.length; i++) {
    ranking_confirm[i] = str(ranking_int[i]);
  }
  saveStrings("score_ranking.txt", ranking_confirm);
}
