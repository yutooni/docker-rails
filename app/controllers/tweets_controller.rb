class TweetsController < ApplicationController

    before_action :authenticate_user!

    def index
      if params[:search] == nil
          @tweets= Tweet.all.page(params[:page]).per(3)
          p "onizuka"
          p @tweets
      elsif params[:search] == ''
          @tweets= Tweet.all.page(params[:page]).per(3)
          p "onizuka"
          p @tweets
      else
          #部分検索
          @tweets = Tweet.where("body LIKE ? ",'%' + params[:search] + '%').page(params[:page]).per(3)
          p "onizuka"
          p @tweets
      end
     
    end

  
  
    def new
      @tweet = Tweet.new
    end
  
    def create
      tweet = Tweet.new(tweet_params)

      tweet.user_id = current_user.id
      if tweet.save
        redirect_to :action => "index"
      else
        redirect_to :action => "new"
      end
    end
  
    def show
      @tweet = Tweet.find(params[:id])
      @comments = @tweet.comments
      @comment = Comment.new
    end
  
    def edit
      @tweet = Tweet.find(params[:id])
    end
  
    # 追記ここから
    def update
      tweet = Tweet.find(params[:id])
      if tweet.update(tweet_params)
        redirect_to :action => "show", :id => tweet.id
      else
        redirect_to :action => "new"
      end
    end
    # ここまで
    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index
    end
  
    private
    # これはtweets#createを実装したときに書いたものです。tweets#updateの中でも利用しています。
    def tweet_params
      params.require(:tweet).permit(:body)
    end

    
  end