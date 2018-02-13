module CohortColumns
  class VispdatScore < Base
    attribute :column, String, lazy: true, default: :vispdat_score
    attribute :title, String, lazy: true, default: 'VI-SPDAT Score'

    def default_input_type
      :read_only
    end

    def value(cohort_client)
      Rails.cache.fetch([cohort_client.client.id, 'vispdat_score'], expires_at: 8.hours) do
        cohort_client.client.most_recent_vispdat_score
      end
    end
  end
end