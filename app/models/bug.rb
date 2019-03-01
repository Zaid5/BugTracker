class Bug < ApplicationRecord

	has_many :comments, dependent: :destroy

	has_attached_file :image, styles: { main: "300x300#", thumb: "100x100>#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	has_attached_file :document, styles: { main: "300x300#", thumb: "100x100>#" }
	validates_attachment_content_type :document, content_type: %w(application/pdf 
																																application/msword 
																																application/ruby 
																																application/text 
																																
																																)
end
