class MemberGroupsController < ApplicationController
  before_action :authenticate_member!

  def create
    group_params = params[:member_group]

    if (group_params[:group_name] != '' and group_params[:token] != '')
      group = MemberGroup.where(group_name: group_params[:group_name].capitalize).first

      if (group == nil)
        user  = current_member
        group = MemberGroup.create(group_name: group_params[:group_name].capitalize, token: group_params[:token])

        MemberSubscription.create(member_group: group, member: user)

        flash[:notice] = 'Grupo creado correctamente'
        redirect_to root_path
      else
        flash[:alert] = 'El grupo ya existe'
        redirect_to root_path
      end
    else
      flash[:alert] = 'Los datos no son correctos'
      redirect_to root_path
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def subscription_params
    params.require(:member_group).permit(:group_name, :token)
  end
end