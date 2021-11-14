require 'json'
class ReportController < ApplicationController

  def generate_report
    @event = Event.find_by(id: params[:event_id])

    @donations_w_details = [].as_json


    unless @event.nil?

      @donations = ManageDonation.where(event_id: @event)
      unless @donations.nil?

        @donations.each do | donation|
          @donations_w_details << Donation.find( donation["donation_id"])
        end
      end


      render json: {
        status: 200,
        cidade: @event.city,
        doacoes:  @donations_w_details


      }

    else
      render json: {
        error: "not found",
        status: 404
      }


    end

  end
end
