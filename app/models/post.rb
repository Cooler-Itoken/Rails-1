class Post < ApplicationRecord
  validates :title, length: {in:1..20}
  validates :startDate, presence:true
  validates :endDate, presence:true
  validates :memo, length: {maximum:500}
  validate :day_after_check

  # 終了日チェック用のバリデーション
  def day_after_check
    unless self.startDate.nil? || self.endDate.nil?
      errors.add(:endDate, "の日付を正しく入力してください。") if self.startDate > self.endDate
    end
  end
end
