include ActionView::Helpers::TextHelper
class FeedsController < ApplicationController
  # GET /feeds
  # GET /feeds.json
  def index
    @feeds = Feed.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feeds }
    end
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
    @feed = Feed.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feed }
      format.js
    end
  end

  # GET /feeds/new
  # GET /feeds/new.json
  def new
    @feed = Feed.new
  end

  # GET /feeds/1/edit
  def edit
    @feed = Feed.find(params[:id])
  end

  # POST /feeds
  # POST /feeds.json
  def create
    @feed = Feed.new(params[:feed])

    feed = Feedzirra::Feed.fetch_and_parse(@feed[:link])

    @feed[:title] = feed.title
    @feed[:description] = feed.description
    @feed[:user_id] = current_user.id
    
    success = @feed.save

    feed.entries.reverse_each do |item|
      @feed.items.create(description: item.summary,
        title: item.title,
        link: item.url,
        published: item.published,
        read: false)
    end

    respond_to do |format|
      format.html{
        if success
          flash[:success] = "Feed created!"
          redirect_to @feed  
        else
          flash.now[:error] = "Something wrong!"
          render new
        end
      }
      format.js
    end

  end

  # PUT /feeds/1
  # PUT /feeds/1.json
  def update
    @feed = Feed.find(params[:id])

    counter = @feed.update

    if counter > 0
      pluralHelper = pluralize(counter, "item").split
      flash[:success] = pluralHelper[0] + " new " + pluralHelper[1] + "!"
    else
      flash[:error] = "No new items :("
    end
    
    redirect_to @feed
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy

    respond_to do |format|
      format.html { redirect_to current_user.dashboard }
      format.json { head :no_content }
    end
  end
end
