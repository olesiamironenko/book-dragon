class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @books = Book.all
  end

  # GET /books/1 or /books/1.json
  def show
    @book = Book.find(params[:id])
  end

  # GET /books/new
  def new
    @book = Book.new
    @authors = Author.all
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
    @authors = Author.all
    @book.authors.build if @book.authors.empty?
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    # Handle existing authors (selected via collection_select)
    if params[:book][:author_ids].present?
      @book.author_ids = params[:book][:author_ids]
    end

    # Handle new author creation (from the text field)
    if params[:book][:new_author_name].present?
      new_author = Author.find_or_create_by(name: params[:book][:new_author_name])
      @book.authors << new_author unless @book.authors.include?(new_author)
    end

    if @book.save
      redirect_to @book, notice: "Book was successfully updated."
    else
      render :show
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy!

    respond_to do |format|
      format.html { redirect_to books_path, status: :see_other, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:book_name, :book_description, :age_recomendations, author_ids: [], authors_attributes: [:id, :author_name, :_destroy])
    end
end
