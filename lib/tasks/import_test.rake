require "./inport_test.rb"

namespace :import_test do
  desc "レコード登録速度テスト"
  task :run_test, ['repeat', 'is_delete_all'] => :environment do |task, args|
    start_time = Time.current

    TestTable.delete_all if args['is_delete_all'] == "true"

    args['repeat'].to_i.times do |time|
      str = ""
      print_speed("文字列ランダム生成") { 20.times { |i| str << ('a'..'z').to_a.sample } }
      num =  print_speed("数字ランダム生成") { (1..100000000).to_a.sample }
      date = print_speed("日付ランダム生成") { Time.now - (1..1000).to_a.sample.day }

      print_speed("テーブル作成") { TestTable.create!(text_field: str,num_field: num,date_field: date)}
    end

    end_time = Time.now
    
    pp "result_time: #{end_time.to_i - start_time.to_i}scond"
  end
end
