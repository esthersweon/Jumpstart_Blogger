class ArticlesController < ApplicationController
	include ArticlesHelper

	def index
		@articles = Article.all
		render :index
	end

	def show
		@article = Article.find(params[:id])

		@comment = Comment.new
		@comment.article_id = @article.id
		
		render :show
	end

	def new
		@article = Article.new
		render :new
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to article_url(@article)
			flash.notice = "'#{@article.title}' Created!"
		else
			render :new
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		flash.notice = "'#{@article.title}' Deleted!"

		redirect_to articles_url
	end

	def edit
		@article = Article.find(params[:id])
		render :edit
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "'#{@article.title}' Updated!"

		redirect_to article_url(@article)
	end

end
