class FillInProjectTypes < ActiveRecord::Migration[5.0]
  def change
    project_types = [
      {name: "Software", icon_path: "software.svg", display_order: 0},
      {name: "Service Desk", icon_path: "service_desk.svg", display_order: 1},
      {name: "Business", icon_path: "business.svg", display_order: 2}
    ]

    project_types.each { |pt| ProjectType.create(name: pt[:name], icon_path: pt[:icon_path], display_order: pt[:display_order]) }
  end
end
