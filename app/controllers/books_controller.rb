class BooksController < ApplicationController

    before_action :id, only: [:show, :destroy, :update]

    def index
        render json: { status: 200, books: Book.all }
    end

    def show
        found_book = Book.find(@id)
        render json: { status: 200, book: found_book }
    end

    def create
        p params

        book = Book.new(book_params)

        if book.save
            render(status: 201, json: { book: book })
        else
            render(status: 422, json: { book: book })
        end
    end

    def update
        book = Book.find(@id)
        book.update(book_params)
        render(json: { book: book })
    end

    def destroy
        book = Book.destroy(@id)
        render(status: 204)
    end

    private

    def book_params
        params.required(:book).permit(:title,
        :author, :genre, :publisher, :publish_date)
    end

    def id 
        @id = params[:id]
    end

end