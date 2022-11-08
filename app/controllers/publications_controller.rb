# frozen_string_literal: true

# Controlador de publicaciones
class PublicationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.create(publication_params)
    @publication.user = current_user

    if @publication.save
      redirect_to publications_path, notice: 'Publication succsessfully created'
    else
      redirect_to publications_path, notice: 'Error creating post'

    end
  end

  def index
    @publication = Publication.all
  end

  def show
    @publication = Publication.find(params[:id])
  end

  def edit
    @publication = Publication.find(params[:id])
  end

  def update
    @publication = Publication.find(params[:id])
    @publication.update(publication_params)
    @publication.save
    redirect_to publications_path
    # @publication_new_params =
    # params.require(:publication).permit(:title, :sport, :description, :image, :price, :category)

    # if @publication.update(@publications_new_params)
    #   redirect_to publications_index_path, notice: 'Publication edited'
    # else
    #   redirect_to publications_index_path, notice: 'Publication edit failed'
  end

  def delete
    @publication = Publication.find(params[:id])
    @publication.destroy

    redirect_to publications_path, notice: 'Publication deleted'
  end

  def publication_params
    params.require(:publication).permit(:title, :sport, :description, :image, :price, :category)
  end
end
