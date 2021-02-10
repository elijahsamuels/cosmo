class User < ApplicationRecord

  belongs_to :business, optional: true

  has_many :job_users
  has_many :jobs, through: :job_users
  accepts_nested_attributes_for :jobs
  # validates_associated :jobs

  has_many :admins, class_name: 'UserRelationship', foreign_key: :admin_id #needs to be 1st!
  has_many :clients, through: :admins #order matters!. Rails does the relationship automatically! 
  has_many :contractors, through: :admins #order matters! Rails does the relationship automatically! 

  has_many :payments
  
  has_secure_password
  
  validates :email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :first_name, :last_name, presence: true

  
  # has_many :clients, class_name: 'UserRelationship', foreign_key: :admin_id
  # has_many :clients, class_name: 'UserRelationship', foreign_key: :client_id #needs to be 2nd?
  # has_many :admins, through: :clients

  # has_many :contractors, class_name: 'UserRelationship', foreign_key: :contractor_id
  # has_many :admins, through: :contractors
  
  # validates :email, :first_name, :last_name, :phone_number, presence: true
  # validates :phone_number, length: {minimum: 10, maximum: 15 }

  # user(admin) has many clients through the user_relationships table using the client_id

end
