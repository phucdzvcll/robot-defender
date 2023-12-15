void main() {
  var y = 0;
  var x = 0;
  var j = -1;
  for (var i = 1; i <= 512; i++) {
    if (i > 17 && (i - 1) % 17 == 0) {
      y += 64;
      j = 0;
    } else {
      j += 1;
    }
    x = j * 64;
    var s = '<object id="$i" x="$x" y="$y" width="64" height="64"></object>';

    print(s);
  }
}
