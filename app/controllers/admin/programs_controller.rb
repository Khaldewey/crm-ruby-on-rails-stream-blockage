class Admin::ProgramsController < Admin::ResourceController
    def search
        @collection = Program.all
        @collection = @collection.where('title LIKE ?', "%#{params[:search][:title]}%") if params[:search][:title].present?
        @collection = @collection.where('DATE(date_start) = ?', params[:search][:date_start].to_date.to_s) if params[:search][:date_start].present?
        @collection = @collection.where('DATE(date_end) = ?', params[:search][:date_end].to_date.to_s) if params[:search][:date_end].present?
        @collection = @collection.order(date_start: :desc).paginate(:page => params[:page])
        @collection = @collection.order(date_end: :desc).paginate(:page => params[:page])
        
        render :index
    end

    def show
        @program = Program.find_by_id(params[:id])
    end 

    
end
