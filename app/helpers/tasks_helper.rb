module TasksHelper
  def sort_by_date_link
    title = params[:date] === 'asc' ? t('.sort_by_date_desc') : t('.sort_by_date_asc')
    dateSort = params[:date] == 'asc' ? 'desc' : 'asc' 
    link_to title, date: dateSort
  end

  def sort_by_priority_link
    title = params[:priorities] === 'asc' ? t('.sort_by_priority_desc') : t('.sort_by_priority_asc')
    prioritySort = params[:priorities] == 'asc' ? 'desc' : 'asc' 
    link_to title, priorities: prioritySort
  end
  
end
