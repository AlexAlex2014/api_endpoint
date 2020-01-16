# frozen_string_literal: true

# class RequestApiController
class RequestApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @ticket = Ticket.new(
      request_number: params[:RequestNumber],
      sequence_number: params[:SequenceNumber].to_i,
      request_type: params[:RequestType],
      response_due_date_time: params[:DateTimes][:ResponseDueDateTime],
      primary_service_area_code: params[:ServiceArea][:PrimaryServiceAreaCode][:SACode],
      additional_service_area_codes: params[:ServiceArea][:AdditionalServiceAreaCodes][:SACode],
      well_known_text: params[:ExcavationInfo][:DigsiteInfo][:WellKnownText]
    )
    return unless @ticket.save

    return unless @ticket.save

    @excavator = Excavator.new(
      company_name: params[:Excavator][:CompanyName],
      address: params[:Excavator][:Address],
      crew_on_site: params[:Excavator][:CrewOnsite] == 'true',
      ticket: @ticket
    )
    @excavator.save
  end
end
