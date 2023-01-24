class ImportCollectedInk
  include Sidekiq::Worker

  def perform(user_id, row)
    SaveCollectedInk.new(collected_ink(user_id, row), params(row)).perform
  end

  def collected_ink(user_id, row)
    User
      .find(user_id)
      .collected_inks
      .find_or_initialize_by(
        brand_name: row["brand_name"].to_s,
        line_name: row["line_name"].to_s,
        ink_name: row["ink_name"].to_s
      )
  end

  def params(row)
    row.keys.each do |k|
      row[k] = "" if row[k].nil?
      row[k] = row[k].strip
    end
    row["private"] = !row["private"].blank?
    row["used"] = row["used"].present?
    row["swabbed"] = row["swabbed"].present?
    row["archived_on"] = row["archived"].present? ? Date.current : nil
    row["kind"] = "bottle" unless row["kind"].present?
    row.slice(
      "brand_name",
      "line_name",
      "ink_name",
      "maker",
      "kind",
      "private",
      "comment",
      "used",
      "archived_on",
      "private_comment",
      "swabbed"
    )
  end
end
