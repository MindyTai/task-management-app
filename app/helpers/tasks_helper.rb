module TasksHelper
  def sortByDateLink
    title = params[:date] === 'asc' ? t('.sortByDateDesc') : t('.sortByDateAsc')
    dateSort = params[:date] == 'asc' ? 'desc' : 'asc' 
    link_to title, date: dateSort
  end
end
