require "active_record"

class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end

  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{id}. #{display_status} #{todo_text} #{display_date}"
  end

  def self.overdue
    #Notice that self.overdue is a class method because of the self. prefix.
    #Those methods are not available in individual objects of the class, but on the entire class itself.
    where("due_date < ?", Date.today)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.show_list
    puts "\nMy Todo-List\n\nOverdue\n"
    puts overdue.map { |todo| todo.to_displayable_string }
    puts "\nDue Today\n"
    puts due_today.map { |todo| todo.to_displayable_string }
    puts "\nDue Later\n"
    puts due_later.map { |todo| todo.to_displayable_string }
  end

  def self.add_task(h)
    Todo.create!(todo_text: h[:todo_text], due_date: Date.today + h[:due_in_days], completed: false)
  end

  def self.mark_as_complete(id)
    to_mark = Todo.find(id)  # To fetch the id of the given task from database.
    to_mark.completed = true
    to_mark.save # To commit the changes in the database.
    to_mark
  end
end
