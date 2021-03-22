# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthServicesService, type: :model do
  describe '#sanitize_params' do
    context 'when given a nasty SQL injection string' do
      it 'cleans it up' do
        dangerous_sql_statement = 'DROP TABLE USERS'
        expect(HealthServicesService.sanitize_params(dangerous_sql_statement)).to eq('')
      end
    end
    context 'when given a properly formatted string' do
      it 'returns the string as is' do
        properly_formatted_string = '+123.1234'
        expect(HealthServicesService.sanitize_params(properly_formatted_string)).to eq('+123.1234')
      end
    end
  end
end
