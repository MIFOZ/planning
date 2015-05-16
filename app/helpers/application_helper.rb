module ApplicationHelper

	def name_w_initials( human_bean )
		human_bean.to_name_w_initials
	end

	def get_link_to_branch(branch)
		branch ? (link_to branch.name, edit_structure_unit_path(branch)) : ''
	end

	def get_link_to_head(branch)
		if branch
			head = branch.head
			get_link_to(head)
		else
			''
		end
	end

	def get_link_to_human_bean (human_bean)
		link_to human_bean.to_name_w_initials, edit_human_bean_path(human_bean)
	end

	def get_link_to_structure_unit (structure_unit)
		link_to structure_unit.name, edit_structure_unit_path(structure_unit)
	end
end
