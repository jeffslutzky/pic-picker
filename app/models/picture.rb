# == Schema Information
#
# Table name: pictures
#
#  id          :integer          not null, primary key
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


end
