class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks, dependent: :destroy
  has_many :points, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :task_favorites, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  mount_uploader :icon, IconUploader
end
