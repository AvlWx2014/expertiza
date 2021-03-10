class ReviewTimesController < ApplicationController
  before_action :set_review_time, only: [:show, :edit, :update, :destroy]

  # GET /review_times
  def index
    @review_times = ReviewTime.all
  end

  # GET /review_times/1
  def show
  end

  # GET /review_times/1/edit
  def edit
  end

  # POST /review_times
  def create
    @review_time = ReviewTime.new(review_time_params)

    if @review_time.save
      redirect_to @review_time, notice: 'Review time was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /review_times/1
  def update
    if @review_time.update(review_time_params)
      redirect_to @review_time, notice: 'Review time was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /review_times/1
  def destroy
    @review_time.destroy
    redirect_to review_times_url, notice: 'Review time was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review_time
      @review_time = ReviewTime.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_time_params
      params.require(:review_time).permit(:time_data)
    end
end
