module ApplicationHelper

	def name_w_initials( human_bean )
		"#{human_bean.last_name} #{human_bean.first_name[0]}. #{human_bean.patronymic[0]}."
	end
end
