Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
   @movie = Movie.create!(movie)
  end
end


Then /the (.*) of "(.*)" should be "(.*)"/ do |filed, title, contant|
  @movie = Movie.where(:title => title).first
  @movie.attributes[filed] == contant

end

