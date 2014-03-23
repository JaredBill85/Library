class User

  def CheckOut (book)
    book.CheckedOut = true
  end
  
  def CheckIn (book)
    book.CheckedOut = false

  end
end