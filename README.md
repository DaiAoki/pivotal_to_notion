# pivotalからNotionの開発Issueにデータ反映させる

## 目的
開発がやっていることの進捗を全体に共有し、コミュニケーションロスを減らす

## 手順
1. PivotalTrackerで[Analytics] -> [Iteration]で対象のイテレーションを選択した状態で、[CSV]アイコンをクリック
   `iteration_stories_report_OCT24_OCT30.csv` のような名称のファイルがダウンロードされる
2. 上記のファイルを `~/git/pivotal_to_notion` に移動する
3. 下記コマンドを実行する
```
# execute
./convert_csv_format_from_pivotal_tracker_to_notion.rb andhatch_20191031_1622.csv
# debug
pry -r ./convert_csv_format_from_pivotal_tracker_to_notion.rb andhatch_20191031_1622.csv
```
	`extract_iteration_stories_report_OCT24_OCT30.csv` のような名称のファイルが生成される
4. Notionで[Issues] -> [Dev Issues]でテンプレートをコピーして日付を変えた後、[...]アイコンクリック -> [Merge with CSV]で3で生成されたファイルを選択すると自動で反映される
