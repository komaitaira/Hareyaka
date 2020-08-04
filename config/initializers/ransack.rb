Ransack.configure do |config|
  # 述語名
  config.add_predicate 'lteq_end_of_day',
  # Arelの述語を指定。<=で検索したいからlteqを使う
  arel_predicate: 'lteq',
  # インプットの整形。その日の終わりまでを検索対象に含める
  formatter: proc { |v| v.end_of_day }
end