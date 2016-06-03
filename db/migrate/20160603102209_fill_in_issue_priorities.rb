class FillInIssuePriorities < ActiveRecord::Migration[5.0]
  def change
    issue_priorities = [
      {name: "Lowest", icon_path: "lowest.svg", display_order: 4},
      {name: "Low", icon_path: "low.svg", display_order: 3},
      {name: "Medium", icon_path: "medium.svg", display_order: 0},
      {name: "High", icon_path: "high.svg", display_order: 2},
      {name: "Highest", icon_path: "highest.svg", display_order: 1}
    ]

    issue_priorities.each { |p| IssuePriority.create(name: p[:name], icon_path: p[:icon_path], display_order: p[:display_order]) }
  end
end
