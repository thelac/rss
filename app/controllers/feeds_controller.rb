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

    feed.entries.reverse_each do |item|
      @feed.items.create(description: item.summary,
        title: item.title,
        link: item.url,
        published: item.published,
        read: false)
    end
    
    # feed.entries.each do |item|
    #   @item = Item.new(description: item.summary, 
    #     title: item.title, 
    #     link: item.url,
    #     feed_id: @feed.id)
    #   @item.save
    # end

  end

  # PUT /feeds/1
  # PUT /feeds/1.json
  def update
    @feed = Feed.find(params[:id])
    feed = Feedzirra::Feed.fetch_and_parse(@feed[:link])
    most_recent = @feed.items.last
    counter = 0
    itemlist = []

    feed.entries.each do |item|
      break if item.title == most_recent.title
      itemlist += [item]
    end

    itemlist.reverse_each do |item|
          @feed.items.create( description: item.summary,
                              title: item.title,
                              link: item.url,
                              published: item.published,
                              read: false)
          counter += 1
        end
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
      format.html { redirect_to feeds_url }
      format.json { head :no_content }
    end
  end
end
