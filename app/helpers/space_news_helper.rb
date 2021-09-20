module SpaceNewsHelper

  def parse(data)
    parse_data = JSON.parse(data, :symbolize_names => true)
  end
end
