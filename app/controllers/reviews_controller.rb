class ReviewsController < ApplicationController
  # before_action :find_publication
  def new
    @review = Review.new
    @publication = Publication.find(params[:publication_id])
  end

  def create
    @review = Review.new(review_params)
    @publication = Publication.find(params[:publication_id])
    @review.author = current_user.name
    @review.pub_title = @publication.title
    @review.publication = @publication
    @review.user = current_user

    if @review.save
      redirect_to publications_path(:id =>@publication.id)
    else
      render 'new'
    end
  end

  def index
  end

  def show
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @publication = @review.publication
    @review.update(review_params)
    redirect_to publications_path(:id =>@publication.id)
  end

  def destroy
    @review = Review.find(params[:id])
    @publication = @review.publication
    @review.destroy
    redirect_to publications_path(:id =>@publication.id)
  end

  private
    def review_params
      params.require(:review).permit(:rating, :content, :publication_id)
    end

    # def find_publication
      # @publication = Publication.find(params[:publication_id])
    # end
end
