json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :due_date
  json.url task_url(task, format: :json)
end
