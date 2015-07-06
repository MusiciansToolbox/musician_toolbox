module Authentication

  private def teacher_logged_in?

    unless current_user.type == "Teacher"
      redirect_to user_session_path, notice: 'Please login to view this page.'
    end
  end

  private def parent_logged_in?
    unless current_user.type == "Parent"
      redirect_to root_path, notice: 'Please login to view this page.'
    end
  end

  private def student_logged_in?
    unless current_user.type == "Student"
      redirect_to root_path, notice: 'Please login to view this page.'
    end
  end

end
