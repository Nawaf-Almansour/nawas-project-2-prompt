class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action  :user_is_admin, only: %i[new create edit update destroy]


  def index
    @book = Book.all.order(id: :desc)
  end

  def home
    # @book = Book.all.order(id: :desc)
    @book = Book.paginate(page: params[:page], per_page: 7)

  end


  def new
    @book = Book.new
  end


  def show
      @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, alert: "User created successfully."
    else
      redirect_to new_books_path, alert: "Error creating user."
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      @book.update(book_params)
      redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id])
      @book.destroy 
      redirect_to books_path , alert: 'Are you sure?'
  end

  private



     def set_book
      # @book = current_user.books.find(params[:id])
      @book = Book.find(params[:id])

     end

     def book_params
      params.require(:book).permit(:title, :category, :book_year_published, :image )
     end

end
