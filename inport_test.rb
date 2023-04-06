def print_speed(task)
  start_time = Time.current

  result = yield

  end_time = Time.current

  pp "#{task} 実行時間 #{end_time.to_i - start_time.to_i}秒"
  result
end
