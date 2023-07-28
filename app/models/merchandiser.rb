class Merchandiser < ApplicationRecord
    
    has_secure_password
    has_many :orders


    validates :name, presence: true
    validates :password, presence: true
    validates :id_number, presence: true
    validates :phone_number, presence: true
    validates :vehicle_registration, presence: true
    validates :status, presence: true
    validates :profile_picture, presence: true
end
