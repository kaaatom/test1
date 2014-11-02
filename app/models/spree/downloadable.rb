require 'digest/md5'

class Spree::Downloadable < Spree::ProductDownload
  has_attached_file :attachment,
                    :url => "/spree/downloadable/:id/:basename.:extension"

  validates_attachment_presence :attachment
  before_save :set_title

  scope :visible, where(enabled: true, secret_links_only: false)
  
  attr_accessible :attachment, :title, :password, :enabled, :secret_links_only

  def filename
    attachment_file_name
  end

  def path
    attachment.path(:product)
  end

  def mime
    MIME::Types.type_for(path).first.content_type
  end

  def public?
    !password_protected? && !secret_links_only?
  end

  def password_protected?
    password.present?
  end

  def password_correct?(password)
    self.password == password
  end

  def secret_link_correct?(secret)
    secret_hash, order_id = secret.split('-')
    order = Spree::Order.find(order_id) rescue nil
    if order && order_contains_product(order)
      secret == generate_secret_hash(order.id)
    else
      false
    end
  end

  def generate_secret_hash(order_id)
    "#{Digest::MD5.hexdigest(id.to_s)}-#{order_id}"
  end

  def validate
    unless attachment.errors.empty?
      errors.add :attachment, "Paperclip returned errors for file '#{attachment_file_name}'."
      false
    end
  end

  def extension_name
    File.extname(attachment_file_name).split('.').last
  end

  private

  def set_title
    if self.title.blank?
      self.title = self.filename
    end
  end

  def order_contains_product(order)
    viewable.variants.any?{|v| order.contains?(v) }
  end


  
end
