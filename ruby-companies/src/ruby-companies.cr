require "kemal"
require "crystagiri"

URL = "http://www.rubyturkiye.org/companies"

before_all do |env|
  env.response.content_type = "application/json"
end

get "/companies" do
  data = [] of String
  result = [] of String
  size = 0.as Int32

  doc = Crystagiri::HTML.from_url(URL)
  doc.css("table > tbody > tr") { |tag| data << tag.content }

  size = data.size - 1
  result = (1..size).map do |i|
    record = data[i].split('\n')
    { name: record[1].strip, sector: record[2].strip, city: record[3].strip }
  end

  render_json({
    "companies": result,
    "total_count": size
  })
end

get "/ping" do
  render_json({
    "Cemal Süreya": "Hayat kısa, kuşlar uçuyor."
  })
end

def render_json(data)
  data.to_json
end

Kemal.run
