class User < ActiveRecord::Base
  # #2
     before_save { self.email = email.downcase if email.present? }
     before_save :cap_name
   # #3
     validates :name, length: { minimum: 1, maximum: 100 }, presence: true
   # #4
    validates :password, presence: true, length: { minimum: 6 }, unless: :password_digest
    validates :password, length: { minimum: 6 }, allow_blank: true
   # #5
     validates :email,
               presence: true,
               uniqueness: { case_sensitive: false },
               length: { minimum: 3, maximum: 254 }

   # #6
     has_secure_password
     def cap_name(name)
    if name
      ray=[]
      name = name.split(" ")
      name.each do |x|
      ray << x.capitalize
      end
      self.name = ray.join(" ")
    end

  end



end
