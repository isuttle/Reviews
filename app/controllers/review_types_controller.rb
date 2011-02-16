class ReviewTypesController < ApplicationController
  # GET /review_types
  # GET /review_types.xml
  def index
    @review_types = ReviewType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @review_types }
    end
  end

  # GET /review_types/1
  # GET /review_types/1.xml
  def show
    @review_type = ReviewType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @review_type }
    end
  end

  # GET /review_types/new
  # GET /review_types/new.xml
  def new
    @review_type = ReviewType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @review_type }
    end
  end

  # GET /review_types/1/edit
  def edit
    @review_type = ReviewType.find(params[:id])
  end

  # POST /review_types
  # POST /review_types.xml
  def create
    @review_type = ReviewType.new(params[:review_type])

    respond_to do |format|
      if @review_type.save
        format.html { redirect_to(@review_type, :notice => 'Review type was successfully created.') }
        format.xml  { render :xml => @review_type, :status => :created, :location => @review_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @review_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /review_types/1
  # PUT /review_types/1.xml
  def update
    @review_type = ReviewType.find(params[:id])

    respond_to do |format|
      if @review_type.update_attributes(params[:review_type])
        format.html { redirect_to(@review_type, :notice => 'Review type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @review_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /review_types/1
  # DELETE /review_types/1.xml
  def destroy
    @review_type = ReviewType.find(params[:id])
    @review_type.destroy

    respond_to do |format|
      format.html { redirect_to(review_types_url) }
      format.xml  { head :ok }
    end
  end
end
