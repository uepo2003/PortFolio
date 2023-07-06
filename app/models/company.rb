class Company < ApplicationRecord
  def self.search(search_type, field1, value1, field2, value2)
    if value1.nil? && value2.nil?
      all
    elsif value1.nil?
      where("#{field2} = ?", value2)
    elsif value2.nil?
      where("#{field1} = ?", value1)
    else
      if search_type == 'AND'
        where("#{field1} = ? AND #{field2} = ?", value1, value2)
      else
        where("#{field1} = ? OR #{field2} = ?", value1, value2)
      end
    end
  end


  validates :company_code, presence: true 
  validates :listing_status, presence: true 
  validates :company_name, presence: true 
  validates :company_name_kana, presence: true 
  validates :mail_address, presence: true 
  validates :address, presence: true 
  validates :representative, presence: true 
  validates :representative_kana, presence: true 
  validates :phone_nubmer, presence: true 
  validates :earnings_2022, presence: true 
  validates :profit_2022, presence: true 
  validates :earnings_2021, presence: true 
  validates :profit_2021, presence: true 
  validates :earnings_2020, presence: true 
  validates :profit_2020, presence: true 
  
  belongs_to :user
end
