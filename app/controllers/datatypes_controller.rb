class DatatypesController < ApplicationController
  def index
    @datatypes = Datatype.all

    render("datatypes/index.html.erb")
  end

  def show
    @datatype = Datatype.find(params[:id])

    render("datatypes/show.html.erb")
  end

  def new
    @datatype = Datatype.new

    render("datatypes/new.html.erb")
  end

  def create
    @datatype = Datatype.new

    @datatype.datatype = params[:datatype]

    save_status = @datatype.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/datatypes/new", "/create_datatype"
        redirect_to("/datatypes")
      else
        redirect_back(:fallback_location => "/", :notice => "Datatype created successfully.")
      end
    else
      render("datatypes/new.html.erb")
    end
  end

  def edit
    @datatype = Datatype.find(params[:id])

    render("datatypes/edit.html.erb")
  end

  def update
    @datatype = Datatype.find(params[:id])

    @datatype.datatype = params[:datatype]

    save_status = @datatype.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/datatypes/#{@datatype.id}/edit", "/update_datatype"
        redirect_to("/datatypes/#{@datatype.id}", :notice => "Datatype updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Datatype updated successfully.")
      end
    else
      render("datatypes/edit.html.erb")
    end
  end

  def destroy
    @datatype = Datatype.find(params[:id])

    @datatype.destroy

    if URI(request.referer).path == "/datatypes/#{@datatype.id}"
      redirect_to("/", :notice => "Datatype deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Datatype deleted.")
    end
  end
end
