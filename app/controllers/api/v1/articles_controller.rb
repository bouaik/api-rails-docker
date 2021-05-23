class Api::V1::ArticlesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_article, only: %i[ show edit update destroy ]
  
    # GET /articles or /articles.json
    def index
      @articles = Article.all
  
      render json: {articles: @articles}
    end
  
    # GET /articles/1 or /articles/1.json
    def show
      render json: {articles: @article}
    end
  
    # GET /articles/new
    def new
      @article = Article.new
    end
  
    # GET /articles/1/edit
    def edit
    end
  
    # POST /articles or /articles.json
    def create
      @article = Article.new(article_params)
  
      respond_to do |format|
        if @article.save
          format.json { render json: @article, status: :created, location: @article }
        else
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /articles/1 or /articles/1.json
    def update
      respond_to do |format|
        if @article.update(article_params)
          format.json { render json: @article, status: :ok, location: @article }
        else
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /articles/1 or /articles/1.json
    def destroy
      @article.destroy
      respond_to do |format|
        format.json { render json: {alert: "Article was deleted succesfully."} }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = Article.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def article_params
        params.require(:article).permit(:title, :body)
      end
  end
  