describe Movie do
  it 'should search movies directed from same director' do
    Movie.search_by_same_director('Star Wars')
  end
end