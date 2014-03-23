require_relative 'library.rb'
require_relative 'user.rb'
require_relative 'book.rb'

describe Library do
  let (:user) { User.new }
  let (:book) { Book.new }    
    
  it 'User can check-out books ' do
    user.CheckOut(book)
    book.Available.should be_true
  end
   
  it 'User can check-in books ' do
    user.CheckOut(book)
    user.CheckIn(book)
    book.Available.should be_false
  end 
end

describe Book do

  let(:book) { Book.new }
  it 'has a Genre' do
    book.Genre = "Sci-fi"
    book.Genre.should eq("Sci-fi")
  end
  
  it 'has a Format' do
    book.Format = "Hardcopy"
    book.Format.should eq("Hardcopy")
  end
  
  it 'has a Language' do
    book.Language = "Pittsburgese"
    book.Language.should eq("Pittsburgese")
  end

end