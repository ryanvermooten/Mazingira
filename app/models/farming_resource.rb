class FarmingResource <ActiveRecord::Base
	belongs_to :gardener
	validates :number_of_people_engaged_in_farming, presence: true
	validates :number_of_farming_spaces, presence: true
	validates :type_of_farming_space, presence: true
	validates :size_of_farming_space, presence: true
	validates :financial_capital_for_farming, presence: true
	
	#belongs_to :group, through: :gardeners
end