class PobjectsController < ApplicationController
  # GET /pobjects
  # GET /pobjects.json
  def index
    # Create a new notice queue
    @user_id = session[:user_id]
    @notice_queue = NoticeQueue.new
    @pobjects = Pobject.all
    @pobjects.each do |pobject|
      if Pobject.check_permission(session[:user_id],'view',pobject.id)
        pobject.access = true
      else
        pobject.access = false
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pobjects }
    end
  end

  # GET /pobjects/1
  # GET /pobjects/1.json
  def show
    @pobject = Pobject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pobject }
    end
  end

  # DELETE /pobjects/1
  # DELETE /pobjects/1.json
  def show
    @pobject = Pobject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pobject }
    end
  end


  # GET /pobjects/new
  # GET /pobjects/new.json
  def new
    @pobject = Pobject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pobject }
    end
  end

  # GET /pobjects/1/edit
  def edit
    @pobject = Pobject.find(params[:id])
  end

  # POST /pobjects
  # POST /pobjects.json
  def create
    @pobject = Pobject.create(params[:pobject])
    @pobject.owner = @user_name
    respond_to do |format|
      if @pobject.save
        format.html { redirect_to pobjects_url, notice: 'Pobject was successfully created.' }
        format.json { render json: @pobject, status: :created, location: @pobject }
      else
        format.html { render action: "new" }
        format.json { render json: @pobject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pobjects/1
  # PUT /pobjects/1.json
  def update
    @pobject = Pobject.find(params[:id])

    respond_to do |format|
      if @pobject.update_attributes(params[:pobject])
        format.html { redirect_to @pobject, notice: 'Pobject was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @pobject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pobjects/1
  # DELETE /pobjects/1.json
  def destroy
    @pobject = Pobject.find(params[:id])
    @pobject.destroy

    respond_to do |format|
      format.html { redirect_to pobjects_url }
      format.json { head :ok }
    end
  end
end
