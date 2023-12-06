class Admin::DashboardController < Admin::ApplicationController
  def index
    @programs_count = Program.count    
  end
end
