# JavaScript入門2

今回はif文、for文、配列について学んでいきましょう。
前回と同様に[テンプレートファイル](./js_template.zip?raw=true)をDLして実行していきます。

## if文とは

if文を勉強していきましょう。
if文とは、プログラミング言語において「もしXならば、Yせよ、さもなくばZせよ」というような条件実行を示す文です。
C言語やJavaをやっている人には親しい構文だと思います。
JavaScriptでも基本的な書き方は同じです。
以下がその例です。

```
if (条件式) {
  文１
} else {
  文２
}
```

この場合は、条件式にあてはまるとき文１を実行し、そうでないときは文２を実行します。
それでは実際にやってみましょう。
実行する前にどんな答えになるか考えてみてください。

#### script.js

```javascript
var suuji = 20;

if (suuji > 20) {
  alert('ok');
} else {
  alert('no');
}
```

この場合、`suuji`が20*より大きい*場合、`ok`が表示され、
20以下の場合、`no`が表示されます。変数`suuji`の中身は20なので、`no`が表示されますね。

条件式は他にも以下の様なものがあります。

| 演算子 |        意味        |    使用例   |
|:------:|:------------------:|:-----------:|
|    >   |     より大きい     |  if (a > b) |
|   >=   | より大きいか等しい | if (a >= b) |
|    <   |     より小さい     |  if (a < b) |
|   <=   | より小さいか等しい | if (a <= b) |
|   ==   |       等しい       | if (a == b) |
|   !=   |     等しくない     | if (a != b) |

##for文とは

次はfor文を勉強していきましょう。
for文とは、プログラミング言語において条件が真の間だけ与えられた文の実行を繰り返すというループを記述するための文です。
JavaScriptでの書き方を見ていきましょう。

```
for (初期化; ループの継続条件; カウンタ変数の更新) {
  文
}
```

動作は以下のようになっています。

1. 初期化を実行する。
1. 条件を評価する。条件が偽ならば、ループを終了する。
1. 文を実行する。
1. カウンタ変数の更新を実行する。
1. 条件の評価に戻る。

それでは実際にやってみましょう。

#### script.js

```javascript
var moji = 'aiueo';
for (var i = 0; i < moji.length; i++) {
  alert(moji.charAt(i));
}
```

アラート文はどう表示されましたか？
考えてみてくださいね。
ヒントですが、`moji.length`というのは今回宣言した`moji`という変数の長さを取得しています。
つまり`i<5`になりますね。
また、`charAt()`でなん番目の文字かを指定してます。

## 配列とは

最後に配列を見ていきましょう。
同じ目的で使用される複数の値を格納するのに便利なのが配列です。
例えば生徒数十人のテストの点数を保存するために変数を生徒の数だけ用意しようとするとわかりにくいですし面倒ですよね。
そこで配列を使えば似たような名前の変数を作らなくてもすみ、格納された値を順番に処理することも可能になります。

書き方は以下のようになります。

```javascript
var array = [1, 2, 3];
```

中かっこでくくり、格納したい値をカンマで区切ります。
この場合ひとつめの値`1`を取り出したいとなると、`array[0]`となります。
この`[0]`の部分は添え字といい、配列に格納されているものの場所を表します。
数字は0から始まるので注意してください。
なので`3`を取り出したい場合は`array[2]`となります。

### 2次元配列

配列の中に配列を入れることも可能です。

```javascript
var array = [
  [10, '1つめの値です'],
  [20, '2つめの値です'],
  [30, '3つめの値です']
];
```

このようにすると行列のように値を扱うこともできます。
この添え字も同じで例えば、`array[1][1]`の値は`'2つめの値です'`になります。
それでは実際に動かしてみましょう。
これもどのようになるか実行する前に考えてみてください。

```javascript
var array = [
  ['aa', 'bb', 'cc'],
  ['dd', 'ee', 'ff']
];
for (var i = 0; i < array.length; i++) {
  alert(array[i][2]);
}
```

こちらは、`array.length`で得られる数は配列のたての長さになります。


基本的な動作は以上となります。
では実際にこれらをプログラム中に使ってみましょう。
次の[まるばつクイズ](./marubatsu.md)に進んでください。

 
[前へ JavaScript入門２](../06/js2.md)
 
[次へ まるばつクイズを作ろう](../06/marubatsu.md)