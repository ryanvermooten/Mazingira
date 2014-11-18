class LivingArrangement <ActiveRecord::Base
	belongs_to :gardener
	validates :number_of_people_in_household, presence: true, numericality: { only_integer: true }
	#belongs_to :group, through: :gardeners
end