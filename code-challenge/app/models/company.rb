class Company < ApplicationRecord
  has_rich_text :description
  
  validates_format_of :email, :allow_blank => true, :with => /^[A-Z0-9+_.-]+@getmainstreet\.com$,
  :message => "The domain of the email entered should match <EMAIL>@mainstreet.com"


end
