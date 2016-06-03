class FillInIssueTypes < ActiveRecord::Migration[5.0]
  def change
    issue_types = [
      {name: "New Feature", icon_path: "new_feature.svg", display_order: 0},
      {name: "Bug", icon_path: "bug.svg", display_order: 1},
      {name: "Task", icon_path: "task.svg", display_order: 2},
      {name: "Improvement", icon_path: "improvement.svg", display_order: 3},
      {name: "Epic", icon_path: "epic.svg", display_order: 4},
      {name: "Story", icon_path: "story.svg", display_order: 5},
      {name: "IT Help", icon_path: "it_help.svg", display_order: 6},
      {name: "Purchase", icon_path: "purchase.svg", display_order: 7},
      {name: "Story", icon_path: "story.svg", display_order: 8},
      {name: "Access", icon_path: "access.svg", display_order: 9}
    ]

    issue_types.each { |type| IssueType.create(name: type[:name], icon_path: type[:icon_path], display_order: type[:display_order]) }
  end
end
