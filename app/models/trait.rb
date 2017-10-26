class Trait < ApplicationRecord
  belongs_to :user
  validates_presence_of :resume, :profile_picture
  
  mount_uploader :resume, ResumeUploader
  mount_uploader :profile_picture, ProfilePictureUploader

  # TODO, update where qury limits to one, and is also looking for state == live
  scope :admin_posts, -> { where(user_id: (User.find_by(roles: 'admin').id)) }

end
