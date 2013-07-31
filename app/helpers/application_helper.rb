module ApplicationHelper
	def action_datatable_helper(obj, objectpath, deletepath)
	    link_edit = link_to(raw("<i class='icon-pencil'></i>"), 
	                objectpath, 
	                {:class => "sepV_a", :title => "Edit"}).tr('"', "'").html_safe 
	    link_delete = link_to(raw("<i class='icon-trash'></i>"),
	                deletepath,
	                :method => :delete,
	                :confirm => t('.confirm', :default => t("helpers.links.confirm", :default => 'Are you sure?')),
	                :title => 'Delete').tr('"',"'").html_safe
	    link_edit << " " << link_delete
	end
end
