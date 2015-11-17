class ComparisonsController < ApplicationController

  def index
    @comparison = Comparison.create
    render 'index'
    #invoke another method to select 10 pics and randomize them. 
    #render index view to compare 2 pictures
    #keep running until all of the pictures are compared
  end

  def create
    binding.pry
    picture_not_chosen = Picture.find(params[picture_id])
    picture_not_chosen.destroy
    comparison = Comparison.find(params[comparison_id])
    comparison.pictures.count 
    #show the best picture
    #let the user click "Send" and the pic is sent to your e-mail address.
  end



end
