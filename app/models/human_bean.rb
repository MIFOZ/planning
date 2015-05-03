class HumanBean < ActiveRecord::Base
	belongs_to :post

	def to_name_w_initials
		"#{last_name} #{first_name[0]}. #{patronymic[0]}."
	end
end
