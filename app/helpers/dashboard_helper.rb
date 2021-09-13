module DashboardHelper
  def distance_of_time_posted_in_words(from_time, to_time)
    distance_of_time_in_words(from_time, to_time).concat(' ago')
  end
end
