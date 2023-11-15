class RatingsController < ApplicationController

    def create
        @service = Service.find(params[:service_id])
        
        if(@service.ratings.find_by_user_id(current_user.id))
            redirect_to root_path
        else
            count = @service.ratings.count + 1
            @rating = @service.ratings.new(rating_params)

            @rating.user_id = current_user.id; 
            @rating.save

            total_rating = @service.total_rating + @rating.ratings
            avg_rating = total_rating/count

            @service.update(avg_rating: avg_rating, total_rating: total_rating)

            redirect_to root_path
        end
    end

private
    def rating_params
      params.require(:rating).permit(:ratings, :service_id)
    end
end
