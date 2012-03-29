require 'spec_helper'

describe MoviesController , :type => :controller do
  
  before :each do
    @fake_results = [mock('Movie'),mock('Movie')]
  end
  
  describe 'search by director' do
    
    it 'should call the model method that performs director search' do
      Movie.should_receive(:search_by_same_director).with('Star Wars').and_return(@fake_results)
      get :similar, {:title => 'Star Wars'  }
    end
    
    describe 'after valid search' do
      before :each do
        Movie.stub(:search_by_same_director).and_return(@fake_results)
        get :similar, {:title => 'Star Wars'  }
      end
      it 'should select search results template for randering' do
        response.should render_template('similar')
      end

      it 'should make the director search results available to the template' do
        assigns(:movies).should == @fake_results
      end
    end
    
    it 'should show no director message when a searching movie has no director info' do
      Movie.stub(:search_by_same_director).and_return(nil)
      get :similar, {:title => 'Alien'}
      flash[:notice].should == '\'Alien\' has no director info.'
    end    
  end
end