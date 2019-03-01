class User < ApplicationRecord
	
	has_many :comments, dependent: :destroy
	
	authenticates_with_sorcery!

	enum role: [:pm, :dev, :admin]

	  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
	  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
	  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

	  validates :email, uniqueness: true

	  after_initialize do
	    if self.new_record?
	      self.role ||= :dev
	    end
	  end
end
