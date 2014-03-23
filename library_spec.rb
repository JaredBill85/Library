require_relative 'library.rb'
require_relative 'user.rb'
require_relative 'book.rb'

describe Library do
  it 'User can check-out books ' do
    user = User.new
    book = Book.new
    
    user.CheckOut(book)
    book.CheckedOut.should be_true
   end
   
    it 'User can check-in books ' do
    user = User.new
    book = Book.new
    
    user.CheckOut(book)
    user.CheckIn(book)
    book.CheckedOut.should be_false
   end 
end

describe Book do
  it 'has a Genre' do
    book = Book.new
    
    book.Genre = "Sci-fi"
    book.Genre.should eq("Sci-fi")
  end
end