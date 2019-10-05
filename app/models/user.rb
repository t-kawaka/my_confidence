# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string           default(""), not null
#  icon                   :string
#  admin                  :boolean          default(FALSE), not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks, dependent: :destroy
  has_many :points, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :task_favorites, dependent: :destroy
  has_many :contacts, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  mount_uploader :icon, IconUploader
  scope :recent, -> {order(start_time: :desc)}
  accepts_nested_attributes_for :tasks, allow_destroy: true
  enum status: {ユーザー非公開: 0, ユーザー公開: 1}
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  #指定のユーザをフォローする
 def follow!(other_user)
   active_relationships.create!(followed_id: other_user.id)
 end

 #フォローしているかどうかを確認する
 def following?(other_user)
   active_relationships.find_by(followed_id: other_user.id)
 end

 def followed?(other_user)
   passive_relationships.find_by(follower_id: other_user.id)
 end

#指定のユーザのフォローを解除する
 def unfollow!(other_user)
   active_relationships.find_by(followed_id: other_user.id).destroy
 end

  after_create :send_welcome_mail

  def send_welcome_mail
    UserMailer.user_welcome_mail(self).deliver
  end

end
