class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
    # saving data in the controller
    @gossip = Gossip.create(gossip_params)
    @gossip.save
    redirect_to @gossip
  end

  def show
    # return one user
    @gossip = Gossip.find(params[:id])
  end

  def edit # idem new
    @gossip = Gossip.find(params[:id])
  end

  def update # pratiquement identique à create
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to @gossip
    else
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  # Utilisé dans create et update
  private
  def gossip_params
    params.require(:gossip).permit(:anonymous_author, :content)
  end

end
