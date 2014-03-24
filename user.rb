class User
  attr_accessor :NumberOfBooksThatCanBeCheckedOut
  attr_accessor :Books
  
  def initialize
    @NumberOfBooksThatCanBeCheckedOut = 10
    @Books = Array.new
  end

  def CheckOut (book)
    if (@NumberOfBooksThatCanBeCheckedOut <= @Books.count)
      raise Exception.new
    end
 
    @Books << book
    book.Available = true
  end
  
  def CheckIn (book)
    @Books.delete(book)
    book.Available = false
  end
end