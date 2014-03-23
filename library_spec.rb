require_relative 'library.rb'
require_relative 'user.rb'
require_relative 'book.rb'

describe Library do
  it 'User can check-out books ' do
    user = User.new
    book = Book.new
    
    user.CheckOut(book)
    book.Available.should be_true
   end
   
    it 'User can check-in books ' do
    user = User.new
    book = Book.new
    
    user.CheckOut(book)
    user.CheckIn(book)
    book.Available.should be_false
   end 
end

describe Book do
  it 'has a Genre' do
    book = Book.new
    
    book.Genre = "Sci-fi"
    book.Genre.should eq("Sci-fi")
  end
  
  it 'has a Format' do
    book = Book.new
    
    book.Format = "Hardcopy"
    book.Format.should eq("Hardcopy")
  end
  
  it 'has a Language' do
    book = Book.new
    
    book.Language = "Pittsburgese"
    book.Language.should eq("Pittsburgese")
  end

end