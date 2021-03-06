module PatientReferralImporter
  extend ActiveSupport::Concern
  included do
    def self.column_headers
      {
        medicaid_id: 'MEDICAID_ID',
        last_name: 'MEMBER_NAME_LAST',
        first_name: 'MEMBER_NAME_FIRST',
        middle_initial: 'MEMBER_MIDDLE_INITIAL',
        suffix: 'Member_Suffix',
        birthdate: 'Member_Date_of_Birth',
        gender: 'Member_Sex',
        aco_name: 'ACO_MCO_Name',
        aco_mco_pid: 'ACO_MCO_PID',
        aco_mco_sl: 'ACO_MCO_SL',
        health_plan_id: 'HEALTH_PLAN_ID',
        cp_assignment_plan: 'MEMBER_CP_ASSIGNMENT_PLAN',
        cp_name_dsrip: 'CP_NAME_DSRIP',
        cp_name_official: 'CP_Name_Official',
        cp_pid: 'CP_PID',
        cp_sl: 'CP_SL',
        enrollment_start_date: 'Enrollment_Start_Date',
        start_reason_description: 'Start_Reason_Desc',
        address_line_1: 'RESIDENTIAL_ADDRESS_LINE_1',
        address_line_2: 'RESIDENTIAL_ADDRESS_LINE_2',
        address_city: 'RESIDENTIAL_ADDRESS_CITY',
        address_state: 'RESIDENTIAL_ADDRESS_STATE',
        address_zip: 'RESIDENTIAL_ADDRESS_ZIPCODE_1',
        address_zip_plus_4: 'RESIDENTIAL_ADDRESS_ZIPCODE_2',
        email: 'Email',
        phone_cell: 'PHONE_NUMBER_CELL',
        phone_day: 'PHONE_NUMBER_DAY',
        phone_night: 'PHONE_NUMBER_NIGHT',
        primary_language: 'PRIMARY_LANGUAGE_SPOKEN_DESC',
        primary_diagnosis: 'PRIMARY_DIAGNOSIS',
        secondary_diagnosis: 'SECONDARY_DIAGNOSIS',
        pcp_last_name: 'PCP_Name_Last',
        pcp_first_name: 'PCP_Name_First',
        pcp_npi: 'PCP_NPI',
        pcp_address_line_1: 'PCP_Address_Line_1',
        pcp_address_line_2: 'PCP_Address_Line_2',
        pcp_address_city: 'PCP_Address_City',
        pcp_address_state: 'PCP_Address_State',
        pcp_address_zip: 'PCP_Address_ZipCode',
        pcp_address_phone: 'PCP_Phone_Number',
        dmh: 'DMH_FLAG',
        dds: 'DDS_FLAG',
        eoea: 'EOEA_FLAG',
        ed_visits: 'ED_VISITS',
        snf_discharge: 'SNF_DISCHARGE',
        identification: 'Identification_flag',
        record_status: 'RECORD_STATUS',
        updated_on: 'Record_Update_Date',
        exported_on: 'Export_Date',
      }
    end

  end
end
