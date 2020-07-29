require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(氏名 カナ メールアドレス)
  csv << csv_column_names
  @followers.each do |follower|
    csv_column_values = [
      follower.full_name,
      follower.kana_full_name,
      follower.email
    ]
    csv << csv_column_values
  end
end