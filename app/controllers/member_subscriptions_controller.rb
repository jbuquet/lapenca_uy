class MemberSubscriptionsController < ApplicationController
  before_action :authenticate_member!

  def create
    group_params = params[:member_group]
    group = MemberGroup.where(group_name: group_params[:group_name].capitalize, token: group_params[:token]).first

    if (group != nil)
      user  = current_member

      subscription = MemberSubscription.where(member_group_id: group.id, member_id: user.id).first

      if (subscription == nil)
        MemberSubscription.create(member_group: group, member: user)

        flash[:notice] = 'Se suscribio correctamente al grupo'
        redirect_to root_path

      else
        flash[:alert] = 'Ya se encuentra suscripto al grupo'
        redirect_to root_path
      end

    else
      flash[:alert] = 'No existe el grupo o no es correcto el token ingresado'
      redirect_to root_path
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def subscription_params
    params.require(:member_group).permit(:group_name, :token)
  end
end