module GrdaWarehouse::Import::HMISSixOneOne
  class Inventory < GrdaWarehouse::Hud::Inventory
    include ::Import::HMISSixOneOne::Shared
    include TsqlImport
    self.hud_key = :InventoryID
    setup_hud_column_access( GrdaWarehouse::Hud::Inventory.hud_csv_headers(version: '6.11') )

    def self.file_name
      'Inventory.csv'
    end

    # Each import should be authoritative for inventory for all projects included
    def self.delete_involved projects:, range:, data_source_id:, deleted_at:
      deleted_count = 0
      projects.each do |project|
        del_scope = self.where(ProjectID: project.ProjectID, data_source_id: data_source_id)
        deleted_count += del_scope.update_all(DateDeleted: deleted_at)
      end
      deleted_count
    end
  end
end