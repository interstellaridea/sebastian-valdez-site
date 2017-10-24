class Trait < ApplicationRecord
  belongs_to :user
  validates_presence_of :resume, :profile_picture
  
  mount_uploader :resume, ResumeUploader
  mount_uploader :profile_picture, ResumeUploader
end
