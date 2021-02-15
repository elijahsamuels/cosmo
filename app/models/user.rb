class User < ApplicationRecord

  belongs_to :business, optional: true

  has_many :invoices
  has_many :jobs, through: :invoices
  accepts_nested_attributes_for :jobs
  # validates_associated :jobs

  has_many :admins, class_name: 'UserRelationship', foreign_key: :admin_id #needs to be 1st!
  has_many :clients, through: :admins #order matters!. Rails does the relationship automatically! 
  has_many :contractors, through: :admins #order matters! Rails does the relationship automatically! 

  has_many :payments
  
  has_secure_password
  
  validates :email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :first_name, :last_name, :phone, :address_1, :city, :state, presence: true

end
