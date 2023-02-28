class TaglineGeneration < ApplicationRecord
  belongs_to :user, optional: true
  
  validates :parameters, presence: true
  validates :response, presence: true
  validate :parameters_is_hash, :response_is_hash

  def input_text
    parameters["prompt"]
  end

  private
  
  def parameters_is_hash
    unless parameters.is_a? Hash
      errors.add(:parameters, "must be a hash")
    end
  end
  
  def response_is_hash
    unless response.is_a? Hash
      errors.add(:response, "must be a hash")
    end
  end
end
