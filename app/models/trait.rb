class Trait < ApplicationRecord
  belongs_to :user
  validates_presence_of :resume, :profile_picture

  enum state: [:off,:live]
  
  mount_uploader :resume, ResumeUploader
  mount_uploader :profile_picture, ProfilePictureUploader


  scope :live_admin_posts, -> { where({user_id: (User.find_by(roles: 'admin')), state: 'live' }) }

end
