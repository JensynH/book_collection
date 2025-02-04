# File for testing the Book model

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'Validations' do
    it 'is valid with a title, author, price, and published date' do
      book = Book.new(
        title: 'Test Book',
        author: 'Test Author',
        price: 9.99,
        published_date: Date.new(2023, 1, 1) # Ensure the date format matches
      )
      expect(book).to be_valid
    end

    it 'is invalid without a title' do
      book = Book.new(title: nil, author: 'Test Author', price: 9.99, published_date: Date.new(2023, 1, 1))
      expect(book).to_not be_valid
      expect(book.errors[:title]).to include("can't be blank")
    end

    it 'is invalid without an author' do
      book = Book.new(title: 'Test Book', author: nil, price: 9.99, published_date: Date.new(2023, 1, 1))
      expect(book).to_not be_valid
      expect(book.errors[:author]).to include("can't be blank")
    end

    it 'is invalid without a price' do
      book = Book.new(title: 'Test Book', author: 'Test Author', price: nil, published_date: Date.new(2023, 1, 1))
      expect(book).to_not be_valid
      expect(book.errors[:price]).to include("can't be blank")
    end

    it 'is invalid without a published date' do
      book = Book.new(title: 'Test Book', author: 'Test Author', price: 9.99, published_date: nil)
      expect(book).to_not be_valid
      expect(book.errors[:published_date]).to include("can't be blank")
    end

    # it 'is valid with a title' do
    #   book = Book.new(title: 'Test Book')
    #   expect(book).to be_valid
    # end
  
    # it 'is invalid without a title' do
    #   book = Book.new(title: nil)
    #   expect(book).to_not be_valid
    # end

  end
end
