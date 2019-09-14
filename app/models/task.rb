class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :start_time, presence: true
  validate :start_cannnot_be_in_the_future
  validates :require_time, numericality: { only_integer: true, greater_than: 0, less_than: 1440}
  enum progress: { 開始: "開始", 途中: "途中", 完了: "完了" }
  has_many :points
  accepts_nested_attributes_for :points

  def start_cannnot_be_in_the_future
    if start_time.present? && start_time > Date.today
      errors.add(:start_time, "は明日以降の日付を設定できません！")
    end
  end
end
