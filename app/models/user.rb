class User < ApplicationRecord
  include Gravtastic
  gravtastic default: "retro", size: 180
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :library

  after_create :make_library

  private
  def make_library
    self.library = Library.new
  end

end