ActiveAdmin.register Example do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  #maxExample = Example.maximum('order_id')
  form do |f|
  f.inputs "Examples" do
	
	f.input :subtopic_id, :label => 'Subtopics', :as => :select, :collection => Subtopic.all.map{|u| ["#{u.name}", u.id]}
	f.input :name
	f.input :video_link, :label => 'Video Code'
	f.input :content, :input_html => { :class => "tinymce" }
	#f.input :order_id, :label => 'Order', :input_html => { :value => maxExample.nil? ? 1 : maxExample + 1}
  end
  
   f.actions	
  end
  index do
    column :id
	column :name
	column :video_link
	#column "Order", :order_id
	column "Content" do |item|
		strip_tags(item.content)[0,300]		
	end
	column :created_at
	column :updated_at
	actions 
  end
  permit_params :name, :video_link, :content, :subtopic_id
  menu label: "Manage Examples"
end
