class UpdateProgressController < ApplicationController

  	before_filter :signed_in_user

	def create

		content = params[:content]
		redirect_object = params[:redirect_object]

		mp = current_user.microposts.build(:content => content)
		if mp.save!
			#flash[:success] = "updated progress"
		else
			#flash[:error] = "failed to update progress"
		end
		redirect_to redirect_object
	end
end
