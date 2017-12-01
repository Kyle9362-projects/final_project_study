class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all

    render("subjects/index.html.erb")
  end

  def show
    @record = Record.new
    @subject = Subject.find(params[:id])

    render("subjects/show.html.erb")
  end

  def new
    @subject = Subject.new

    render("subjects/new.html.erb")
  end

  def create
    @subject = Subject.new

    @subject.firstname = params[:firstname]
    @subject.lastname = params[:lastname]
    @subject.study_id = params[:study_id]

    save_status = @subject.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/subjects/new", "/create_subject"
        redirect_to("/subjects")
      else
        redirect_back(:fallback_location => "/", :notice => "Subject created successfully.")
      end
    else
      render("subjects/new.html.erb")
    end
  end

  def edit
    @subject = Subject.find(params[:id])

    render("subjects/edit.html.erb")
  end

  def update
    @subject = Subject.find(params[:id])

    @subject.firstname = params[:firstname]
    @subject.lastname = params[:lastname]
    @subject.study_id = params[:study_id]

    save_status = @subject.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/subjects/#{@subject.id}/edit", "/update_subject"
        redirect_to("/subjects/#{@subject.id}", :notice => "Subject updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Subject updated successfully.")
      end
    else
      render("subjects/edit.html.erb")
    end
  end

  def destroy
    @subject = Subject.find(params[:id])

    @subject.destroy

    if URI(request.referer).path == "/subjects/#{@subject.id}"
      redirect_to("/", :notice => "Subject deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Subject deleted.")
    end
  end
end
