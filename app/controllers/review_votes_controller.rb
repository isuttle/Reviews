class ReviewVotesController < ApplicationController
  # GET /review_votes
  # GET /review_votes.xml
  def index
    @review_votes = ReviewVote.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @review_votes }
    end
  end

  # GET /review_votes/1
  # GET /review_votes/1.xml
  def show
    @review_vote = ReviewVote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @review_vote }
    end
  end

  # GET /review_votes/new
  # GET /review_votes/new.xml
  def new
    @review_vote = ReviewVote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @review_vote }
    end
  end

  # GET /review_votes/1/edit
  def edit
    @review_vote = ReviewVote.find(params[:id])
  end

  # POST /review_votes
  # POST /review_votes.xml
  def create
    @review_vote = ReviewVote.new(params[:review_vote])

    respond_to do |format|
      if @review_vote.save
        format.html { redirect_to(@review_vote, :notice => 'Review vote was successfully created.') }
        format.xml  { render :xml => @review_vote, :status => :created, :location => @review_vote }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @review_vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /review_votes/1
  # PUT /review_votes/1.xml
  def update
    @review_vote = ReviewVote.find(params[:id])

    respond_to do |format|
      if @review_vote.update_attributes(params[:review_vote])
        format.html { redirect_to(@review_vote, :notice => 'Review vote was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @review_vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /review_votes/1
  # DELETE /review_votes/1.xml
  def destroy
    @review_vote = ReviewVote.find(params[:id])
    @review_vote.destroy

    respond_to do |format|
      format.html { redirect_to(review_votes_url) }
      format.xml  { head :ok }
    end
  end
end
