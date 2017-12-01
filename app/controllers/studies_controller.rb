class StudiesController < ApplicationController
  def index
    @studies = Study.all

    render("studies/index.html.erb")
  end

  def show
    @study = Study.find(params[:id])

    render("studies/show.html.erb")
  end

  def new
    @study = Study.new

    render("studies/new.html.erb")
  end

  def create
    @study = Study.new

    @study.user_id = params[:user_id]
    @study.title = params[:title]
    @study.datatype_id = params[:datatype_id]

    save_status = @study.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/studies/new", "/create_study"
        redirect_to("/studies")
      else
        redirect_back(:fallback_location => "/", :notice => "Study created successfully.")
      end
    else
      render("studies/new.html.erb")
    end
  end

  def edit
    @study = Study.find(params[:id])

    render("studies/edit.html.erb")
  end

  def update
    @study = Study.find(params[:id])

    @study.user_id = params[:user_id]
    @study.title = params[:title]
    @study.datatype_id = params[:datatype_id]

    save_status = @study.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/studies/#{@study.id}/edit", "/update_study"
        redirect_to("/studies/#{@study.id}", :notice => "Study updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Study updated successfully.")
      end
    else
      render("studies/edit.html.erb")
    end
  end

  def destroy
    @study = Study.find(params[:id])

    @study.destroy

    if URI(request.referer).path == "/studies/#{@study.id}"
      redirect_to("/", :notice => "Study deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Study deleted.")
    end
  end
end