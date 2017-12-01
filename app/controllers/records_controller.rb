class RecordsController < ApplicationController
  def index
    @records = Record.all

    render("records/index.html.erb")
  end

  def show
    @record = Record.find(params[:id])

    render("records/show.html.erb")
  end

  def new
    @record = Record.new

    render("records/new.html.erb")
  end

  def create
    @record = Record.new

    @record.datetime = params[:datetime]
    @record.data = params[:data]
    @record.subject_id = params[:subject_id]
    @record.data_type_id = params[:data_type_id]

    save_status = @record.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/records/new", "/create_record"
        redirect_to("/records")
      else
        redirect_back(:fallback_location => "/", :notice => "Record created successfully.")
      end
    else
      render("records/new.html.erb")
    end
  end

  def edit
    @record = Record.find(params[:id])

    render("records/edit.html.erb")
  end

  def update
    @record = Record.find(params[:id])

    @record.datetime = params[:datetime]
    @record.data = params[:data]
    @record.subject_id = params[:subject_id]
    @record.data_type_id = params[:data_type_id]

    save_status = @record.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/records/#{@record.id}/edit", "/update_record"
        redirect_to("/records/#{@record.id}", :notice => "Record updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Record updated successfully.")
      end
    else
      render("records/edit.html.erb")
    end
  end

  def destroy
    @record = Record.find(params[:id])

    @record.destroy

    if URI(request.referer).path == "/records/#{@record.id}"
      redirect_to("/", :notice => "Record deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Record deleted.")
    end
  end
end
