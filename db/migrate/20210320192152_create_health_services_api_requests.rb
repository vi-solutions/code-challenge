class CreateHealthServicesApiRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :health_services_api_requests do |t|
      t.integer :status
      t.string :ip_address
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end
end
