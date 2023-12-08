class Image < ApplicationRecord
  mount_uploader :picture , FileUploader
  belongs_to :film
end
