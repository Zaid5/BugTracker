class User < ApplicationRecord
	
	has_many :comments, dependent: :destroy
	has_many :bugs
	authenticates_with_sorcery!
	# attr_accessor :email, :password, :password_confirmation
	
	enum role: [:pm, :dev, :admin]

	  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
	  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
	  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

	  validates :email, uniqueness: true


	  def admin?
	  	role == "admin"
	  end

	  def pm?
	  	role == "pm"
	  end

	  def dev?
	  	role == "dev"
	  end
end
