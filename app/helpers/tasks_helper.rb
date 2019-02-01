module TasksHelper
  def sort_by_date_link
    title = params[:date] === 'asc' ? t('.sort_by_date_desc') : t('.sort_by_date_asc')
    dateSort = params[:date] == 'asc' ? 'desc' : 'asc' 
    link_to title, date: dateSort
  end
end
