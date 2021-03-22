require 'rails_helper'

RSpec.describe HealthServicesService, type: :model do
  describe '#sanitize_params' do
    context 'when given a nasty SQL injection string'
    it 'cleans it up' do
      dangerous_sql_statement = "DROP TABLE USERS"
      expect(HealthServicesService.sanitize_params(dangerous_sql_statement)).to eq('')
    end
  end
end
