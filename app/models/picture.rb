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


  def pic_scrape
    document = open("http://shinishikawa.com/").read
    noko_document = Nokogiri::HTML(document)
    list_of_images = noko_document.search(".type-image")
    array_of_images = list_of_images.map do |image|
      image.attr("href")
    end
  end
  
end
