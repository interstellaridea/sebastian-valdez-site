class Resume < ApplicationRecord
	validates_presence_of :version, :location

	mount_uploader :location, ResumeUploader
end
