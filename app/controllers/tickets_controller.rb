class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
    @excavator = @ticket.excavator
    positioning(@ticket)
  end

  private

  def positioning(ticket)
    pars = /((\-?\d+(\.\d+)?\s\-?\d+(\.\d+)?(\,)?)+)/
    polygon_posit = ticket.well_known_text.match(pars).to_s
    gon.watch.coords = polygon_posit.split(',').map do |coord|
      coord.split(' ')
    end
  end
end
