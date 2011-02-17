class ReviewsController < ApplicationController
  # GET /reviews
  # GET /reviews.xml
  def index
    @reviews = Review.find(:all, :include => [:app, :entity])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reviews }
      format.json  { render :json => @reviews }
    end
  end

  # GET /reviews/:app_id/:foreign_id
  # GET /reviews/:app_id/:foreign_id.xml
  def index_by_ref
    @entity = Entity.find_by_foreign_id(params[:foreign_id])
    
    # TODO: Handle nil entity better
    if @entity.nil?
      head(404)
      return
    end
    
    if params[:order_by] == "helpful"
      order_by = "helpful_score DESC, helpful_count DESC"
    elsif params[:order_by] == "recent"
        order_by = "updated_at DESC"
    else
      order_by = "score DESC, helpful_score DESC"
    end
    
    if params[:count].nil?
      limit = 20
    elsif params[:count].to_i > 0 && params[:count].to_i < 100
      limit = params[:count].to_i
    else
      limit = 20
    end
    
    if params[:page].nil?
      offset = 0
    elsif params[:page].to_i > 0 && params[:page].to_i < 100
      offset = params[:page].to_i * limit - limit
    else
      offset = 0
    end
    
    @reviews = Review.find :all, 
      :conditions => {:app_id => params[:app_id], :entity_id => @entity.id},
      :include => [:app, :entity],
      :order => order_by,
      :limit => limit,
      :offset => offset

    respond_to do |format|
      format.xml  { render :xml => @reviews }
      format.json  { render :json => @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.xml
  def show
    @review = Review.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @review }
    end
  end

  # GET /reviews/new
  # GET /reviews/new.xml
  def new
    @review = Review.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @review }
    end
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.xml
  def create
    @review = Review.new(params[:review])
    
    # auto-create the entity if it doesn't exist yet.
    if @review.entity.nil?
      e = Entity.find_or_create_by_app_id_and_foreign_id(:app_id => @review.app_id, :foreign_id => params[:foreign_id])
      if !e.nil?
        @review.entity_id = e.id
      end
    end

    respond_to do |format|
      if @review.save
        format.html { redirect_to(@review, :notice => 'Review was successfully created.') }
        format.xml  { render :xml => @review, :status => :created, :location => @review }
        format.json  { render :json => @review, :status => :created, :location => @review }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @review.errors, :status => :unprocessable_entity }
        format.json  { render :json => @review.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.xml
  def update
    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to(@review, :notice => 'Review was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @review.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.xml
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to(reviews_url) }
      format.xml  { head :ok }
    end
  end
end
