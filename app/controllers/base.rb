class Base < ApplicationController

  before_action :load_groups

  def load_groups
      logger.debug(@groups.inspect)
      @groups = Group.all
  end

end
