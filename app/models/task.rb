# == Schema Information
#
# Table name: tasks
#
#  id           :bigint           not null, primary key
#  title        :string(30)       not null
#  description  :text             not null
#  start_time   :datetime         not null
#  notice       :text
#  require_time :integer          not null
#  progress     :string           default("開始"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint
#

class Task < ApplicationRecord
  has_many :points
  has_many :points, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :task_tags, dependent: :destroy
  has_many :tags, through: :task_tags
  has_many :task_favorites, dependent: :destroy
  has_many :favorite_users, through: :task_favorites, source: :user
  belongs_to :user

  accepts_nested_attributes_for :points
  accepts_nested_attributes_for :task_tags, allow_destroy: true

  enum progress: { 開始: 0, 途中: 1, 完了: 2 }

  scope :recent, -> { order(start_time: :desc) }

  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :start_time, presence: true
  validate :start_cannnot_be_in_the_future
  validates :require_time, numericality: { only_integer: true, greater_than: 0, less_than: 1440}
  validates :rate, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[title start_time progress]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def start_cannnot_be_in_the_future
    if start_time.present? && start_time > Date.today
      errors.add(:start_time, 'は明日以降の日付を設定できません！')
    end
  end
end
