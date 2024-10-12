class ReadingListsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_reading_list, only: %i[ show edit update destroy ]

  # GET /reading_lists or /reading_lists.json
  def index
    @reading_lists = current_user.reading_lists
  end

  # GET /reading_lists/1 or /reading_lists/1.json
  def show
    @books = @reading_list.books
  end

  # GET /reading_lists/new
  def new
    @reading_list = ReadingList.new
  end

  # GET /reading_lists/1/edit
  def edit
  end

  # POST /reading_lists or /reading_lists.json
  def create
    @reading_list = current_user.reading_lists.build(reading_list_params)

    respond_to do |format|
      if @reading_list.save
        format.html { redirect_to @reading_list, notice: "Reading list was successfully created." }
        format.json { render :show, status: :created, location: @reading_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reading_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reading_lists/1 or /reading_lists/1.json
  def update
    respond_to do |format|
      if @reading_list.update(reading_list_params)
        format.html { redirect_to @reading_list, notice: "Reading list was successfully updated." }
        format.json { render :show, status: :ok, location: @reading_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reading_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reading_lists/1 or /reading_lists/1.json
  def destroy
    @reading_list.destroy!

    respond_to do |format|
      format.html { redirect_to reading_lists_path, status: :see_other, notice: "Reading list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add_book
    @reading_list = current_user.reading_lists.find(params[:id])
    @book = Book.find(params[:book_id])
    @reading_list.books << @book unless @reading_list.books.include?(@book)
  
    redirect_to @reading_list, notice: 'Book added to the reading list.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading_list
      @reading_list = current_user.reading_lists.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reading_list_params
      params.require(:reading_list).permit(:name)
    end
end
