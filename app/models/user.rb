class User
  #include DataMapper::Resource
  #property :id,         Serial
  #property :name,       String, :length => 200
  # ...
  
  def say_hi
    'hi'
  end
end
