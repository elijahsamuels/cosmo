class User < ApplicationRecord

    belongs_to :business, optional: true

    has_many :job_users
    has_many :jobs, through: :job_users

    # has_many :jobs
    # has_many :job_users, through: :jobs
  
    has_many :admins, class_name: 'UserRelationship', foreign_key: :admin_id #needs to be 1st?
    # has_many :clients, class_name: 'UserRelationship', foreign_key: :admin_id
    has_many :clients, through: :admins
    has_many :contractors, through: :admins
    
        # has_many :clients, class_name: 'UserRelationship', foreign_key: :client_id #needs to be 2nd?
        # has_many :admins, through: :clients



    # has_many :contractors, class_name: 'UserRelationship', foreign_key: :contractor_id
    # has_many :admins, through: :contractors

    has_secure_password
    validates :email, uniqueness: true, presence: true

  # has_many :contractors, class_name: "UserRelationship", foreign_key: "admin_id"
  
  # validates :email, :first_name, :last_name, :phone_number, presence: true
  # validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  # validates :phone_number, length: {minimum: 10, maximum: 15 }

  # user(admin) has many clients through the user_relationships table using the client_id

end
