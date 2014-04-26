class ArticlesController < ApplicationController

	def index
		@articles = Article.all
		render :index
	end

	def show
		@article = Article.find(params[:id])
		render :show
	end
end
