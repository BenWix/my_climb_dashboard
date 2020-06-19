class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :comments
  has_many :posts
  has_many :sends
  has_many :climbs, through: :sends
  has_many :send_comments

  def self.from_omniauth(auth)
    # binding.pry
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.name = auth.info.name
      user.uid = auth.uid
      user.email = auth.info.email 
      user.bio = ""
      user.password = Devise.friendly_token[0,20]
    end
  end

  def display_name
    if name.empty?
      "Climber#{id}"
    else 
      name
    end
  end

  def recent_sends
    return_count = 5 
    if self.sends.length < return_count
      self.sends
    else 
      self.sends.order('id desc').limit(return_count)
    end
  end

  def hardest_climb
    climbs.max_by{ |x| GRADES.index(x.grade)}
  end

  def hardest_flash 
    sends.select{|send| send.attempts == 1}.max_by{ |x| GRADES.index(x.climb.grade)}.climb
  end

  def has_flash 

  end

  private

  def flashes

  end
  


end
