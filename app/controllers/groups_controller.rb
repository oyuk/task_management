class GroupsController < ApplicationController

  def index
    @groups = Group.all
    respond_to do |format|
      format.html
      format.json
    end
  end

end
