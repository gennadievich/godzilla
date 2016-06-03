class Issue < ApplicationRecord
  validates_presence_of :summary, :project_id, :type_id
end
