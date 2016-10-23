class PagesController < ApplicationController
  def index
    render json: Page.all
  end

  def create
    url = params.require(:url)
    uri = URI.parse(url)
    unless uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
      return render status: 400, json: 'the url provided is not a web uri'
    end
    document = Nokogiri::HTML.parse(Net::HTTP.get(uri))
    page = Page.find_or_initialize_by(url: url)
    page.update!(
      headers1: document.css('h1').map(&:content),
      headers2: document.css('h2').map(&:content),
      headers3: document.css('h3').map(&:content),
      links: document.css('a').map { |a| a['href'] },
    )
    render status: :created, json: page
  end
end
