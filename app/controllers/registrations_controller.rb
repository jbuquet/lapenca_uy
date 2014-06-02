class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    build_resource(sign_up_params)

    # Set our custom properties
    resource.points = 0

    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
      matches = Match.all
      matches.each { |match|
        Forecast.find_or_create_by(member_id: resource.id, match_id: match.id)
      }

      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      flash[:alert] = 'Los datos no son correctos'
      redirect_to root_path
    end
  end

  def update
    super
  end
end