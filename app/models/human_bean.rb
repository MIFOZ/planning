class HumanBean < ActiveRecord::Base
	belongs_to :post
	belongs_to :branch, :class_name => 'StructureUnit'

	enum is_head: { Да: true, Нет: false }

	def to_name_w_initials
		"#{last_name} #{first_name[0]}. #{patronymic[0]}."
	end
end