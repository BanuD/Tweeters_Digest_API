module CollectorsHelper

  def update_collector
    collector_id = params[:collector_id] || collector.id
    collector = Collector.find_by(id: collector_id)
    collector.query = params[:query]
    if collector.query == ""
      collector.destroy
    else
      collector.save
      render :json collector
    end
  end

end

