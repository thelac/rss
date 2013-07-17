class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
      format.js
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  def toggle_read
    @item = Item.find(params[:item_id])
    @item.toggle_read

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  def toggle_starred
    @item = Item.find(params[:item_id])
    @item.toggle_starred

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
      format.js
    end
  end

  def tweet
    @item = Item.find(params[:item_id])
    @item.feed.user.twitter.update(@item.link)
    flash[:success] = "tweeted!" # TODO: this doesn't actually check for success
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
      format.js
    end
  end

  def pocket
    @item = Item.find(params[:item_id])

    # TODO: only need to do once
    PocketApi.configure(
      :client_key=> ENV['POCKET_CONSUMER_KEY'], 
      :access_token => @item.feed.user.pocket_oauth_token)

    PocketApi.add(@item.link)

    flash[:success] = "added!" # TODO: this doesn't actually check for success
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
      format.js
    end
  end

  def readability
    @item = Item.find(params[:item_id])

    # TODO: only need to do this once
    @token = @item.feed.user.readability_oauth_token
    @secret = @item.feed.user.readability_oauth_secret
    @api = Readit::API.new @token, @secret

    @api.bookmark( :url => @item.link )

    # TODO: only need to do once
    # Readit::Config.consumer_key = ENV['READABILITY_KEY']
    # Readit::Config.consumer_secret = ENV['READABILITY_READER_KEY']
    # Readit::Config.parser_token = ENV['READABILITY_PARSER_KEY']
    # TODO: only need to do once
    # PocketApi.configure(
    #   :client_key=> ENV['POCKET_CONSUMER_KEY'], 
    #   :access_token => @item.feed.user.pocket_oauth_token)

    # PocketApi.add(@item.link)

    flash[:success] = "added!" # TODO: this doesn't actually check for success
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
      format.js
    end
  end
end
