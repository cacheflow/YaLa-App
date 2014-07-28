class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user, only: [:index, :edit, :update, :destroy]

  def index
    @users = User.all.sort_by { |u| u[:email] }
  end

  def show
    @posts = @user.posts.reverse.paginate(:page => params[:page], :per_page => 8)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

 
	def create 
		@user = User.new(params.require(:user).permit(:email, :password))
		if @user.save
				redirect_to root_path
		else 
			render action: "index"
		end 
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(user_params))
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
