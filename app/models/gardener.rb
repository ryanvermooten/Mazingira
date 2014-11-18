class Gardener < ActiveRecord::Base
  belongs_to :user
  has_one :living_arrangement
  has_one :farming_resource
validates :first_name, length: {minimum: 2, too_short: "First name needs at least 2 characters"}
validates :last_name , length: {minimum: 2, too_short: "Last name needs at least 2 characters"}
validates :id_number, :presence => true, :uniqueness => true
end

  def active?
    status == 'active'
  end

