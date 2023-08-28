class GlobalMethod {
  int getSquareRow(int totalCount) {
    int row = -1;

    for(int i = 1; i <= totalCount; i++) {
      if(totalCount % i == 0) {
        if ( i != totalCount && totalCount / i == i) {
          row = i;
        }
      }
    }

    return row;
  }

  int getSquareCount(int rowCount) {
    int row = 1;

    return row;
  }

  int calculateY(int x, double ratio) {
    // x:y = ratio 이므로, y = x / ratio
    int y = x ~/ ratio;
    return y;
  }
}