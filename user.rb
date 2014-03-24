class User
  attr_accessor :NumberOfBooksThatCanBeCheckedOut
  attr_accessor :Books
  attr_accessor :NumberOfBooksThatCanBeLent
  
  def initialize
    @NumberOfBooksThatCanBeCheckedOut = 10
    @Books = Array.new
    @NumberOfBooksThatCanBeLent =  1
  end

  def CheckOut (book)
    raise Exception.new unless (@Books.count < @NumberOfBooksThatCanBeCheckedOut)
    raise Exception.new unless (!@Books.include?(book))
    
    @Books << book
    book.Available = true
  end
  
  def CheckIn (book)
    @Books.delete(book)
    book.Available = false
  end
  
  def Lend (book, other_user)
    raise Exception.new unless (other_user.Books.count < @NumberOfBooksThatCanBeLent)

    @Books.delete(book)
    other_user.Books << book    
  end
end