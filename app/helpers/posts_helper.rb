module PostsHelper
  def distance_of_time_posted_in_words(from_time)
    time_ago_in_words(from_time).concat(' ago')
  end
end
