class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.search_by_same_director(title)
   
    @movie = self.where(:title => title).first
    if(@movie.nil? == false && @movie.director.blank? == false)
      self.where(:director => @movie.director)
    end  
  end
end
