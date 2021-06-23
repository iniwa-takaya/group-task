# GroupTasks

## アプリケーション名
### group-tasks
  
## アプリケーション概要

- ユーザー登録が使用するための条件
- チームIDを合わせることで、たくさんのメンバーと自由にチームを作成可能
- チーム内でも何個でも作業スペースが作成可能
- 各作業スペースで、期限に紐付けたタスクを管理可能

## URL
https://group-tasks-128.herokuapp.com/


## テスト用アカウントの情報
- ヘッダーからゲストユーザーとしてログインを選択（ユーザー編集以外の機能を使用できます。）

## 利用方法

- ユーザーの登録
  - ニックネームは一意性に注意して設定
  - チームIDは一緒にチームを運用したメンバーと合わせた8桁の数字を設定
  - パスワードは６字以上の半角英数字混合で設定
- チーム作成
  - プロジェクトに合わせてチーム名を設定
  - 必要があれば、チームの説明を記述（任意）
  - 同じIDを持つメンバーがチェックボックスで表示されるので、チェックをつける事で参加メンバーを選択
- 作業スペース作成
  - 進めたい作業に合わせて作業スペース名を設定
  - 必要があれば、作業スペースの説明を記述（任意）
- タスクの作成
  - 作業に必要な内容をタスクとして記述
  - 期限を作成可能（任意）

## 目指した課題解決

- ### 前職で、2つの業務を兼任した際の課題を解決するために作成
  #### ペルソナ
  - 職場で、複数のチームを兼任する必要がある
  - 頻繁に作業内容の増減があり、情報を共有する必要がある
  #### ペルソナの課題
  - 複数の業務を並行して進める必要がある
  - 業務ごとにメンバーが異なり、それぞれで情報を共有する必要がある
  - プロジェクトの進行具合やそのための作業の詳細など、チーム内での情報を共有する事が難しい

## 洗い出した要件

- ### ペルソナの課題を基に洗い出したユーザーストーリーと具体的な機能
  #### ユーザーストーリー
  1. 複数のユーザーを管理する必要がある
  2. 作業単位でチームを作成し、複数のユーザーを管理する必要がある
  3. 作成したグループの中で、複数の作業スペースを管理する必要がある
  4. 作業スペースの中で、複数のタスクを管理する必要がある
  #### 機能
  1. ユーザー管理機能
  2. グループ管理機能
  3. スペース管理機能
  4. タスク管理機能

## 実装済みの機能

- ### ユーザー管理機能
  #### 概要
  - 以降に記述する機能を使用するためにユーザーを登録する機能
  #### 詳細
  - ユーザーをニックネームとチームID、メールアドレス、パスワードで管理することができる
  - ニックネームとチームID、パスワード、メールアドレスがない時や、ニックネームとメールアドレスが既に存在している時はエラーが表示される
  - 画像ファイルを選択することで、ユーザーアイコンを作成する事ができる
  - 画像ファイルを選択した際に、プレビューが表示される
  - GoogleとFacebookを使用して新規登録、ログインができ、その際はパスワードを省略する事ができる
  - パスワードを表示・非表示で切り替える事ができる
  #### 現状の問題点
  - 架空のメールアドレスでも登録することができる
  - チームIDが同じであれば、誰でもタスクを削除できる
  <br>
  [![Image from Gyazo](https://i.gyazo.com/7494c64c4dedd4f955132204ffb05333.gif)](https://gyazo.com/7494c64c4dedd4f955132204ffb05333)
  <br>
  [![Image from Gyazo](https://i.gyazo.com/980fabe46513d639c676ec51dc605a2b.gif)](https://gyazo.com/980fabe46513d639c676ec51dc605a2b)
  

- ### グループ管理機能
  #### 概要
  - ユーザーがいくつものチームを作成、管理できる機能
  #### 詳細
  - グループを、チーム名と、チームメンバーの情報があれば作成できる
  - グループ名がない時、エラーが表示される
  - 必要であれば、チームの詳細を作成できる
  - チームを作成する際のチェック項目には、同じチームIDで登録しているユーザーだけが表示される
  - チームメンバーは、作成者以外でもチームの情報を編集、削除できる
  #### 現状の問題点
  - チームIDが同じであれば、誰でも参加できるため、情報の秘匿性がない
  <br>
  [![Image from Gyazo](https://i.gyazo.com/e86b3e07d7bbedcb85493a7ba54930ac.gif)](https://gyazo.com/e86b3e07d7bbedcb85493a7ba54930ac)

- ### スペース管理機能
  #### 概要
  - チームメンバーが作業スペースを作成、管理できる機能
  #### 詳細
  - スペースを、作業スペース名があれば管理できる
  - 作業スペース名がない時、エラーが表示される
  - 必要であれば、作業スペースの詳細を作成できる
  - チームメンバーは、作業スペースを作成する事ができる
  - チームメンバーは、作成者以外でも作業スペースの情報を編集、削除できる
  <br>  
  [![Image from Gyazo](https://i.gyazo.com/b9651f94d782d78051cd6e65fb073261.gif)](https://gyazo.com/b9651f94d782d78051cd6e65fb073261)

- ### タスク管理機能
  #### 概要
  - 作業スペース内でタスクを作成、管理できる機能
  #### 詳細
  - タスクの内容があれば作成できる
  - タスクの内容がない時や、期限が作成時刻より過去日時の場合はエラーが表示される
  - 必要であれば、期限を作成できる
  - チームメンバーであれば、未完了のタスクに限り編集できる
  - タスクは、未完了と完了で表示を切り替える事ができ、完了済みの場合だけ削除ができる
  <br>  
  [![Image from Gyazo](https://i.gyazo.com/023d3036ce717f75b076542679162ef2.gif)](https://gyazo.com/023d3036ce717f75b076542679162ef2)

## 実装予定の機能

- ### 問題点の解決

- ### タスクのアラーム機能
  #### 概要
  - タスクの期限を設定している場合に限り、タスクの期限のアラームをユーザーが任意で設定できる機能
  #### 詳細
  - アラームを設定した時間になった時点で、そのタスクが未完了の場合に限って、所属しているチームメンバー全員に対してその情報を知らせる
  - 知らせる方法は、それぞれが登録しているメールアドレスに対してメールを自動送信

- ### 現在日時をヘッダーに表示する機能
  #### 概要
  - ユーザーが、タスクの期限を作成する際の現在時刻の確認をサポートするための機能
  #### 詳細
  - 詳細まで確認させる必要はないので、分単位までの表示を行う

## データベース設計

### users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| email             | string | null: false, unique:true |
| encrypted_password| string | null: false |
| group_number      | string | null: false |
| nick_name         | string | null: false, unique:true |

#### Association

- has_many :task_group_users
- has_many :task_groups, through: :task_group_users

### task_group_users テーブル

| Column      | Type       | Options          |
| ----------- | ---------- | ---------------- |
| task_group  | references | foreign_key: true|
| user        | references | foreign_key: true|

#### Association

- belongs_to :task_group
- belongs_to :user

### task_groups テーブル

| Column       | Type      | Options          |
| ------------ | --------- | ---------------- |
| g_name       | string    | null: false      |
| g_description| string    |                  |

#### Association

- has_many :task_group_users
- has_many :users, through: :task_group_users
- has_many :spaces
- has_many :tasks

### spaces テーブル

| Column       | Type      | Options     |
| ------------ | --------- | ----------- |
| s_name       | string    | null: false |
| s_description| string    |             |
| task_group   |references | foreign_key: true|

#### Association

- belongs_to :task_group
- has_many   :tasks

### tasks テーブル

| Column         | Type      | Options     |
| -------------- | --------- | ----------- |
| content        | string    | null: false |
| deadline       | timestamp |             |
| status         | boolean   | null: false |
| space          | references| foreign_key: true|
| task_group     | references| foreign_key: true|

#### Association

- belongs_to :task_group
- belongs_to :space

## ローカルでの動作方法

- 環境
  - ruby 2.6.5
  - ruby on rails 6.0.0