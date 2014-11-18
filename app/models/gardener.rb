class Gardener < ActiveRecord::Base
  belongs_to :user
  has_one :living_arrangement
  has_one :farming_resource
validates :first_name, length: {minimum: 2, too_short: "First name needs at least 2 characters"}
validates :last_name , length: {minimum: 2, too_short: "Last name needs at least 2 characters"}
end

  def active?
    status == 'active'
  end

