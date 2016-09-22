# JSON helper for parsing JSON responses
module JsonHelper
  def json
    JSON.parse(response.body)
  end
end