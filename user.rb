class User

  def CheckOut (book)
    book.Available = true
  end
  
  def CheckIn (book)
    book.Available = false
  end
end