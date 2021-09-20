require 'rubygems'
require 'httparty'

class SpaceFlight
  include HTTParty
  base_uri 'api.spaceflightnewsapi.net/'

  def articles
    self.class.get('/v3/articles')
  end

  def article_limit(limit)
    self.class.get("/v3/articles/?_limit=#{limit}")
  end

  def article_id(id)
    self.class.get("/v3/articles/#{id}")
  end

  def article_count
    self.class.get('/v3/articles/count')
  end

  def article_search(input)
    self.class.get("/v3/articles/?title_contains=#{input}")
  end
end
