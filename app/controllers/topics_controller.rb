class TopicsController < ApplicationController
	before_action :logged_in_user, only: [:index, :show]
	before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

	def index
		@topics = Topic.all.paginate(page: params[:page])
	end

	def show
		@topic = Topic.find(params[:id])
		if current_user.admin?
			@posts = Post.where("topic_id= ?", @topic.id).paginate(page: params[:page])
		elsif current_user.moder?
			@posts = Post.where("topic_id= ? AND (new_post= ? OR pending= ?)", @topic.id, true, true).paginate(page: params[:page])
		else
			@posts = Post.where("topic_id= ? AND accepted= ?", params[:id], true).paginate(page: params[:page])
		end
	end

	def new
		@topic = Topic.new
	end

	def create
		@topic = current_user.topics.build(topic_params)
		if @topic.save
			flash[:success] = "Topic created!"
			redirect_to request.referrer || root_url
		else
			render 'new'
		end
	end

	def edit
		@topic = Topic.find(params[:id])
	end

	def update
		@topic = Topic.find(params[:id])
		if @topic.update_attributes(topic_params)
			flash.now[:success] = "Topic updated"
			render 'edit'
		else
			flash.now[:success] = "Something wrong. \nPlease try again later."
			render 'edit'
		end
	end

	def destroy
		@topic.destroy
		flash[:success] = "Topic deleted"
		redirect_to request.referrer || root_url
	end

	private

	def topic_params
		params.require(:topic).permit(:theme, :description)
	end
end
