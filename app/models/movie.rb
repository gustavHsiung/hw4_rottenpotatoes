class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.search_by_same_director(title)
    puts title
    
    @movie = self.where(:title => title).first
    puts @movie.director
    if(@movie.director.blank? == false)
      self.where(:director => @movie.director)
    end  
  end
end
