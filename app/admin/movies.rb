ActiveAdmin.register Movie do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :movie_name, :movie_genre, :movie_director, :movie_rating, :cover_pic, :display_pic

  show do
    attributes_table do
      row :movie_name
      row :movie_genre
      row :movie_director
      row :movie_rating
      row :cover_pic do |ad|
        image_tag url_for(ad.cover_pic)
      end
      row :display_pic do |dp|
        image_tag url_for(dp.cover_pic)

    end
    end
  end

  form do |f|
    f.inputs do
      f.input :movie_name
      f.input :movie_genre
      f.input :movie_director
      f.input :movie_rating
      f.input :cover_pic, as: :file
      f.input :display_pic, as: :file
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:movie_name, :movie_genre, :movie_director, :movie_rating]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
