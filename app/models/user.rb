# frozen_string_literal: true

class User < ActiveRecord::Base
  acts_as_paranoid
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :first_name, :last_name, :role, presence: true
  enum role: %i[user admin]
end
