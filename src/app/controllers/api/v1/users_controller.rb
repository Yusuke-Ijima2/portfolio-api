module Api
	module V1 
	# 上記２つがないと間に/api/vi/が入らない
	  class UsersController < ApplicationController
		before_action :current_user, only: %i[show update destroy] #before_action :current_userでuserの情報をとってくる
  
		def index
		  @users = User.all
		  render json:@users
		end

		#ここからまだ使ってない
  
		def show
		  @user = User.find(params[:id])
		  render json:@user
		end
  
		private
  
		def user_params
		  params.require(:user).permit(:name, :email, :password)
		end
  
		def correct_user
		  @user = User.find(params[:id])
		end
	  end
	end
  end