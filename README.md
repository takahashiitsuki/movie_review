# <映画レビュー>

## サイト概要
### サイトテーマ
映画の特徴をタグとして登録しそのタグ等を参照することで気になる映画を検索したり、
視聴が可能なコンテンツを確認できるレビューサイト

### テーマを選んだ理由
私は映画が好きなのだが、明るい作品が観たい、激しいアクションものが観たい等観たい作品の特徴はあるが、
特にはっきりと見たい作品があるわけではないという状況に直面することがあり、
その時特徴から映画を探すことはできないかと考えたことがあったこと、
また、特定の見たい作品があったとして、近年ではサブスクリプションを視聴媒体として用いることが多く、
その作品はどこかのサービスで配信が行われているのかを一目で確認したいと思う機会があったことから、
これらの需要を満たす
・作品の特徴をタグとして設定できるようにする
・作品を配信しているサービスを確認できるようにする
上記二つの機能を実装したレビューサイトがあればよいと思い、このテーマにした

### ターゲットユーザ
映画が好きな人

### 主な利用シーン
特徴から映画を検索する、映画が視聴可能なサービスを確認する、及び映画のレビュー登録・閲覧する

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用方法
TMDBに登録されている映画の情報を閲覧することが可能。
また、キーワードや映画のジャンルから映画を検索することも可能。
ログインしたユーザーは映画のレビューを投稿することが可能。

 - 映画情報の閲覧方法（ログイン不要）
 1. ヘッダーのメニューバーの[映画]のボタンをクリックして映画一覧（Movies/index）に移動する。
 2. 情報を閲覧したい映画のタイトルを入力
 3. 映画のタイトルをクリックすることで映画の情報を見る画面（Movies/show）に移動できる。


 - 

 ## ページの見方
 - メニューバー
 ヘッダーにメニューバーを設置している。
 [Movie Review]トップ画面（）へのリンク。
 
 - homes#top
   - トップ画面。ログインしていない状態だとゲストログイン用のボタンが表示され、クリックすることで閲覧用のゲストアカウントでログインできる。

## 使用素材
- 外部サービスの画像素材・音声素材を使用した場合は、必ずサービス名とURLを明記してください。
- 使用しない場合は、使用素材の項目をREADMEから削除してください。

API(TMDB：https://www.themoviedb.org) で取得した情報・画像を利用する>
