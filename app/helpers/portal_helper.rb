module PortalHelper

	def determine_trait_status_helper trait
		if trait.live?
			link_to('Turn Off', admin_toggle_status_path(trait), class: 'btn')
		else
			link_to('Make Live', admin_toggle_status_path(trait), class: 'btn')
		end
	end


end
