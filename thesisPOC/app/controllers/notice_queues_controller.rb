class NoticeQueuesController < ApplicationController
  # GET /notice_queues
  # GET /notice_queues.json
  def index
    @notice_queues = NoticeQueue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notice_queues }
    end
  end

  # GET /notice_queues/1
  # GET /notice_queues/1.json
  def show
    @notice_queue = NoticeQueue.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @notice_queue }
    end
  end

  # GET /notice_queues/new
  # GET /notice_queues/new.json
  def new
    @notice_queue = NoticeQueue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @notice_queue }
    end
  end

  # GET /notice_queues/1/edit
  def edit
    @notice_queue = NoticeQueue.find(params[:id])
  end

  # POST /notice_queues
  # POST /notice_queues.json
  def create
    @notice_queue = NoticeQueue.new(params[:notice_queue])

    respond_to do |format|
      if @notice_queue.save
        format.html { redirect_to pobjects_url, notice: 'Notice queue was successfully created.' }
        format.json { render json: @notice_queue, status: :created, location: @notice_queue }
      else
        format.html { render action: "new" }
        format.json { render json: @notice_queue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notice_queues/1
  # PUT /notice_queues/1.json
  def update
    @notice_queue = NoticeQueue.find(params[:id])

    respond_to do |format|
      if @notice_queue.update_attributes(params[:notice_queue])
        format.html { redirect_to @notice_queue, notice: 'Notice queue was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @notice_queue.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /notice_queues/archive/1
  # GET /notice_queues/archive/1.json
  def archive
    @notice_queue = NoticeQueue.find(params[:id])
    @notice_queue.archived = true
    @notice_queue.save

    respond_to do |format|
      format.html { redirect_to pobjects_url }
      format.json { head :ok }
    end
  end


  # DELETE /notice_queues/1
  # DELETE /notice_queues/1.json
  def destroy
    @notice_queue = NoticeQueue.find(params[:id])
    @notice_queue.destroy

    respond_to do |format|
      format.html { redirect_to notice_queues_url }
      format.json { head :ok }
    end
  end
end
