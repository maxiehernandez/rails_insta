class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :update, :destroy]

  # GET /documents
  def index
    @documents = Document.all

    render json: @documents
  end

  # GET /documents/1
  def show
    render json: @document
  end

  # POST /documents
  def create
    p "Hello", document_params.inspect, params.inspect
    @document = Document.new(document_params)

    if @document.save
      render json: @document, status: :created, location: @document
    else
      render json: @document.errors, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /documents/1
  def update
    if @document.update(document_params)
      render json: @document
    else
      render json: @document.errors, status: :unprocessable_entity
    end
  end

  # DELETE /documents/1
  def destroy
    @document.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_document
    @document = Document.find(params[:id])
  end

  def document_params
    puts params.inspect
    new_hash={}
    if params[:data]&&params[:data][:attributes]
      document_data=params[:data][:attributes]
    else
      document_data=params[:document]
    end

    document_data.each do |key,value|
      new_hash[key.gsub("-","_")]=value
    end

    new_params=ActionController::Parameters.new(new_hash)
    new_params.permit(:filename, :content_type, :file_contents, :file)
  end
end
