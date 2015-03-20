class StandingsController < ApplicationController
  def show
    if current_member
      @group = MemberGroup.new
      @standings = {}

      groups = current_member.member_groups.all
      groups.each do |group|
        @standings[group.group_name] = group.members.all.sort_by {
          |member| (member.points.present? ? member.points : 0)
        }.reverse
      end

      @standings
    else
      redirect_to new_member_session_path
    end
  end
end
