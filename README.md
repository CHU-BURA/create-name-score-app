# NameScoreApp - 姓名診断


## content
- 入力時のエラーメッセージ出力
- 画面遷移とデータの受け渡し

## Progress
### Main.storyboard

#### 1. Navigation Controllerを作成
- View Controller 側の Navigation Var にタイトルを挿入

#### 2. Library Pane
①Text Field  
②Button  

#### 3. Inspector Pane
- Constraints 制約  
①  
Horizontally  
Vertically  
margin-left : 50  
margin-right : 50  
②  
Horizontally  
margin-top : 30  

- Style
①  
Placeholder : "Please enter your name !"

#### 4. View Controller を作成
- ②よりSegueを設定 
画面遷移のShowを選択する。
- Identifier


## memo
- アラート表示 
UIAlertControllerを使用

- アラートにボタンを付与する 
UIAlertActionを使用

- viewWillAppear
viewが表示される直前に呼ばれる。 
viewが表示される直前の処理を追加する場合に使用

- キーボードの表示・非表示設定
シュミレータにおいて入力する場合、キーボードの表示・非表示の設定は、
① シュミレータ起動  
② Hardware > Keyboard > Toggle Software Keyboard  
で表示・非表示の切り替えが可能。 

- キーボード上のボタン表記を変更
例)キーボード上の「Enter」を「Send」に変更する。  
キーボードが表示されるエリア(Text Field)をクリックし、ユーティリティエリアを表示する。
左から4つ目のアイコンをクリックしText Input Traitsで「Return Key」を設定できるので、それを「Send」に変更する。

- 画面遷移時におけるキーボードの表示切り替え
例)画面遷移時におけるキーボードを消す
画面遷移する前の処理(prepareメソッド)に、キーボードの表示を消す処理を追加する。
ここで、キーボードを消すためにText Fieldからフォーカスを外す。
`self.TextField名.resignFirstResponder()`でフォーカスを外せる。

- delegate
あるクラスの処理の実装を別のクラスに任せるための仕組み

- UITextFieldDelegate

