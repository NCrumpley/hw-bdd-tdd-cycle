require 'rails_helper'

describe MoviesController do

    describe "#director" do
       
       context "When specificed movie has director" do
           
           it "Should find movies with the same director" do
           @movie_id = "1234"
           @movie = double('fake_movie', :director => 'James Cameron')
           
           expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
           expect(@movie).to receive(:similar_movies)
           get :director, :id => @movie_id
           expect(response).to render_template(:director)
           
            end
           
        end
        
        context "When specificed movie has no director" do
            
            it "redirect to home page" do
                @movie_id = "1234"
                @movie = double('fake_movie').as_null_object
                expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
                get :director, :id => @movie_id
                expect(response).to redirect_to(movies_path)
            end
           
        end
    end
end