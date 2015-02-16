class CollectorsController < ApplicationController

  def create
    leader = Leader.find_by(id: params[:leader_id]) #!!!!!!!url does not include leader_id-should come from the form.
    collector = Collector.find_by(leader_id: leader.id, user_id: current_user.id)
    if collector
      collector.query = params[:query]
      if collector.query == ""
        collector.destroy
      else
        collector.save
      end
    else
      collector = Collector.create(leader_id: leader.id, user_id: current_user.id, query: params[:query])
    end
    render :json collector
  end


  def update
    collector_id = params[:collector_id]
    collector = Collector.find_by(id: collector_id)
    collector.query = params[:query]
    if collector.query == ""
      collector.destroy
    else
      collector.save
      render :json collector
    end
  end


  def destroy
    collector = Collector.find_by(id: params[:collector_id])
    collector.destroy
  end


  # Fetch all collectors belonging to a user
  def index
    collectors = current_user.collectors
    render :json collectors
  end
end
