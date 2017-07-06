class AddIncomeBenefitView < ActiveRecord::Migration
  def up
    model = GrdaWarehouse::Hud::IncomeBenefit
    nt    = Arel::Table.new :report_enrollments
    dt    = Arel::Table.new :report_demographics
    mt    = model.arel_table 
    query = mt.project( *mt.engine.column_names.map(&:to_sym).map{ |c| mt[c] }, nt[:id].as('enrollment_id'), dt[:id].as('demographic_id'), dt[:client_id] ).
      join(nt).on( nt[:data_source_id].eq(mt[:data_source_id]).and( nt[:ProjectEntryID].eq mt[:ProjectEntryID] ) ).
      join(dt).on( dt[:data_source_id].eq(mt[:data_source_id]).and( dt[:PersonalID].eq mt[:PersonalID] ) )

    if model.paranoid?
      query = query.where( mt[model.paranoia_column.to_sym].eq nil )
    end

    create_view :report_income_benefits, query
  end

  def down
    drop_view :report_income_benefits
  end
end