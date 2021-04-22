defmodule InmanaWeb.Router do
  use InmanaWeb, :router

  pipeline :api do
    # só aceita json
    plug(:accepts, ["json"])
  end

  scope "/api", InmanaWeb do
    pipe_through(:api)

    get("/", WelcomeController, :index)

    # post "/restaurants", RestaurantsController, :create

    # post "/supplies", SuppliesController, :create
    # get "/supplies/:id", SuppliesController, :show

    # mix phx.routes
    resources("/restaurants", RestaurantsController, only: [:index, :create, :show])
    resources("/supplies", SuppliesController, only: [:index, :create, :show])

    '''
    supplies_path  GET     /api/supplies           InmanaWeb.SuppliesController :index
    supplies_path  GET     /api/supplies/:id/edit  InmanaWeb.SuppliesController :edit
    supplies_path  GET     /api/supplies/new       InmanaWeb.SuppliesController :new
    supplies_path  GET     /api/supplies/:id       InmanaWeb.SuppliesController :show
    supplies_path  POST    /api/supplies           InmanaWeb.SuppliesController :create
    supplies_path  PATCH   /api/supplies/:id       InmanaWeb.SuppliesController :update
                   PUT     /api/supplies/:id       InmanaWeb.SuppliesController :update
    supplies_path  DELETE  /api/supplies/:id       InmanaWeb.SuppliesController :delete
    '''
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through([:fetch_session, :protect_from_forgery])
      live_dashboard("/dashboard", metrics: InmanaWeb.Telemetry)
    end
  end

  # Configuração Bamboo (Debug e-mails enviados)
  # Se estiver em ambiente de desenvolvimento, cria uma rota
  if Mix.env() == :dev do
    forward("/send_emails", Bamboo.SentEmailViewerPlug)
  end
end
