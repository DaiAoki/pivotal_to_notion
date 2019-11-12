# pivotalからNotionの開発Issueにデータ反映させる

## 目的
開発がやっていることの進捗を全体に共有し、コミュニケーションロスを減らす

## 手順
1. PivotalTrackerで[More] -> [Export CSV] で、[All Current/Backlog Stories] にのみチェックした状態で[Export]
   `andhatch_20191112_1603.csv` のような名称のファイルがダウンロードされる
2. 上記のファイルを `path/to/pivotal_to_notion` に移動する
3. 下記コマンドを実行する
   `extract_andhatch_20191112_1603.csv` のような名称のファイルが生成される
   ```
   # execute
   ./convert_csv_format_from_pivotal_tracker_to_notion.rb andhatch_20191112_1603.csv
   # debug
   pry -r ./convert_csv_format_from_pivotal_tracker_to_notion.rb andhatch_20191031_1622.csv
   ```
4. Notionで[Issues] -> [Dev Issues]でテンプレートをコピーして日付を変えた後、[...]アイコンクリック -> [Merge with CSV]で3で生成されたファイルを選択すると自動で反映される


## 代替手段
[Analytics] -> [Project Trends] -> [Stories acceptedのview report] -> [Story Compositionのコピーマーク]
