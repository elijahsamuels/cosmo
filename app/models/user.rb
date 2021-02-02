class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :business, optional: true
  
  has_many :job_users
  has_many :jobs, through: :job_users

  has_many :clients, class_name: 'UserRelationship', foreign_key: :client_id
  has_many :admins, through: :clients

  has_many :admins, class_name: 'UserRelationship', foreign_key: :admin_id
  has_many :clients, through: :admins



  # has_many :contractors, class_name: "UserRelationship", foreign_key: "admin_id"
  
  # validates :email, :first_name, :last_name, :phone_number, presence: true
  # validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  # validates :phone_number, length: {minimum: 10, maximum: 15 }

  # user(admin) has many clients through the user_relationships table using the client_id

end
