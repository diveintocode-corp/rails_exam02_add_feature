class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :password, confirmation: true, password: true
  validates :password_confirmation, password_confirmation: true
  validates :email, presence: true, uniqueness: true
end
