# 　　　　　　　　　　Trip Viet Nam  

　　　　　　　　　　　<img src="https://i.gyazo.com/00513403ec842a92e716c4239d578a90.png" width="500">  

### 　　　　　　　　　　　　　　　ベトナム語勉強アプリケーション  

# :speech_balloon: Description  

近年急速に観光客や日本への移住者が増えてきており、注目を浴びているベトナム。
日本とベトナムの距離が縮まってくるに従って、ベトナム語の需要は高まってきています。
しかしながら、日本でベトナム語を話せる人材はまだまだ多いとは言えず、今後期待される言語になると予測できます。
そういった背景を踏まえ、ベトナム語勉強アプリを開発しました。  

# :movie_camera: Demo  

###        　　　　　　お気に入り登録　　　　  　　　 　　   　ノートタグ絞り込み  
　　　<img src="https://i.gyazo.com/de859f5883dcf78cbe4d1b8711316bcb.gif" width="280">   　　　　　　<img src="https://i.gyazo.com/019ba80b08b811ad224665f9aef12cb7.gif" width="280">  

# :round_pushpin: 機能  

* タグ絞り込み機能  
* お気に入り一覧表示  
* ノート作成、タグ付機能  
* 単語、会話集の検索機能  
* 単語、会話集のお気に入り登録機能  

※単語、会話 文章集のデータは随時追加していきます
※問題集、発音のデータを今後実装予定です。  

# :globe_with_meridians: App URL  

### https://tripvietnam.herokuapp.com/  
### テスト用アカウント  
* メールアドレス  
test@gmail.com  

* パスワード  
111111  

# 制作環境  

　　　　　　　　　　　　　　　　　　　　　<img src="https://i.gyazo.com/b73ffdf6153bb02f67960daa41522efc.png" width="200">  
　　　　　　　　　　　<img src="https://i.gyazo.com/9a39782cb398bf7390fb0bd45c246a08.png" width="170">　　　　<img src="https://i.gyazo.com/12e7134797ccf9542a87de2045fb45f5.png" width="130">　　　　<img src="https://i.gyazo.com/fb00032dc01ca992026da033509201ad.png" width="170">  
　　　　　　　　　　　　　　　　　　<img src="https://i.gyazo.com/5492e2f4a3e73782bc5106af1e28b2fe.png" width="100">　　　　<img src="https://i.gyazo.com/778e37f6581783aef515c590f9d3e12d.png" width="190">  

# ER図  

　　　　　　　　　<img src="https://i.gyazo.com/e770408099910756bcbc67804ad71fbf.png" width="600">  

# 工夫した点 

### ①お気に入りに登録、解除の分岐  
each do内にif文を記述し、登録しているデータであれば星に色をつけ、登録していないデータに関しては無色にする処理を実装しました。  

### ②リファクタリング  
Viewの共通化できる部分はsharedフォルダにまとめてPartial化し、コントラーローの処理に関しても、before_actionを多用し、全体的にリファクタリングを意識しています。

# :pencil2: 作者  

### [Git Hub](https://github.com/shun308) shun308  
