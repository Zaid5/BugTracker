class Bug < ApplicationRecord

	has_many :comments, dependent: :destroy
	belongs_to :user

	has_attached_file :image, styles: { main: "200x200#", thumb: "100x100>#" }
	do_not_validate_attachment_file_type :image
	has_attached_file :document
	do_not_validate_attachment_file_type :document
end