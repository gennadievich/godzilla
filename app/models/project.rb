class Project < ApplicationRecord
  validates_presence_of :name

  has_many :issues, dependent: :destroy
  belongs_to :project_type, class_name: "ProjectType", foreign_key: "type_id"
end