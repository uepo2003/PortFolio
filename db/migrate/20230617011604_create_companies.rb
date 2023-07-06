class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :company_code
      t.string :listing_status
      t.string :company_name
      t.string :company_name_kana
      t.string :mail_address
      t.string :address
      t.string :representative
      t.string :representative_kana
      t.string :phone_nubmer
      t.string :earnings_2022
      t.string :profit_2022
      t.string :earnings_2021
      t.string :profit_2021
      t.string :earnings_2020
      t.string :profit_2020
      t.timestamps
    end
  end
end
