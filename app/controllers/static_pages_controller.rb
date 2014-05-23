class StaticPagesController < ApplicationController
  def home
    redirect_to new_member_session_path unless current_member
  end
end
