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
    if (@NumberOfBooksThatCanBeCheckedOut <= @Books.count)
      raise Exception.new
    end
   
   if (@Books.include?(book))
       raise Exception.new
    end
    
    @Books << book
    book.Available = true
  end
  
  def CheckIn (book)
    @Books.delete(book)
    book.Available = false
  end
  
  def Lend (book, other_user)
    if (@NumberOfBooksThatCanBeLent <= other_user.Books.count)
      raise Exception.new
    end
    
    @Books.delete(book)
    other_user.Books << book    
  end
end