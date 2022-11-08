# frozen_string_literal: true

class RequestsController < ApplicationController
  before_action :set_request, only: %i[show edit update destroy]

  # GET /requests or /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1 or /requests/1.json
  def show; end

  # GET /requests/new
  def new
    @request = Request.new
    @publication = Publication.find(params[:publication_id])
  end

  # GET /requests/1/edit
  def edit; end

  # POST /requests or /requests.json
  def create
    @request = Request.new(request_params)
    @publication = Publication.find(params[:publication_id])
    @request.owner = @publication.user_id
    @request.user = current_user
    @request.publication = @publication

    # @request.save
    # if @request.save
    #   redirect_to publication_path(:id => @publication.id)
    # else
    #   redirect_to publication_path(:id => @publication.id), notice: 'Error creating request'

    # end
    respond_to do |format|
      if @request.save
        # redirect_to publication_path(:id => @publication.id)
        format.html { redirect_to publication_url(@publication), notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1 or /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to request_url(@request), notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1 or /requests/1.json
  def destroy
    @request.destroy
    redirect_to requests_index_path, notice: 'Request deleted'
  end

  def accept
    @request = Request.find(params[:id])
    @request.status = 'active'
    @request.save
    redirect_to requests_index_path, notice: 'Request accepted'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def request_params
    params.require(:request).permit(:title, :body, :start, :finish, :publication_id, :user_id, :owner, :status)
  end
end
