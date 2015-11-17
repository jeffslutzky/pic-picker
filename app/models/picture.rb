# == Schema Information
#
# Table name: pictures
#
#  id          :integer          not null, primary key
#  favroite_id :integer
#  photo_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'nokogiri'
require 'open-uri'
require 'pry'

class Picture < ActiveRecord::Base
  belongs_to :favorite
  belongs_to :comparison

  def self.pic_scrape
    document = open("http://shinishikawa.com/").read
    noko_document = Nokogiri::HTML(document)
    list_of_images = noko_document.search(".type-image")
    array_of_images = list_of_images.map do |image|
      image.attr("href")
    end
    array_of_images.each do |image_url|
      Picture.create(photo_url: image_url)
    end
  end

  def self.session_pics
    session_pics = Picture.all.shuffle.slice(0..9)
  end


  def self.pic_picker(session_pics)






    # two_pics ||= []
    #     if session_pics.length == 10
    #       pic1 = session_pics.pop
    #       pic2 = session_pics.pop
    #       two_pics << pic1
    #       two_pics << pic2
    #     else
    #       pic = session_pics.pop
    #       two_pics << pic
    #     end
    # two_pics
    # end
  end
end
