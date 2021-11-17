class EventsController < ApplicationController
  def index
    @evenement = Evenement.all
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

  def show
    # Méthodeui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    received_id = params[:id]
    @evenementall = Evenement.all
    @evenement = Evenement.find_by(id: params[:id])
    @attendance = Attendance.find_by(evenement_id: params[:id])
    puts @attendance
    @evenement_title = @evenement.title 
    @evenement_description = @evenement.description
    @start_date = @evenement.start_date
    @duration = @evenement.duration
    @location = @evenement.location
    @price = @evenement.price
    @admin = @evenement.admin.first_name
    @adminid = @evenement.admin_id
    @user = @attendance.user_id
 
  end


  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    @title= params[:title]
    @duration = params[:duration]
    @start_date = DateTime.now +params[:start_date].to_i
    @location = params[:location]
    @price= params[:price]
    @description = params[:description]
    @user= current_user.id
    @evenement = Evenement.new(title: @title, start_date:@start_date, duration:@duration, location: @location, price:@price , description: @description, admin_id: @user)
  
      if @evenement.save
        Attendance.create(evenement_id: @evenement.id, user_id:@user)
        redirect_to '/'
      
      else
        render "index"
      end
  end
  

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end
end