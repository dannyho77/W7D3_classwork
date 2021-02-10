class User < ApplicationRecord
    validates :username, :password_digest, :session_token, presence: true

    validates :username, :session_token, uniqueness: true

    before_validation :ensure_session_token

    attr_reader :password

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end 

    def check_password?(password)
        password_object = BCrypt::Password.new(password_digest)

        password_object.is_password?(password)

        #checking if new password (line 15 parameter) is the same password we put in to get our password digest 
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

    def reset_session_token
        self.session_token = SecureRandom::urlsafe_base64

        self.save!

        self.session_token
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        if user && check_password?(password)
            return user
        else  
            return nil 
        end 
    end

    has_many :goals,
    foreign_key: :author_id,
    class_name: :Goal

    has_many :comments,
    foreign_key: :author_id,
    class_name: :Comment


end
