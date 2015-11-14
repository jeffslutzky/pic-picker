class PicturesController < ApplicationController

  def index
    session_pics = Picture.session_pics
    @session_pics = Picture.first_two_pics(session_pics)
    Picture.next_pic(session_pics)


    if session_pics.length = 10
      # pop twice
      # @pic1, @pic2 ---> they like #1 better. @remainingpic = @pic1, poppedpic = @pic2
    if session_pics.length < 10
      # pop once
      # pic 3

      # Picture.two_pics(session_pics)

      #render
    end

    def

    end


  end
