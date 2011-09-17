class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :name, :email, :password, :password_confirmation, :remember_me
  attr_accessible :roles
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  #attr_accessor :username
  #attr_accessible :username

  validates_presence_of :name, :username, :password_confirmation

  #---------------------------------------------------------------
  #- CanCan
  belongs_to :assignment
  belongs_to :order


  scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0 "} }

  ROLES = %w[admin moderator]

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def role?(role)
    roles.include? role.to_s
  end
  #---------------------------------------------------------------
  
  protected

   def self.find_for_database_authentication(warden_conditions)
     conditions = warden_conditions.dup
     username = conditions.delete(:username)
     where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => username.downcase }]).first
   end
   
   # Attempt to find a user by it's email. If a record is found, send new
    # password instructions to it. If not user is found, returns a new user
    # with an email not found error.
    def self.send_reset_password_instructions(attributes={})
      recoverable = find_recoverable_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
      recoverable.send_reset_password_instructions if recoverable.persisted?
      recoverable
    end 

    def self.find_recoverable_or_initialize_with_errors(required_attributes, attributes, error=:invalid)
      (case_insensitive_keys || []).each { |k| attributes[k].try(:downcase!) }

      attributes = attributes.slice(*required_attributes)
      attributes.delete_if { |key, value| value.blank? }

      if attributes.size == required_attributes.size
        if attributes.has_key?(:login)
           login = attributes.delete(:login)
           record = find_record(login)
        else  
          record = where(attributes).first
        end  
      end  

      unless record
        record = new

        required_attributes.each do |key|
          value = attributes[key]
          record.send("#{key}=", value)
          record.errors.add(key, value.present? ? error : :blank)
        end  
      end  
      record
    end

    def self.find_record(login)
      where(["username = :value OR email = :value", { :value => login }]).first
    end
  
end
