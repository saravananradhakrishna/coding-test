class AddCityAndStateToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :city, :string 
    add_column :companies, :state, :string 
  end
end
