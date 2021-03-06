module WarehouseReports
  class FutureEnrollmentsController < ApplicationController
    include WarehouseReportAuthorization
    def index
      et = GrdaWarehouse::Hud::Enrollment.arel_table
      @clients = client_source.
        joins(:source_enrollments).
        preload(:source_enrollments).
        where( et[:EntryDate].gt(Date.today) ).
        order(:LastName, :FirstName).
        page(params[:page]).per(25)
    end

    private def client_source
      GrdaWarehouse::Hud::Client.destination
    end
  end
end
