class User < ActiveRecord::Base

  #accessor
  attr_accessor :group_key

  #devise config
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :authentication_keys => [:email]

  #association
  belongs_to :group

   has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :avatar, content_type: ["image/jpg","image/jpeg","image/png"]

  def name
    "#{family_name} #{first_name}"
  end

  def name_kana
    "#{family_name_kana} #{first_name_kana}"
  end

  def full_profile?
    avatar? && family_name? && first_name? && family_name_kana? && first_name_kana?
    # 姓名、姓名カナ、画像が設定されていないとfalseを返す。カラム名 + ? と書くと、指定したカラムに値が存在しないときにfalseを返すというActiverecordの機能を利用
  end

  private
  def has_group_key?
    group_key.present?
  end

  def group_key_to_id
    group = Group.where(key: group_key).first_or_create
    self.group_id = group.id
  end

end
