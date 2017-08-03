module Admin
  class DataQualityGradesController < ApplicationController
    before_action :require_can_edit_dq_grades!

    def index
      @utilization_grade = utilization_grade_source.new
      @utilization_grades = utilization_grade_scope.
        order(weight: :asc)

      @missing_grade = missing_grade_source.new
      @missing_grades = missing_grade_scope.
        order(weight: :asc)
    end

    def missing_grade_scope
      missing_grade_source.all
    end

    def missing_grade_source
      GrdaWarehouse::Grades::Missing
    end
        
    def utilization_grade_scope
      utilization_grade_source.all
    end

    def utilization_grade_source
      GrdaWarehouse::Grades::Utilization
    end

  end
end