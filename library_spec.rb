require_relative 'user.rb'
require_relative 'book.rb'

describe User do
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
  
  it 'user cannot check out more than N books at a time' do
    user.NumberOfBooksThatCanBeCheckedOut = 2
    book2 = Book.new
    book3 = Book.new
    
    user.CheckOut(book)
    user.CheckOut(book2)
    expect { user.CheckOut(book3) }.to raise_error
  end
  
  it ':user cannot borrow the same book twice.' do
    user.CheckOut(book)
    expect{ user.CheckOut(book)}.to raise_error
  end
  
  context 'when a 2nd user would like to borrow books' do
    let (:user2) { User.new }
      #TODO - Does this user get it from the library, then loan it?  
      # Or is it from their personal collection?  
      # Assumption - User gets the book from the library    
    
    it 'user can lend a book to other users' do
       user.CheckOut(book)
       user.Lend(book, user2)
      
       user.Books.should be_empty
       user2.Books.include?(book).should be_true
    end
    
    it 'When lending books user can set a limit on how many books to lend at any given time'  do
      user.NumberOfBooksThatCanBeLent = 1
      book2 = Book.new
      
      user.Lend(book, user2)
      expect { user.Lend(book2, user2) }.to raise_error
    end  
    
    
    it 'users cannot lend books they do not have' do
       user.Lend(book, user2)
      
       expect { user.Lend(book, user2) }.to raise_error
    end
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